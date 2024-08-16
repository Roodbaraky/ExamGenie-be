import { seedData } from "./seedData";
import { supabaseSeedClient } from "./supabaseClient";

export const {
    questions,
    tags,
    questionTags,
    classes,
    sows,
    weeks,
    weeksTags,
    sowWeeks,
    classSows
} = seedData

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

async function insertSoWs() {
    const { data, error } = await supabaseSeedClient
        .from('sow')
        .insert(sows)

    if (error) console.error('Error inserting SoWs:', error);
    else console.log('SoWs inserted:', data);
}

async function insertWeeks() {
    const { data, error } = await supabaseSeedClient
        .from('weeks')
        .insert(weeks)

    if (error) console.error('Error inserting weeks:', error);
    else console.log('Weeks inserted:', data);
}

async function insertWeeksTags() {
    const { data, error } = await supabaseSeedClient
        .from('weeks_tags')
        .insert(weeksTags)

    if (error) console.error('Error inserting WeeksTags:', error);
    else console.log('WeeksTags inserted:', data);
}


async function insertClassSoWs() {
    const { data, error } = await supabaseSeedClient
        .from('class_sow')
        .insert(classSows)

    if (error) console.error('Error inserting ClassSows:', error);
    else console.log('ClassSows inserted:', data);
}

async function insertSoWWeeks() {
    const { data, error } = await supabaseSeedClient
        .from('sow_weeks')
        .insert(sowWeeks)

    if (error) console.error('Error inserting SowWeeks:', error);
    else console.log('SowWeeks inserted:', data);
}


export async function seedDatabase() {
    try {
        await insertQuestions()
        await insertTags()
        await insertClasses()
        await insertSoWs()
        await insertWeeks()
        await insertWeeksTags()
        await insertClassSoWs()
        await insertSoWWeeks()
        await insertQuestionTags()
    } catch (err) {
        console.error(err)
    }
}
seedDatabase()