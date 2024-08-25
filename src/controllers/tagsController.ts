import { NextFunction, Request, Response } from "express"
import { fetchTags } from "../models/tags"

export const getTags = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const tags = await fetchTags()
        if (tags.length) {
            res
                .status(200)
                .send(tags)
        }
        else {
            next(Error('No tags found'))
        }
    } catch (error) {
        next(error)
    }
}
