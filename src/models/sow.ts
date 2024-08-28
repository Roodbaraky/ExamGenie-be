import { supabase } from "../database/supabaseClient";
import { Token } from "../types/Auth";


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
interface UpdateSowProps {
    weekIds: number[],
    weeks: Week[],
    sowId: number,
    className: string
}

export const updateSow = async ({ weekIds, weeks, sowId }: UpdateSowProps) => {
    const newSowWeeks = await updateSowWeeks(weekIds, weeks, sowId)
    console.log(newSowWeeks, '<--- newSowWeeks')
    const deletedWeeksTags = await deleteOldWeeksTags(weeks)
    console.log(deletedWeeksTags, '<--- deletedWeeksTags')
    console.log('same sow_id, no change!')
    return 
}

export const updateSowWeeks = async (weekIds: number[], weeks: Week[], sowId: number) => {
    return await Promise.all(weekIds.map(async (weekId: number, index: number) => {
        const oldWeekId = weeks[index].week_id
        const { data, error } = await supabase
            .rpc('update_sow_week', {
                current_sow_id: sowId,
                old_week_id: oldWeekId,
                new_week_id: weekId
            })

        if (error) return Promise.reject(error);
        return data
    }))
}
interface AddSowProps {
    yearGroup: number,
    weekIds: number[],
    className: string,
    oldSowId: number,
    weeks: Week[]
}
export const addSow = async ({ yearGroup, weekIds, className, oldSowId }: AddSowProps) => {
    const newSowId = await insertNewSow(yearGroup)
    const sowWeeks = await insertSoWWeeks(weekIds, newSowId)
    console.log(sowWeeks, '<--- new sow_weeks')
    const classId = await getClassIdFromClassName(className)
    console.log(classId, '<--- class_id')
    const deleted = await deleteClassSow(oldSowId)
    console.log(deleted, '<-- deleted')
    const insertedClassSow = await insertClassSow(classId, newSowId)
    console.log(insertedClassSow, '<--- new class_sow')
    return 
}

export const insertNewSow = async (yearGroup: number) => {
    const { data, error } = await supabase
        .from('sow')
        .insert({ id: Math.ceil(Date.now() + Math.random()), year: yearGroup })
        .select('id')
    if (error) return Promise.reject(error)
    return data[0]?.id
}

export const insertNewWeeks = async () => {
    const weekNumbers = Array.from({ length: 39 }, (_, i) => i + 1);
    const { data: insertedWeekIds, error: insertingWeeksError } = await supabase
        .rpc('insert_weeks_returning_ids', { week_numbers: weekNumbers })
    if (insertingWeeksError) return Promise.reject(insertingWeeksError)
    return insertedWeekIds.map((week: Week) => week.week_id)
}

export const getTagIdsFromTags = async (weeks: Week[]) => {
    return await Promise.all(weeks?.map(async (week) => {
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
}

export const insertWeeksTags = async (weekIds: number[], tagIds: number[][]) => {
    return await Promise.all(weekIds.map(async (weekId, weekIndex: number) => {
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
}


export const deleteOldWeeksTags = async (weeks: Week[]) => {
    return await Promise.all(weeks.map(async (week: Week) => {
        const { data, error } = await supabase
            .from('weeks_tags')
            .delete()
            .eq('week_id', week.week_id)
            .select()

        if (error) return Promise.reject(error)
        return data
    }))
}

export const insertSoWWeeks = async (weekIds: number[], sowId: number) => {
    return await Promise.all(weekIds.map(async (weekId: number) => {
        const { data, error } = await supabase
            .from('sow_weeks')
            .insert({ sow_id: sowId, week_id: weekId })
            .select()

        if (error) return Promise.reject(error)

        return data
    }))
}

export const getClassIdFromClassName = async (className: string) => {
    const { data: classIdData, error: classIdError } = await supabase
        .from('classes')
        .select('id')
        .eq('class_name', className)
    if (classIdError) return Promise.reject(classIdError)
    if (classIdData) return classIdData[0]?.id
}

export const deleteClassSow = async (sowId: number) => {
    const { error: deleteError, data: deleted } = await supabase
        .from('class_sow')
        .delete()
        .eq('sow_id', sowId)
        .select()
    if (deleteError) return Promise.reject(deleteError);
    if (deleted) return deleted
}

export const insertClassSow = async (classId: number, sowId: number) => {
    const { data: updatedClass_sow, error: updatedClass_sowError } = await supabase
        .from('class_sow')
        .insert({ class_id: classId, sow_id: sowId })
        .select('sow_id')
    if (updatedClass_sowError) return Promise.reject(updatedClass_sowError)
    if (updatedClass_sow) return updatedClass_sow
}

export const addOrUpdateSow = async ({ className, weeks }: AddOrUpdateSowProps, token: Token) => {

    if (token) supabase.auth.setSession(token)

    const { data: currentSowData, error: currentSowError } = await supabase
        .rpc('get_sow_id_by_class_name', { classname: className });

    if (currentSowError) return Promise.reject(currentSowError)

    const currentSowId = currentSowData[0].sow_id

    const yearMatch = className.match(/^\d+/);
    const yearGroup = yearMatch ? +yearMatch[0] : null
    if (!yearGroup) {
        return Promise.reject(new Error("Invalid className format; unable to extract year."));
    }

    const insertedWeekIds = await insertNewWeeks()
    const tagIds = await getTagIdsFromTags(weeks)
    const weeksTags = await insertWeeksTags(insertedWeekIds, tagIds)
    console.log(weeksTags, '<--- weeksTags')

    if (currentSowId && currentSowId >= 1 && currentSowId <= 7) {
        await addSow({ yearGroup, weekIds: insertedWeekIds, className, oldSowId: currentSowId, weeks });
    }
    if (currentSowId && currentSowId > 7) {
        await updateSow({ weekIds: insertedWeekIds, weeks, sowId: currentSowId, className })
    }
    return { className, weeks }
}


