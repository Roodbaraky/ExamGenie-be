import dotenv from "dotenv";
import { supabase } from "../database/supabaseClient";
import { Difficulties, DifficultyLevel, FetchQuestionsProps, NewQuestion, Question } from "../types/Question";
import { convertFromBase64ToImage } from "../utils/utils";
import { areTagsValid } from "./tags";
import { checkBucketUploads, getImgURLFromId, uploadPNGsToBucket } from "../utils/bucketFuncs";
dotenv.config()


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


export const fetchQuestions = async ({
    tagsToUse = [],
    difficulties = defaultDifficulties,
    limit = 20,
}:
    FetchQuestionsProps
): Promise<Question[]> => {
    if (tagsToUse.length && !areTagsValid(tagsToUse)) {
        return Promise.reject(new Error('Invalid tags'));
    }

    if (Object.keys(difficulties).length && !areDifficultiesValid(difficulties)) {
        return Promise.reject(new Error('Invalid difficulties'));
    }

    if (isNaN(+limit) || +limit < 0) {
        return Promise.reject(new Error('Invalid limit'))
    }

    try {
        const activeDifficulties: DifficultyLevel[] = Object.keys(difficulties)
            .filter((key) => difficulties[key as DifficultyLevel])
            .map((key) => key as DifficultyLevel);



        const { data, error } = await supabase
            .rpc('fetch_questions', {
                input_tags: tagsToUse.length ? tagsToUse : null,
                difficulties: activeDifficulties.length ? activeDifficulties : null,
                limit_value: limit
            });

        if (error) {
            return Promise.reject(error)
        }

        const idsToFetchImagesOf = data.map((questionObject: Question) => questionObject.id)

        const questionImgUrls = await Promise.allSettled(idsToFetchImagesOf.map(
            async (questionId: number) => {
                return await getImgURLFromId(questionId, 'questions')
            }))

        const answerImgUrls = await Promise.allSettled(idsToFetchImagesOf.map(
            async (questionId: number) => {
                return await getImgURLFromId(questionId, 'answers')
            }))

        const combinedQuestionsObjectArr = data.map((questionObject: Question, index: number) => ({
            ...questionObject,
            URL: questionImgUrls[index].status === 'fulfilled'
                ? questionImgUrls[index].value
                : null
        }))

        const combinedAnswersObjectArr = data.map((answerObject: Question, index: number) => ({
            ...answerObject,
            URL: answerImgUrls[index].status === 'fulfilled'
                ? answerImgUrls[index].value
                : null
        }))

        return [combinedQuestionsObjectArr, combinedAnswersObjectArr]
    } catch (error) {
        return Promise.reject(error);
    }
};


const deleteEntriesForFailedUploads = async (itemIds: number[], table: string) => {
    const { data, error } = await supabase.from(table)
        .delete()
        .in('id', itemIds)
        .select()

    if (error) throw error
    if (data) {
        console.log('Successfully deleted:', data)
        return true
    }
}


export const postQuestions = async (questions: NewQuestion[]) => {
    try {
        const questionIds: number[] = []
        const tagIdsArr: number[][] = []
        const imgsArr: string[] = []
        for (const question of questions) {
            const { data: questionsData, error } = await supabase
                .from('questions')
                .insert({ id: Math.ceil(Date.now() + Math.random()), difficulty: question.difficulty })
                .select('id')
            //do better RNG          ^^
            if (error) throw error
            if (questionsData) questionIds.push(questionsData[0].id)

            const tagIds: number[] = []
            for (const tag of question.tags) {
                const { data: tagsData, error } = await supabase
                    .from('tags')
                    .select('id')
                    .eq('tag', tag)

                if (error) throw error
                if (tagsData) tagIds.push(tagsData[0].id)
            }
            tagIdsArr.push(tagIds)
            imgsArr.push(question.image ? question.image : '')
        }
        const questionTagsInsertArr = tagIdsArr.map((tags: number[], index) => {

            return tags.map((tagId: number) => {
                return {
                    question_id: questionIds[index],
                    tag_id: tagId
                }
            })
        }).flat()

        for (const questionTag of questionTagsInsertArr) {

            const { data: questionTagsData, error } = await supabase
                .from('question_tags')
                .insert(questionTag)
                .select('*')


            if (error) throw error
            if (!questionTagsData.length) throw error

        }

        const reconstructedImages = imgsArr.map((imgData) => convertFromBase64ToImage(imgData))

        await uploadPNGsToBucket(questionIds, reconstructedImages, 'questions')
        const imagesUploaded = await checkBucketUploads(questionIds, 'questions')
        if (!imagesUploaded) deleteEntriesForFailedUploads(questionIds, 'questions')
        return questionIds
    } catch (error) {
        return Promise.reject(error)
    }
}
