import { NextFunction, Request, Response } from "express"
import { fetchClasses } from "../models/classes"

export const getClasses = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const stringifiedToken = req.headers['authorization']?.split(' ')[1]
        const token = stringifiedToken ? JSON.parse(stringifiedToken) : null
        const classes = await fetchClasses(token)
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