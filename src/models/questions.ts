import dotenv from "dotenv";
import { supabase } from "../database/supabaseClient";
import { Question } from "../types/Question";
dotenv.config()

export type DifficultyLevel = 'foundation' | 'crossover' | 'higher' | 'extended';
export type Difficulties = {
    [key in DifficultyLevel]?: boolean;
};

export interface FetchQuestionsProps {
    tagsToUse?: string[],
    difficulties?: Difficulties,
    limit?: number | string,
    className?: string,
    contentType?: string,
    recallPeriod?: string | number
}

export interface FetchTagsFromSowProps {
    className: string,
    currentWeek: number,
    recallPeriod: number
}
export const areTagsValid = (tags: string[]): boolean => {
    if (!Array.isArray(tags)) return false;
    return tags.every(tag => typeof tag === 'string' && isNaN(Number(tag)));
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
//does this name imply it should return true/false? Maybe refactor for this
export const areFetchTagsArgsValid = ({
    className,
    currentWeek,
    recallPeriod }: FetchTagsFromSowProps) => {
    if (typeof className !== 'string') return Promise.reject(new Error('Invalid className'));
    if (isNaN(+currentWeek)) return Promise.reject(new Error('Invalid currentWeek'));
    if (isNaN(+recallPeriod)) return Promise.reject(new Error('Invalid recallPeriod'));
}

export const checkIfClassExists = async (className: string) => {
    try {
        const { data, error } = await supabase
            .from('classes')
            .select('class_name')
            .eq('class_name', className)

        if (error) {
            return Promise.reject(error);
        }
        if (data && data.length === 0) {
            return Promise.reject('Class not found');

        }
    } catch (error) {
        return Promise.reject(error);
    }
}

export const fetchTagsFromSow = async ({
    className,
    currentWeek,
    recallPeriod
}: FetchTagsFromSowProps) => {




    try {
        await areFetchTagsArgsValid(
            {
                className,
                currentWeek,
                recallPeriod
            }
        )
        //Is this strictly necessary, or just another db call that could slow down requests?
        //It shouldn't be possible to request a class that doesn't exist, because all existing classes are displayed.
        await checkIfClassExists(className)

        const { data, error } = await supabase
            .rpc('fetch_filtered_tags', {
                classname: className,
                currentweek: currentWeek,
                recallperiod: recallPeriod
            })

        return data?.length
            ? data.map((tagObject: { tag: string }) => tagObject.tag)
            : Promise.reject(error);

    } catch (error) {
        return Promise.reject(error);
    }
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
        const questionImgUrls = await Promise.allSettled(idsToFetchImagesOf.map(async (questionId: number) => {
            const { data, error } = await supabase.storage
                .from('questions')
                .createSignedUrl(`public/${questionId}.png`, 60 * 60);

            if (error) {
                return Promise.reject(error)
            }
            return data.signedUrl
        }))
        const combinedQuestionsObjectArr = data.map((questionObject: Question, index: number) => {
            questionObject.URL = questionImgUrls[index].status === 'fulfilled'
                ? questionImgUrls[index].value
                : null
            return questionObject
        })
        return combinedQuestionsObjectArr
    } catch (error) {
        return Promise.reject(error);
    }
};

const convertFromBase64ToImage = (dataString: string) => {
    const truncatedDataString = dataString.replace(/^data:image\/\w+;base64,/, '')
    const imageRepresentation = Buffer.from(truncatedDataString, 'base64')
    return imageRepresentation
}

interface NewQuestion extends Question {
    image: string
}

export const postQuestions = async (questions: NewQuestion[]) => {
    //iterate through questions
    try {
        const questionIds: number[] = []
        const tagIdsArr: number[][] = []
        const imgsArr: string[] = []
        for (const question of questions) {
            //insert all questions into questions (, difficulty)
            const { data: questionsData, error } = await supabase
                .from('questions')
                .insert({ id: Math.ceil(Date.now() + Math.random()), difficulty: question.difficulty })
                .select('id')
            //do better RNG          ^^
            if (error) throw error
            if (questionsData) questionIds.push(questionsData[0].id)

            const tagIds: number[] = []
            // //for all tags on question, retrieve tag_ids
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

        //insert all question tags into question_tags:
        // //insert entries into question_tags (question_id, tag_id)
        for (const questionTag of questionTagsInsertArr) {

            const { data: questionTagsData, error } = await supabase
                .from('question_tags')
                .insert(questionTag)
                .select('*')


            if (error) throw error
            if (!questionTagsData.length) throw error

        }
        const reconstructedImages = imgsArr.map((imgData) => convertFromBase64ToImage(imgData))
        // const imageDataArr = imgsArr.map((imgData) => imgData.replace(/^data:image\/\w+;base64,/, ''))
        // const reconstructedImages = imageDataArr.map((imgData) => Buffer.from(imgData, 'base64'))
        for (let i = 0; i < reconstructedImages.length; i++) {
            const { data, error } = await supabase.storage
                .from("questions")
                .upload(`public/${questionIds[i]}.png`, reconstructedImages[i], {
                    contentType: 'image/png',
                    cacheControl: '3600',

                });

            if (error) {
                console.error(
                    `Error uploading image for question ${questionIds[0]}:`,
                    error
                );
                return Promise.reject(error)
            } else {
                console.log(
                    `Successfully uploaded image for question ${questionIds[0]}:`,
                    data
                );
            }
        }
        //return questionIds via API (useful for testing purposes at the very least)
        return questionIds
    } catch (error) {
        return Promise.reject(error)
    }
}
