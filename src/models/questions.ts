
import { ParsedQs } from "qs";
import { supabase } from "../database/supabaseClient";

export const isDifficultyValid = (difficulty: string | string[]) => {
    if (Array.isArray(difficulty)) {
        for (const diff of difficulty) {
            const isValid = isDifficultyValid(diff);
            if (!isValid) return false;
        }
    }
    else {
        if (difficulty && typeof difficulty !== 'string') return false;
        const validDifficulties = ['foundation', 'crossover', 'higher', 'extended', 'other']
        if (difficulty && !validDifficulties.includes(difficulty)) return false;
    }
    return true
}

export const fetchQuestions = async (query?: ParsedQs) => {
    const tag = query?.hasOwnProperty('tag') ? query.tag : null;
    const difficulty = query?.hasOwnProperty('difficulty') ? query.difficulty : null;
    if (tag && !isNaN(+tag)) {
        return Promise.reject(new Error('Invalid tag'));
    }

    const isValidDifficulty = isDifficultyValid(difficulty as string | string[]);
    if (difficulty && !isValidDifficulty) {
        return Promise.reject(new Error('Invalid difficulty'));
    }

    try {
        if (tag) {
            const { data: tagData, error: tagError } = await supabase
                .from('tags')
                .select('id')
                .ilike('tag', `%${tag}%`);

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

            let query = supabase
                .from('questions')
                .select(`
                    id,
                    difficulty,
                    tags (tag)
                    `)
                .in('id', questionIdData.map((x) => x.question_id));

            if (difficulty) {
                query = query.eq('difficulty', difficulty);
            }

            const { data: questionsData, error: questionsError } = await query;


            if (questionsError) {
                throw questionsError;
            }

            return questionsData;
        } else {
            let query = supabase
                .from('questions')
                .select(`
                    id,
                    difficulty,
                    tags (tag)
                    `)

            if (difficulty) {
                query = query.eq('difficulty', difficulty);
            }

            const { data: questionsData, error: questionsError } = await query;


            if (questionsError) {
                throw questionsError;
            }

            return questionsData;
        }
    } catch (error) {
        console.error('-->', error)
        return Promise.reject(error);
    }
};
