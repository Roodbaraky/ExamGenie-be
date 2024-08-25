import { NextFunction, Request, Response } from "express"
import { fetchQuestions, postQuestions } from "../models/questions"
import { fetchTagsFromSow } from "../models/tags"


export const getQuestions = async (req: Request, res: Response, next: NextFunction) => {
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
            next(Error('Questions corresponding to filters not found'))
        }
        else if (questions) {
            res
                .status(200)
                .send(questions)
        }
    } catch (error) {
        next(error)
    }


}

export const addQuestions = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const questions = req.body
        const stringifiedToken = req.headers['authorization']?.split(' ')[1]
        const token = stringifiedToken ? JSON.parse(stringifiedToken) : null
        const questionIds = token ? await postQuestions(questions, token) : []

        res
            .status(200)
            .send(questionIds)

    } catch (error) {
        next(error)

    }
}