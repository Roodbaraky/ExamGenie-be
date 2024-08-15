import express, { Request, Response, NextFunction } from 'express';
import dotenv from 'dotenv';
import cors from 'cors';
import { getQuestions } from './controllers/questionsController';
import { getClasses } from './controllers/classesController';
import { getWeeksFromClassName } from './controllers/weeksController';

dotenv.config();
export const app = express();

const corsOptions = {
    origin: ['http://127.0.0.1:5173', 'http://localhost:5173'],
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Origin', 'X-Requested-With', 'Content-Type', 'Accept', 'Authorization'],
    credentials: true,
};


app.use(cors(corsOptions));


app.use(express.json());


app.route('/')
    .get((req: Request, res: Response, next: NextFunction) => {
        res.status(200).send('Hi, API is working');
    });

app.route('/questions')
    .get(getQuestions)
    .post(getQuestions)

app.route('/classes')
    .get(getClasses)

app.route('/weeks')
    .get(getWeeksFromClassName)
const port = process.env.PORT || 3000;

app.listen(port, () => {
    console.log(`API server running on port ${port}`);
});
