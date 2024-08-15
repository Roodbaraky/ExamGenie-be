import { Request, Response } from "express"
import { fetchQuestions, fetchTags } from "../models/questions"
import { PostgrestError } from "@supabase/supabase-js"


export const getQuestions = async (req: Request, res: Response) => {

    try {
        console.log(req.body, '<--- body')
        if (Object.keys(req.body).length === 0) {
            const questions = await fetchQuestions({})
            res
                .status(200)
                .send(questions)
            return
        }
        const { difficulties, className, contentType, recallPeriod, currentWeek, tags } = req.body
        const { limit } = req.query as { limit: string }
        const tagsToUse = tags && (!className && !recallPeriod)
            ? tags
            : (await fetchTags({ className, currentWeek, recallPeriod }))

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
        // console.log(error)
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