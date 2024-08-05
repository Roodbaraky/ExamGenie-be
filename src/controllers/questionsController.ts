import { Request, Response } from "express"
import { fetchQuestions } from "../models/questions"

export const getQuestions = async (req: Request, res: Response) => {

    const tag = req.query.hasOwnProperty('tag')
        ? req.query.tag?.toString()
        : null

    try {
        const questions = await fetchQuestions(tag)
        res
            .status(200)
            .send(questions)
    } catch (error) {
        console.error(error)
    }

}