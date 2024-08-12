import { Request, Response } from "express"
import { fetchClasses } from "../models/classes"

export const getClasses = async (req:Request, res:Response)=>{
try {
    const classes = await fetchClasses()
    if(classes.length){
        res
        .status(200)
        .send(classes)
    }
    else{
        res
        .status(404)
        .send('No classes found')
    }
} catch (error) {
    
}
}