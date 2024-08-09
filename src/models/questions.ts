
import { supabase } from "../database/supabaseClient";
import { Question } from "../types/Question";

export type Difficulties = {
    foundation?: boolean;
    crossover?: boolean;
    higher?: boolean;
    extended?: boolean;
};


export interface FetchQuestionsProps {
    tags?: string[],
    difficulties?: Difficulties
    limit?: number
}
export const areTagsValid = (tags: string[]) => {
    if (!Array.isArray(tags)) return false;
    for (const tag of tags) {
        if (typeof tag !== 'string' || !isNaN(+tag)) {
            return false;
        }
    }
    return true;
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
export const fetchQuestions = async (tags: string[] = [], difficulties: Difficulties = defaultDifficulties, limit: number = 20): Promise<
    Question[]> => {

    if (tags.length && !areTagsValid(tags)) {
        return Promise.reject(new Error('Invalid tags'));
    }

    if (Object.keys(difficulties).length && !areDifficultiesValid(difficulties)) {
        return Promise.reject(new Error('Invalid difficulties'));
    }

    if (isNaN(limit) || limit < 0) {
        return Promise.reject(new Error('Invalid limit'))
    }

    try {
        const activeDifficulties = Object.keys(difficulties).filter(
            (key) => difficulties[key]
        );

        const { data, error } = await supabase
            .rpc('fetch_questions', {
                input_tags: tags.length ? tags : null,
                difficulties: activeDifficulties.length ? activeDifficulties : null,
                limit_value: limit
            });

        if (error) {
            throw error;
        }
        
         return data;
    } catch (error) {
        console.error('-->', error);
        return Promise.reject(error);
    }
};
