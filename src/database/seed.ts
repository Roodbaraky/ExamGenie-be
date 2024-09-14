import { seedData } from "./seedData";
import { supabaseSeedClient } from "./supabaseClient";
import fs from 'fs'
import path from 'path'

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

async function clearTable(tableName: string, primaryKey: string) {
    const { error } = await supabaseSeedClient
        .from(tableName)
        .delete()
        .neq(primaryKey, 0)

    if (error) console.error(`Error clearing table ${tableName}:`, error);
    else console.log(`${tableName} cleared.`);
}

async function clearBucket(bucketName: string, path = '') {
    try {
        const { data, error: listError } = await supabaseSeedClient
            .storage
            .from(bucketName)
            .list(path, { limit: 500 });
        if (listError) throw listError;

        if (data.length > 0) {
            const fileNames = data.map(file => `${path}${file.name}`);
            const { error: deleteError } = await supabaseSeedClient
                .storage
                .from(bucketName)
                .remove(fileNames);

            if (deleteError) throw deleteError;

            console.log(`Cleared files in bucket: ${bucketName}/${path}`);
        } else {
            console.log(`No files found in bucket: ${bucketName}/${path}`);
        }
    } catch (error) {
        console.error(`Error clearing bucket: ${bucketName}/${path}`, error);
    }
}

async function uploadImage(filePath: string, bucketName: string, destinationPath: string) {
    try {
        const fileName = path.basename(filePath);
        const fileContent = fs.readFileSync(filePath);

        const { error } = await supabaseSeedClient.storage
            .from(bucketName)
            .upload(destinationPath + fileName, fileContent, {
                cacheControl: '3600',
                upsert: true,
                contentType: 'image/png',
            });

        if (error) {
            console.error(`Error uploading ${fileName}:`, error);
            return;
        }

        console.log(`Successfully uploaded ${fileName}`);
    } catch (error) {
        console.error(`Failed to upload ${filePath}:`, error);
    }
}


async function insertQuestionImages(bucketName: string, destinationPath: string) {
    try {
        const files = fs.readdirSync('src/database/data/questionImages');

        for (const file of files) {
            const filePath = path.join('src/database/data/questionImages', file);


            await uploadImage(filePath, bucketName, destinationPath);
        }
    } catch (error) {
        console.error('Error uploading seed images:', error);
    }
}
async function insertAnswerImages(bucketName: string, destinationPath: string) {
    try {
        const files = fs.readdirSync('src/database/data/answerImages');

        for (const file of files) {
            const filePath = path.join('src/database/data/answerImages', file);


            await uploadImage(filePath, bucketName, destinationPath);
        }
    } catch (error) {
        console.error('Error uploading seed images:', error);
    }
}

async function insertQuestions() {
    const { data, error } = await supabaseSeedClient
        .from('questions')
        .insert(questions)
        .select()

    if (error) console.error('Error inserting questions:', error);
    else console.log('Questions inserted:', data);
}

async function insertTags() {
    const { data, error } = await supabaseSeedClient
        .from('tags')
        .insert(tags)
        .select()


    if (error) console.error('Error inserting tags:', error);
    else console.log('Tags inserted:', data);
}
async function insertQuestionTags() {
    const { data, error } = await supabaseSeedClient
        .from('question_tags')
        .insert(questionTags)
        .select()


    if (error) console.error('Error inserting question tags:', error);
    else console.log('Question tags inserted:', data);
}

async function insertClasses() {
    const { data, error } = await supabaseSeedClient
        .from('classes')
        .insert(classes)
        .select()


    if (error) console.error('Error inserting classes:', error);
    else console.log('Classes inserted:', data);
}

async function insertSoWs() {
    const { data, error } = await supabaseSeedClient
        .from('sow')
        .insert(sows)
        .select()


    if (error) console.error('Error inserting SoWs:', error);
    else console.log('SoWs inserted:', data);
}

async function insertWeeks() {
    const { data, error } = await supabaseSeedClient
        .from('weeks')
        .insert(weeks)
        .select()


    if (error) console.error('Error inserting weeks:', error);
    else console.log('Weeks inserted:', data);
}

async function insertWeeksTags() {
    const { data, error } = await supabaseSeedClient
        .from('weeks_tags')
        .insert(weeksTags)
        .select()


    if (error) console.error('Error inserting WeeksTags:', error);
    else console.log('WeeksTags inserted:', data);
}


async function insertClassSoWs() {
    const { data, error } = await supabaseSeedClient
        .from('class_sow')
        .insert(classSows)
        .select()


    if (error) console.error('Error inserting ClassSows:', error);
    else console.log('ClassSows inserted:', data);
}

async function insertSoWWeeks() {
    const { data, error } = await supabaseSeedClient
        .from('sow_weeks')
        .insert(sowWeeks)
        .select()


    if (error) console.error('Error inserting SowWeeks:', error);
    else console.log('SowWeeks inserted:', data);
}


export async function seedDatabase() {
    try {
        await clearTable('question_tags', 'question_id');
        await clearTable('sow_weeks', 'sow_id');
        await clearTable('class_sow', 'class_id');
        await clearTable('weeks_tags', 'tag_id');
        await clearTable('weeks', 'id');
        await clearTable('sow', 'id');
        await clearTable('classes', 'id');
        await clearTable('tags', 'id');
        await clearTable('questions', 'id');
        await clearBucket('questions', 'public/')
        await clearBucket('answers', 'public/')

        await insertQuestions()
        await insertTags()
        await insertClasses()
        await insertSoWs()
        await insertWeeks()
        await insertWeeksTags()
        await insertClassSoWs()
        await insertSoWWeeks()
        await insertQuestionTags()
        await insertQuestionImages('questions', 'public/')
        await insertAnswerImages('answers', 'public/')
    } catch (err) {
        console.error(err)
    }
}
seedDatabase()