import { supabase } from "../database/supabaseClient";
import { Difficulties, DifficultyLevel, FetchQuestionsProps, NewQuestion, Question } from "../types/Question";
import { checkBucketUploads, getImgURLFromId, uploadPNGsToBucket } from "../utils/bucketFuncs";
import { convertFromBase64ToImage } from "../utils/utils";
import { areTagsValid } from "./tags";
import { QuestionTag } from "../database/data/questionTags";
import { Token } from "../types/Auth";



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

export const validateFetchQuestionsInputs = (tagsToUse: string[], difficulties: Difficulties, limit: number | string) => {
    if (tagsToUse.length && !areTagsValid(tagsToUse)) {
        return Promise.reject(Error('Invalid tags'));
    }

    if (Object.keys(difficulties).length && !areDifficultiesValid(difficulties)) {
        return Promise.reject(Error('Invalid difficulties'));
    }

    if (isNaN(+limit) || +limit < 0) {
        return Promise.reject(Error('Invalid limit'))
    }
}

export const convertDifficultiesObjectIntoActiveDifficulties = (difficulties: Difficulties) => {
    return Object.keys(difficulties)
        ?.filter((key) => difficulties[key as DifficultyLevel])
        ?.map((key) => key as DifficultyLevel);
}

export const fetchQuestions = async ({
    tagsToUse = [],
    difficulties = defaultDifficulties,
    limit = 20,

}:
    FetchQuestionsProps
): Promise<Question[]> => {
    await validateFetchQuestionsInputs(tagsToUse, difficulties, limit)
    try {
        const activeDifficulties: DifficultyLevel[] = convertDifficultiesObjectIntoActiveDifficulties(difficulties)
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

        const [questionImgUrls, answerImgUrls] = await Promise.all([
            Promise.allSettled(idsToFetchImagesOf.map(
                async (questionId: number) => {
                    return await getImgURLFromId(questionId, 'questions')
                })),
            Promise.allSettled(idsToFetchImagesOf.map(
                async (questionId: number) => {
                    return await getImgURLFromId(questionId, 'answers')
                }))
        ])

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

export const deleteEntriesForFailedUploads = async (itemIds: number[], table: string) => {
    const { data, error } = await supabase.from(table)
        .delete()
        .in('id', itemIds)
        .select()

    if (error) return Promise.reject(error)
    if (data) {
        console.log('Successfully deleted:', data)
        return true
    }
}

export const fetchTagIdsFromQuestion = async (question: Question) => {
    const tagIds: number[] = []
    for (const tag of question.tags) {
        const { data: tagsData, error } = await supabase
            .from('tags')
            .select('id')
            .eq('tag', tag)
        if (error) return Promise.reject(error)
        if (tagsData) tagIds.push(tagsData[0].id)
    }
    return tagIds
}

export const insertQuestions = async (question: Question, token?: Token) => {
    if (token) supabase.auth.setSession(token)
    const { data: questionsData, error } = await supabase
        .from('questions')
        .insert({ id: Math.ceil(Date.now() + Math.random()), difficulty: question.difficulty })
        .select('id')
    //do better RNG          ^^
    if (error) return Promise.reject(error)
    if (questionsData) return questionsData[0].id
}

export const insertQuestionTags = async (questionTag: QuestionTag) => {
    const { data: questionTagsData, error } = await supabase
        .from('question_tags')
        .insert(questionTag)
        .select('*')
    if (error) return Promise.reject(error)
    if (!questionTagsData.length) return Promise.reject(Error('Failed to insert questionTags'))
}

export const checkQuestionObjectIsValid = async (question: NewQuestion) => {
    if (question?.tags?.length === 0) return Promise.reject(Error('Invalid tags on posted question/s'))
    if (!question?.difficulty) return Promise.reject(Error('Invalid difficulty on posted question/s'))
    if (!question?.image || !question?.image?.includes('data:image/png;base64')) return Promise.reject(Error('Invalid image on posted question/s'))
}

export const postQuestions = async (questions: NewQuestion[], token: Token) => {
    try {
        const questionIds: number[] = []
        const tagIdsArr: number[][] = []
        const imgsArr: string[] = []
        const answerImgsArr: string[] = []
        for (const question of questions) {
            await checkQuestionObjectIsValid(question)
            const questionId = await insertQuestions(question, token)
            questionIds.push(questionId)
            const tagIds = await fetchTagIdsFromQuestion(question)
            tagIdsArr.push(tagIds)
            imgsArr.push(question.image ? question.image : '')
            answerImgsArr.push(question.answerImage ? question.answerImage : '')
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
            await insertQuestionTags(questionTag)
        }

        const reconstructedImages = imgsArr.map((imgData) => convertFromBase64ToImage(imgData))
        const reconstructedAnswerImages = answerImgsArr.map((imgData) => convertFromBase64ToImage(imgData))
        await Promise.all([
            uploadPNGsToBucket(questionIds, reconstructedImages, 'questions'),
            uploadPNGsToBucket(questionIds, reconstructedAnswerImages, 'answers')
        ])
        const imagesUploaded = await checkBucketUploads(questionIds, 'questions')
        if (!imagesUploaded) deleteEntriesForFailedUploads(questionIds, 'questions')
        return questionIds
    } catch (error) {
        return Promise.reject(error)
    }
}
