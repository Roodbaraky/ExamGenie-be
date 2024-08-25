import { NextFunction, Request, Response } from "express";

interface AppError extends Error {
    status?: number;
    details?: string;
}

// eslint-disable-next-line @typescript-eslint/no-unused-vars
export const errorHandler = (err: AppError, req: Request, res: Response, next: NextFunction) => {
    let statusCode = err.status || 500;
    const errorMessage = err.message || 'Internal Server Error';
    const errorDetails = err.details || {};

    if (errorMessage.includes('found')) {
        statusCode = 404;
    } else if (errorMessage.includes('denied')) {
        statusCode = 403;
    } else if (errorMessage.includes('No token') || errorMessage.includes('No user')) {
        statusCode = 401;
    } else if (errorMessage.includes('Invalid') || errorMessage.includes('bad')) {
        statusCode = 400;
    }

    res.status(statusCode).send({
        error: {
            message: errorMessage,
            details: errorDetails,
        },
    });
    console.error(`[${new Date().toISOString()}] ${statusCode} - ${errorMessage}:`, errorDetails);
};
