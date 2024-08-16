import { classes, questions, questionTags, tags } from "./seedData";
import { supabaseSeedClient } from "./supabaseClient";

async function insertQuestions() {
    const { data, error } = await supabaseSeedClient
        .from('questions')
        .insert(questions);

    if (error) console.error('Error inserting questions:', error);
    else console.log('Questions inserted:', data);
}

async function insertTags() {
    const { data, error } = await supabaseSeedClient
        .from('tags')
        .insert(tags);

    if (error) console.error('Error inserting tags:', error);
    else console.log('Tags inserted:', data);
}
async function insertQuestionTags() {
    const { data, error } = await supabaseSeedClient
        .from('question_tags')
        .insert(questionTags);

    if (error) console.error('Error inserting question tags:', error);
    else console.log('Question tags inserted:', data);
}

async function insertClasses() {
    const { data, error } = await supabaseSeedClient
        .from('classes')
        .insert(classes)

    if (error) console.error('Error inserting classes:', error);
    else console.log('Classes inserted:', data);
}
export async function seedDatabase() {
    try {
        await insertQuestions()
        await insertTags()
        await insertQuestionTags()
        await insertClasses()
    } catch (err) {
        console.error(err)
    }
}
seedDatabase()