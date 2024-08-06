
import { supabase } from "../database/supabaseClient"

export const fetchQuestions = async (tag: string | null | undefined) => {
    if (tag&&typeof tag!=='string') {
        throw new Error('Invalid tag')
    }
    if (tag) {
        const { data: tagData, error: tagError } = await supabase
            .from('tags')
            .select('id')
            .ilike('tag', `%${tag}%`)
            

        if (tagError) {
            console.error('Error fetching tag:', tagError);
            return Promise.reject(tagError)

        }

        const tagIds = tagData?.map((x) => x.id);
        const { data: questionIdData, error: questionError } = await supabase
            .from('question_tags')
            .select('question_id')
            .in('tag_id', tagIds);

        if (questionError) {
            console.error('Error fetching question Ids:', questionError);
            return Promise.reject(questionError)
        }
        const { data: questionsData, error: questionsError } = await supabase
            .from('questions')
            .select('*')
            .in('id', questionIdData.map((x) => x.question_id))

        if (questionsData) {
            return questionsData
        }

        if (questionsError) {
            console.error('Error fetching questions', questionsError)
            return Promise.reject(questionsError)
        }

    }
    else {

        const { data, error } = await supabase
            .from('questions')
            .select('*')
        if (data) {
            return data
        }
        if (error) {
            return error
        }
    }
}