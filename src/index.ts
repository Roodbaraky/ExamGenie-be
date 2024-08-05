import express, { Request, Response, NextFunction } from 'express';
import dotenv from 'dotenv'
import { getQuestions } from './controllers/questionsController';



dotenv.config()
export const app = express();
app.use(express.json());

app.get('/questions', getQuestions)
app.use('/', (req: Request, res: Response, next: NextFunction) => {
    res
        .status(200)
        .send('Hi, API is working')
})
const port = process.env.PORT || 3000;

app.listen(port, () => {
    console.log(`API server running on port ${port}`);
});