import { NextFunction, Response } from "express";

import { User } from "@supabase/supabase-js";
import { jwtDecode } from "jwt-decode";
import { CustomRequest } from "./token";
export interface CustomUser extends User {
    user_role: string
}
export const checkUser = async (jwt: string) => {
    try {
        const user = jwtDecode(jwt) as CustomUser
        //add validation of user attributes here
        return user;
    } catch (error) {
        return Promise.reject(error);
    }
};

export const checkRole = (requiredRole: string) => {
    return async (req: CustomRequest, res: Response, next: NextFunction) => {
        const token = req.headers.authorization?.split(' ')[1];

        if (!token) {
            next(Error('No token provided'))
            return
        }

        try {
            const user = await checkUser(token);

            if (!user) {
                next(Error('No user'))
                return
            }

            if (user.user_role !== requiredRole && user.user_role!=='admin' && user.role!=='authenticated') {
                next(Error('Access denied'))
                return
            }


            req.user = user;

            next();
        } catch (error) {
            next(error)
        }
    };
};