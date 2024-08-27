import { NextFunction, Request, Response } from "express";
import { addOrUpdateSow } from "../models/sow";

export const changeSow = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const data = req.body
        console.log(data)
        const stringifiedToken = req.headers['authorization']?.split(' ')[1]
        const token = stringifiedToken ? JSON.parse(stringifiedToken) : null
        const updatedSow = await addOrUpdateSow(data, token)
        console.log(updatedSow)
        res.status(200)
            .send(updatedSow)
    } catch (error) {
        next(error)
    }

}
