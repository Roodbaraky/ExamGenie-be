import { Request, Response } from "express"
import { fetchWeeks } from "../models/weeks"


export const getWeeksFromClassName = async (req:Request, res:Response)=>{
try {
    const {className} = req.query
    const weeks = await fetchWeeks(className as string)
    if(weeks){
        res
        .status(200)
        .send(weeks)
    }
    else{
        res
        .status(404)
        .send('No weeks found')
    }
} catch (error) {
    
}
}