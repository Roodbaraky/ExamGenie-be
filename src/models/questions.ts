
import { supabase } from "../database/supabaseClient";

export type Difficulties = {
    foundation?: boolean;
    crossover?: boolean;
    higher?: boolean;
    extended?: boolean;
};

export type TagObject = {
    tag: string;
};
export interface FetchQuestionsProps {
    tags?: TagObject[],
    difficulties?: Difficulties
}
export const areTagsValid = (tags: TagObject[]) => {
    if (!Array.isArray(tags)) return false;
    for (const tagObj of tags) {
        if (typeof tagObj !== 'object' || typeof tagObj.tag !== 'string' || !isNaN(+tagObj.tag)) {
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
export const fetchQuestions = async ({ tags = [], difficulties = defaultDifficulties }: FetchQuestionsProps = {}) => {
    console.log(tags, difficulties)

    if (tags.length && !areTagsValid(tags)) {
        console.log(tags, '<---')
        return Promise.reject(new Error('Invalid tags'));
    }

    if (Object.keys(difficulties).length && !areDifficultiesValid(difficulties)) {
        return Promise.reject(new Error('Invalid difficulties'));
    }

    try {
        let query = supabase
            .from('questions')
            .select(`
                id,
                difficulty,
                tags (tag)
            `);

        if (tags.length) {
            console.log(tags.length, 'tag length')
            const tagNames = tags.map((tagObj: TagObject) => tagObj.tag.toLowerCase());

            const orConditions = tagNames.map(tagName => `tag.ilike.%${tagName}%`).join(',');

            const { data: tagData, error: tagError } = await supabase
                .from('tags')
                .select('id')
                .or(orConditions);

            if (tagError) {
                throw tagError;
            }

            const tagIds = tagData?.map((x) => x.id);

            const { data: questionIdData, error: questionError } = await supabase
                .from('question_tags')
                .select('question_id')
                .in('tag_id', tagIds);

            if (questionError) {
                throw questionError;
            }

            query = query.in('id', questionIdData.map((x) => x.question_id));
        }

        const activeDifficulties = Object.keys(difficulties).filter(
            (key) => difficulties[key as keyof Difficulties]
        );

        if (activeDifficulties.length) {
            query = query.in('difficulty', activeDifficulties);
        }

        const { data: questionsData, error: questionsError } = await query;

        if (questionsError) {
            throw questionsError;
        }
        console.log(questionsData)
        return questionsData;
    } catch (error) {
        console.error('-->', error);
        return Promise.reject(error);
    }
};
