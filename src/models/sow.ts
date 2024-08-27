import { supabase } from "../database/supabaseClient";
import { Token } from "../types/Auth";

export const addSow = () => {
    //insert into sow
    //--> returning id

    //insert 39 entries into weeks?
    //<-- depending on what year class the new sow is for (atm one SoW is one year)
    //--> retuning array of id (week_ids)

    //insert into weeks_tags
    //--> get tags - weeks from form and manipulate into a form we can insert into weeks_tags

    //insert return from insert into sow_weeks
    //--> insert sow_id from previous insert AND week_ids from inserts into weeks

    //update class_sow
    // --> with current class id (from form) and sow_id from previous return
}


export const updateSow = () => {

}
export interface Week {
    id: number;
    week_number: number;
    tags: string[];
    week_id?: number;
}


interface AddOrUpdateSowProps {
    className: string,
    tags: string[],
    weeks: Week[]
}
export const addOrUpdateSow = async (receivedSowData: AddOrUpdateSowProps, token: Token) => {

    if (token) supabase.auth.setSession(token)
    const { className, weeks } = receivedSowData

    const { data: currentSowData, error: currentSowError } = await supabase
        .rpc('get_sow_id_by_class_name', { classname: className });
    if (currentSowError) return Promise.reject(currentSowError)
    console.log(currentSowData)
    const currentSowId = currentSowData[0].sow_id
    let newSowId = null
    const yearMatch = className.match(/^\d+/);
    const yearGroup = yearMatch ? parseInt(yearMatch[0], 10) : null;
    if (currentSowId && currentSowId >= 1 && currentSowId <= 7) {
        console.log(`default sow: ${currentSowId}`)
        console.log('Need to create a new sow first...')
        console.log(`new weeks:`, weeks)


        if (yearGroup === null) {
            return Promise.reject(new Error("Invalid className format; unable to extract year."));
        }

        // change this to be an rpc with checking for id exists, instead of genning id from datenow
        const { data, error } = await supabase
            .from('sow')
            .insert({ id: Math.ceil(Date.now() + Math.random()), year: yearGroup })
            .select('id')
        if (error) return Promise.reject(error)
        console.log(data)
        newSowId = data[0]?.id
    }

    console.log(`Inserting new weeks data @ sow_id: ${newSowId}`)


    //insert 39 weeks into weeks and return their ids
    const weekNumbers = Array.from({ length: 39 }, (_, i) => i + 1);
    const { data: insertedWeekIds, error: insertingWeeksError } = await supabase
        .rpc('insert_weeks_returning_ids', { week_numbers: weekNumbers })

    if (insertingWeeksError) return Promise.reject(insertingWeeksError)
    console.log(insertedWeekIds, '<----')

    //Manipulate and insert tags into weeks_tags

    const tagIds = await Promise.all(weeks?.map(async (week) => {
        return Promise.all(week?.tags?.map(async (tag) => {
            const { data, error } = await supabase
                .from('tags')
                .select('id')
                .eq('tag', tag);

            if (error) {
                return Promise.reject(error);
            }

            return data[0].id;
        }));
    }));
    console.log(tagIds)

    const weeks_tags = await Promise.all(insertedWeekIds.map(async (week: { week_id: number }, weekIndex: number) => {
        const weekId = week.week_id
        const weekTagIds = tagIds[weekIndex]

        return Promise.all(weekTagIds.map(async (tagId) => {
            const { data, error } = await supabase
                .from('weeks_tags')
                .insert({ week_id: weekId, tag_id: tagId })
                .select('*')

            if (error) {
                return Promise.reject(error);
            }

            return data;
        }));
    }));
    console.log(weeks_tags)


    if (newSowId) {
        const sow_weeks = await Promise.all(insertedWeekIds.map(async (week: { week_id: number }) => {
            const weekId = week.week_id
            const { data, error } = await supabase
                .from('sow_weeks')
                .insert({ sow_id: newSowId, week_id: weekId })
                .select()

            if (error) return Promise.reject(error)

            return data
        }))

        console.log(sow_weeks, '<--- new sow_weeks')

        //Update class_sow with the new sow_id for the class

        const { data: classIdData, error: classIdError } = await supabase
            .from('classes')
            .select('id')
            .eq('class_name', className)
        if (classIdError) return Promise.reject(classIdError)
        const classId = classIdData[0].id
        console.log(classId)
        console.log(currentSowId)
        const { error: deleteError, data: deleted } = await supabase
            .from('class_sow')
            .delete()
            .eq('sow_id', currentSowId)
            .select()

        if (deleteError) {
            return Promise.reject(deleteError);
        }
        console.log(deleted, '<-- deleted')
        const { data: updatedClass_sow, error: updatedClass_sowError } = await supabase
            .from('class_sow')
            .insert({ class_id: classId, sow_id: newSowId })
            .select('sow_id')
        if (updatedClass_sowError) return Promise.reject(updatedClass_sowError)
        console.log(updatedClass_sow)
        return receivedSowData
    }

    if (!newSowId) {
        const sow_weeks = await Promise.all(insertedWeekIds.map(async (week: Week, index: number) => {

            const weekId = week.week_id
            const oldWeekId = weeks[index].week_id

            const { data, error } = await supabase
                .rpc('update_sow_week', {
                    current_sow_id: currentSowId,
                    old_week_id: oldWeekId,
                    new_week_id: weekId
                })

            if (error) return Promise.reject(error);
            return data
        }))
        console.log(currentSowId)
        if (currentSowId > 7) {
            //delete old entries from weeks_tags
            const deletedWeeksTags = await Promise.all(weeks.map(async (week: Week) => {
                const { data, error } = await supabase
                    .from('weeks_tags')
                    .delete()
                    .eq('week_id', week.week_id)
                    .select()

                if (error) return Promise.reject(error)
                return data
            })

            )
            console.log('deletedWeeksTags', deletedWeeksTags)
        }
        console.log(sow_weeks)
        console.log('same sow_id, no change!')
        return receivedSowData
    }
}


