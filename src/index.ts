import express, { Request, Response, NextFunction } from 'express';
import dotenv from 'dotenv'
import { getQuestions } from './controllers/questionsController';



dotenv.config()
export const app = express();
app.use((req, res, next) => {
    const allowedOrigins = ['http://127.0.0.1:5173'];
    const origin = req.headers.origin;
    if (origin && allowedOrigins.includes(origin)) {
        res.setHeader('Access-Control-Allow-Origin', origin);
    }
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Authorization");
    res.header("Access-Control-Allow-credentials", 'true');
    res.header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, UPDATE");
    next();
})

app.use(express.json());

app.route('/')
    .get((req: Request, res: Response, next: NextFunction) => {
        res
            .status(200)
            .send('Hi, API is working')
    })

app.route('/questions')
    .get(getQuestions)
    .post(getQuestions)
// .post(addQuestions)

const port = process.env.PORT || 3000;

app.listen(port, () => {
    console.log(`API server running on port ${port}`);
});