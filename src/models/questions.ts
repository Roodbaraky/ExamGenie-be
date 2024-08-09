
import { supabase } from "../database/supabaseClient";
import { Question } from "../types/Question";

export type DifficultyLevel = 'foundation' | 'crossover' | 'higher' | 'extended';
export type Difficulties = {
    [key in DifficultyLevel]?: boolean;
};


export interface FetchQuestionsProps {
    tags?: string[],
    difficulties?: Difficulties
    limit?: number
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
        const activeDifficulties: DifficultyLevel[] = Object.keys(difficulties)
            .filter((key) => difficulties[key as DifficultyLevel])
            .map((key) => key as DifficultyLevel);

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
