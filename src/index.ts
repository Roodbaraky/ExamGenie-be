import cors from 'cors';
import dotenv from 'dotenv';
import express, { Request, Response } from 'express';
import { getClasses } from './controllers/classesController';
import { addQuestions, getQuestions } from './controllers/questionsController';
import { getTags } from './controllers/tagsController';
import { getWeeksFromClassName } from './controllers/weeksController';
import { authenticateToken } from './middleware/token';

dotenv.config();
export const app = express();

const corsOptions = {
    origin: ['http://127.0.0.1:5173', 'http://localhost:5173'],
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Origin', 'X-Requested-With', 'Content-Type', 'Accept', 'Authorization'],
    credentials: true,
};


app.use(cors(corsOptions));
app.use(express.json({ limit: '50mb' }));
app.use(express.urlencoded({ limit: '50mb', extended: true }));
app.use(authenticateToken)
app.route('/')
    .get((req: Request, res: Response) => {
        res.status(200).send('Hi, API is working');
    });

app.route('/questions')
    // .get(getQuestions)
    .post(getQuestions)

app.route('/upload')
    .post(addQuestions)

app.route('/classes')
    .get(getClasses)

app.route('/weeks')
    .get(getWeeksFromClassName)

app.route('/tags')
    .get(getTags)
app.route('sow')

const port = process.env.PORT || 3000;

app.listen(port, () => {
    console.log(`API server running on port ${port}`);
});
