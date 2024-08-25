import { NextFunction, Request, Response } from "express";

interface AppError extends Error {
    status?: number;
    details?: string;
    code?: string;
}

// eslint-disable-next-line @typescript-eslint/no-unused-vars
export const errorHandler = (err: AppError, req: Request, res: Response, next: NextFunction) => {
    let statusCode = err.status || 500;
    let errorMessage = err.message || 'Internal Server Error';
    let errorDetails = err.details || {};

    if (errorMessage.includes('found')) {
        statusCode = 404;
    } else if (errorMessage.includes('denied')) {
        statusCode = 403;
    } else if (err?.code === '23503') {
        statusCode = 403
        errorMessage = 'Insufficient Supabase permissions'
        errorDetails = '[Redacted]'
    } else if (errorMessage.includes('No token') || errorMessage.includes('No user')||errorMessage.includes('Authorization')) {
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
