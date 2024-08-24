import { Request, Response } from "express"
import { fetchTags } from "../models/tags"

export const getTags = async (req: Request, res: Response) => {
    try {
        const tags = await fetchTags()
        if (tags.length) {
            res
                .status(200)
                .send(tags)
        }
        else {
            res
                .status(404)
                .send('No tags found')
        }
    } catch (error) {
        console.error(error)
    }
}
