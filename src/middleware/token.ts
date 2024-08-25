import { User } from "@supabase/supabase-js";
import { NextFunction, Request, Response } from "express";
import { supabase } from "../database/supabaseClient";

export interface CustomRequest extends Request {
  user?: User
}
export const authenticateToken = async (req: CustomRequest, res: Response, next: NextFunction) => {

  try {

    const authHeader = req.headers['authorization'];

    if (!authHeader) {
      next(Error('Authorization header is missing'));
      return
    }

    const token = JSON.parse(authHeader.split(' ')[1])
    if (!token) {
      next(Error('Token is missing'));
    }

    const { data, error } = await supabase.auth.getUser(token.access_token);
    if (error || !data.user) {
      next(Error('Invalid or expired token'));
      return
    }

    req.user = data.user;
    next();

  } catch (error) {
    next(error)
  }
}