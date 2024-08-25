import { NextFunction, Request, Response } from "express"
import { fetchWeeks } from "../models/weeks"


export const getWeeksFromClassName = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { className } = req.query
        const weeks = await fetchWeeks(className as string)
        if (weeks) {
            res
                .status(200)
                .send(weeks)
        }
        else {
            next(Error('No weeks found'))
        }
    } catch (error) {
        next(error)
    }
}