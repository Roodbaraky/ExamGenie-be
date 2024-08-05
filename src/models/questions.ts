
import { supabase } from "../database/supabaseClient"

export const fetchQuestions = async (tag: string | null | undefined) => {
    if (tag) {
        // console.log(tag)
        const { data: tagData, error: tagError } = await supabase
            .from('tags')
            .select('id')
            .ilike('tag', `%${tag}%`)
            .single();

        if (tagError) {
            console.error('Error fetching tag:', tagError);
            return;
        }

        const tagId = tagData?.id;
        const { data: questionIdData, error: questionError } = await supabase
            .from('question_tags')
            .select('question_id')
            .eq('tag_id', tagId);

        if (questionError) {
            console.error('Error fetching question Ids:', questionError);
            return;
        }
        // console.log(questionIdData)
        // console.log(questionIdData.map((x) => x.question_id))
        const { data: questionsData, error: questionsError } = await supabase
            .from('questions')
            .select('*')
            .in('id', questionIdData.map((x) => x.question_id))

        if (questionsData) {
            return questionsData
        }

        if (questionsError) {
            console.error('Error fetching questions', questionsError)
            return;
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
            console.error(error)
        }
    }
}