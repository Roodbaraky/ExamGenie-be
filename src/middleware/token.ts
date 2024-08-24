import { User } from "@supabase/supabase-js";
import { NextFunction, Request, Response } from "express";
import { supabase } from "../database/supabaseClient";

export interface CustomRequest extends Request{
  user?:User
}
export const authenticateToken = async (req: CustomRequest, res: Response, next: NextFunction) => {
  
  try {

    const authHeader = req.headers['authorization'];

    if (!authHeader) {
      return res
        .status(401)
        .send({ message: 'Authorization header is missing' });
    }

    const token = JSON.parse(authHeader.split(' ')[1])
    if (!token) {
      return res.status(401).send(Error('Token is missing'));
    }

    const { data, error } = await supabase.auth.getUser(token.access_token);
    if (error || !data.user) {
      return res.status(403).send({ message: 'Invalid or expired token' });
    }

    req.user = data.user;
    next();
  } catch (error) {
    return res
    .status(500)
    .send('Internal Server Error' + error);
  }
}