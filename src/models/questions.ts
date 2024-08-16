
import dotenv from "dotenv";
import { supabase } from "../database/supabaseClient";
import { Question } from "../types/Question";
dotenv.config()

export type DifficultyLevel = 'foundation' | 'crossover' | 'higher' | 'extended';
export type Difficulties = {
    [key in DifficultyLevel]?: boolean;
};

export interface FetchQuestionsProps {
    tagsToUse?: string[],
    difficulties?: Difficulties,
    limit?: number | string,
    className?: string,
    contentType?: string,
    recallPeriod?: string | number
}

export interface FetchTagsProps {
    className: string,
    currentWeek: number,
    recallPeriod: number
}
export const areTagsValid = (tags: string[]): boolean => {
    if (!Array.isArray(tags)) return false;
    return tags.every(tag => typeof tag === 'string' && isNaN(Number(tag)));
};

export const areDifficultiesValid = (difficulties: Difficulties) => {
    const validDifficulties = ['foundation', 'crossover', 'higher', 'extended'];

    if (typeof difficulties !== 'object') return false;

    for (const key of Object.keys(difficulties)) {
        if (!validDifficulties.includes(key) || typeof difficulties[key as keyof Difficulties] !== 'boolean') {
            return false;
        }
    }
    return true;
};


const defaultDifficulties = {
    foundation: true,
    crossover: true,
    higher: true,
    extended: true
}
//does this name imply it should return true/false? Maybe refactor for this
export const areFetchTagsArgsValid = ({
    className,
    currentWeek,
    recallPeriod }: FetchTagsProps) => {
    if (typeof className !== 'string') return Promise.reject(new Error('Invalid className'));
    if (isNaN(+currentWeek)) return Promise.reject(new Error('Invalid currentWeek'));
    if (isNaN(+recallPeriod)) return Promise.reject(new Error('Invalid recallPeriod'));
}

export const checkIfClassExists = async (className: string) => {
    try {
        const { data, error } = await supabase
            .from('classes')
            .select('class_name')
            .eq('class_name', className)

        if (error) {
            return Promise.reject(error);
        }
        if (data && data.length === 0) {
            return Promise.reject('Class not found');

        }
    } catch (error) {
        return Promise.reject(error);
    }
}

export const fetchTags = async ({
    className,
    currentWeek,
    recallPeriod
}: FetchTagsProps) => {




    try {
        await areFetchTagsArgsValid(
            {
                className,
                currentWeek,
                recallPeriod
            }
        )
        //Is this strictly necessary, or just another db call that could slow down requests?
        //It shouldn't be possible to request a class that doesn't exist, because all existing classes are displayed.
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
export const fetchQuestions = async ({
    tagsToUse = [],
    difficulties = defaultDifficulties,
    limit = 20,
    className,
    contentType,
    recallPeriod,
}:
    FetchQuestionsProps
): Promise<Question[]> => {
    if (tagsToUse.length && !areTagsValid(tagsToUse)) {
        return Promise.reject(new Error('Invalid tags'));
    }
    
    if (Object.keys(difficulties).length && !areDifficultiesValid(difficulties)) {
        return Promise.reject(new Error('Invalid difficulties'));
    }

    if (isNaN(+limit) || +limit < 0) {
        return Promise.reject(new Error('Invalid limit'))
    }

    try {
        const activeDifficulties: DifficultyLevel[] = Object.keys(difficulties)
            .filter((key) => difficulties[key as DifficultyLevel])
            .map((key) => key as DifficultyLevel);
            
            
console.log(tagsToUse, '<--- tagsToUse')
        const { data, error } = await supabase
            .rpc('fetch_questions', {
                input_tags: tagsToUse.length ? tagsToUse : null,
                difficulties: activeDifficulties.length ? activeDifficulties : null,
                limit_value: limit
            });
console.log(data,'<-- data')
        if (error) {
            return Promise.reject(error)
        }
        const idsToFetchImagesOf = data.map((questionObject: Question) => questionObject.id)
        const questionImgUrls = await Promise.allSettled(idsToFetchImagesOf.map(async (questionId: number) => {
            const { data, error } = await supabase.storage
                .from('questions')
                .createSignedUrl(`public/${questionId}.png`, 60 * 60);

            if (error) {
                return Promise.reject(error)
            }
            return data.signedUrl
        }))
        return [data, questionImgUrls.filter(result => result.status === 'fulfilled')];
    } catch (error) {
        return Promise.reject(error);
    }
};
