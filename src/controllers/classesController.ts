import { NextFunction, Request, Response } from "express"
import { fetchClasses } from "../models/classes"

export const getClasses = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const classes = await fetchClasses()
        if (classes.length) {
            res
                .status(200)
                .send(classes)
        }
        else {
            next(Error('No classes found'))
        }
    } catch (error) {
        next(error)
    }
}