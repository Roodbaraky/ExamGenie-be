import { Request, Response } from "express"
import { fetchQuestions } from "../models/questions"
import { PostgrestError } from "@supabase/supabase-js"

export const getQuestions = async (req: Request, res: Response) => {

    try {
        const questions = await fetchQuestions(req.body)
        if (questions && !questions.length) {
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
            res
                .status(500)
                .send('Internal Server Error')
        }
    }

}