import { Request, Response } from "express"
import { fetchQuestions, fetchTagsFromSow, postQuestions } from "../models/questions"
import { PostgrestError } from "@supabase/supabase-js"


export const getQuestions = async (req: Request, res: Response) => {

    try {
        if (Object.keys(req.body).length === 0) {
            const questions = await fetchQuestions({})
            res
                .status(200)
                .send(questions)
            return
        }
        const { difficulties, className, recallPeriod, currentWeek, tags } = req.body
        const { limit } = req.query as { limit: string }
        const tagsToUse = tags && (!className && !recallPeriod)
            ? tags
            : (await fetchTagsFromSow({ className, currentWeek, recallPeriod }))

        const questions = await fetchQuestions({ tagsToUse, difficulties, limit })
        if (!questions || questions.length === 0) {
            res
                .status(404)
                .send('Questions corresponding to filters not found')
        }
        else if (questions) {
            res
                .status(200)
                .send(questions)
        }
    } catch (error) {
        console.log(error)
        const err = error as Error
        if (err.message === 'Invalid tags' || err.message === 'Invalid difficulties') {
            res.status(400).send(err.message)
        }
        else if ((error as PostgrestError).details === 'The result contains 0 rows') {
            res
                .status(404)
                .send('Results not found')
        }
        else {
            console.error(err)
            res
                .status(500)
                .send('Internal Server Error')
        }
    }

}

export const addQuestions = async (req: Request, res: Response) => {
    try {
        const questions = req.body
        const questionIds = await postQuestions(questions)

        res
            .status(200)
            .send(questionIds)

    } catch (error) {
        console.error(error)
        res
            .status(500)
            .send(error)
    }

}