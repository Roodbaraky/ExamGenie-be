import cors from 'cors';
import dotenv from 'dotenv';
import express, { Request, Response } from 'express';
import { getClasses } from './controllers/classesController';
import { addQuestions, getQuestions } from './controllers/questionsController';
import { changeSow } from './controllers/sowController';
import { getTags } from './controllers/tagsController';
import { getWeeksFromClassName } from './controllers/weeksController';
import { errorHandler } from './middleware/errors';
import { authenticateToken } from './middleware/token';
import { checkRole } from './middleware/user';

dotenv.config();
export const app = express();



app.use(cors({
    origin: '*',
    methods: ['GET', 'POST', 'PUT', 'DELETE'], 
    allowedHeaders: ['Content-Type', 'Authorization'] }));
app.use(express.json({ limit: '50mb' }));
app.use(express.urlencoded({ limit: '50mb', extended: true }));
app.use(authenticateToken)
app.route('/')
    .get((req: Request, res: Response) => {
        res.status(200).send('Hi, API is working');
    });


app.route('/questions')
    .post(checkRole('moderator'), getQuestions)

app.route('/upload')
    .post(checkRole('admin'), addQuestions)


app.route('/classes')
    .get(checkRole('moderator'), getClasses)
// .post(checkRole('admin'), addClass )


app.route('/weeks')
    .get(getWeeksFromClassName)
// .post(checkRole('admin'), addWeeks )


app.route('/tags')
    .get(getTags)
// .post(checkRole('admin'), addTags )

app.route('/sow')
.post(checkRole('moderator'), changeSow)



app.use(errorHandler)

const port = process.env.PORT || 3000;

app.listen(port, () => {
    console.log(`API server running on port ${port}`);
});
