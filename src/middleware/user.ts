import { NextFunction,  Response } from "express";

import { supabase } from "../database/supabaseClient";
import { CustomRequest } from "./token";

export const checkUser = async (jwt: string) => {
    try {
        const { data: { user } } = await supabase.auth.getUser(jwt);
        return user;
    } catch (error) {
        return Promise.reject(error);
    }
};

export const checkRole = (requiredRole: string) => {
    return async (req: CustomRequest, res: Response, next: NextFunction) => {
        const token = req.headers.authorization?.split(' ')[1];

        if (!token) {
            return res
                .status(401)
                .send({ message: 'No token provided' });
        }

        try {
            const user = await checkUser(token);

            if (!user) {
                return res
                    .status(401)
                    .send({ message: 'No user' });
            }

            if (user.role !== requiredRole) {
                return res
                    .status(403)
                    .send({ message: 'Access denied' });
            }

         
            req.user = user;

            next();
        } catch (error) {
            console.error('Error verifying token:', error);
            return res.status(500).send({ message: 'Internal Server Error' });
        }
    };
};