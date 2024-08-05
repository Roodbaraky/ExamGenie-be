import { Request, Response } from "express"
import { fetchQuestions } from "../models/questions"
import { PostgrestError } from "@supabase/supabase-js"

export const getQuestions = async (req: Request, res: Response) => {

    const tag = req.query.hasOwnProperty('tag')
        ? req.query.tag?.toString()
        : null

    try {
        const questions = await fetchQuestions(tag)
        if (Array.isArray(questions) && !questions.length) {
            res
                .status(404)
                .send('Questions corresponding to tag not found')
        }
        else {

            res
                .status(200)
                .send(questions)
        }
    } catch (error) {
        if ((error as PostgrestError).details === 'The result contains 0 rows') {
            res
                .status(404)
                .send('Results not found')
        }
        else {
            res
                .status(500)
                .send('Internal Server Error')
        }
    }

}