import { questions, questionTags, tags } from "./seedData";
import { supabase } from "./supabaseClient";

async function insertQuestions() {
    const { data, error } = await supabase
        .from('questions')
        .insert(questions);

    if (error) console.error('Error inserting questions:', error);
    else console.log('Questions inserted:', data);
}

async function insertTags() {
    const { data, error } = await supabase
        .from('tags')
        .insert(tags);

    if (error) console.error('Error inserting tags:', error);
    else console.log('Tags inserted:', data);
}
async function insertQuestionTags() {
    const { data, error } = await supabase
        .from('question_tags')
        .insert(questionTags);

    if (error) console.error('Error inserting question tags:', error);
    else console.log('Question tags inserted:', data);
}

export async function seedDatabase() {
    try {

        await insertQuestions()
        await insertTags()
        await insertQuestionTags()
    } catch (err) {
        console.error(err)
    }
}
seedDatabase()