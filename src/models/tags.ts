
import { supabase } from "../database/supabaseClient";
import { FetchTagsFromSowProps } from "../types/Question";
import { checkIfClassExists } from "./classes";

export const areTagsValid = (tags: string[]): boolean => {
    if (!Array.isArray(tags)) return false;
    return tags.every(tag => typeof tag === 'string' && isNaN(Number(tag)));
};

export const fetchTags = async () => {
    const { data, error } = await supabase
        .from('tags')
        .select('*')
    if (error) {
        throw error
    }
    return data
}

export const fetchTagsFromSow = async ({
    className,
    currentWeek,
    recallPeriod
}: FetchTagsFromSowProps) => {

    try {
        await checkFetchTagsArgs(
            {
                className,
                currentWeek,
                recallPeriod
            }
        )

        await checkIfClassExists(className)

        const { data, error } = await supabase
            .rpc('fetch_filtered_tags', {
                classname: className,
                currentweek: currentWeek,
                recallperiod: recallPeriod
            })
        return data?.length
            ? data.map((tagObject: { tag: string }) => tagObject.tag)
            : Promise.reject(error);

    } catch (error) {
        return Promise.reject(error);
    }
}

export const checkFetchTagsArgs = ({
    className,
    currentWeek,
    recallPeriod }: FetchTagsFromSowProps) => {
    if (typeof className !== 'string') return Promise.reject(new Error('Invalid className'));
    if (isNaN(+currentWeek)) return Promise.reject(new Error('Invalid currentWeek'));
    if (isNaN(+recallPeriod)) return Promise.reject(new Error('Invalid recallPeriod'));
}