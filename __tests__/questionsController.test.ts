import express from 'express';
import request from 'supertest';
import { describe, expect, it } from 'vitest';
import { app } from '../src';
import { getQuestions } from '../src/controllers/questionsController';

app.use(express.json());
app.get('/questions', getQuestions);
type Tag = {
    tag: string
}

interface Question {
    id: number
    difficulty: string
    tags: Tag[]
}

const validateQuestionObject = (question: Question, difficulty: string | null = null, tag: string | null = null) => {
    expect(question).toMatchObject({
        id: expect.any(Number),
        difficulty: difficulty ? difficulty : expect.any(String),
        tags: expect.arrayContaining([
            expect.objectContaining({
                tag: tag ? expect.stringContaining(tag) : expect.any(String)
            })
        ])
    });
};

describe('POST /questions', () => {
    it('should fetch questions by tag', async () => {
        const response = await request(app)
            .post('/questions')
            .send({ tags: ['Pythagoras' ] });

        expect(response.status).toBe(200);
        response.body.forEach(question =>
            expect(question).toMatchObject({
                id: expect.any(Number),
                difficulty: expect.any(String),
                tags: expect.arrayContaining([
                    expect.objectContaining({ tag: expect.stringContaining('Pythagoras') })
                ])
            })
        );
    });

    it('should fetch questions by difficulty', async () => {
        const response = await request(app)
            .post('/questions')
            .send({ difficulties: { foundation: true } });

        expect(response.status).toBe(200);
        response.body.forEach(question =>
            validateQuestionObject(question, 'foundation')
        );
    });

    it('should fetch questions by tag and difficulty', async () => {
        const response = await request(app)
            .post('/questions')
            .send({ tags: [ 'Pythagoras' ], difficulties: { foundation: true } });

        expect(response.status).toBe(200);
        response.body.forEach(question =>
            validateQuestionObject(question, 'foundation', 'Pythagoras')
        );
    });

    it('should fetch all questions when no tag or difficulty is provided', async () => {
        const response = await request(app)
            .post('/questions')
            .send({});

        expect(response.status).toBe(200);
        response.body.forEach(question =>
            validateQuestionObject(question)
        );
    });

    it('should return 400 if queried with an invalid tag', async () => {
        const response = await request(app)
            .post('/questions')
            .send({ tags: ['123'] });

        expect(response.status).toBe(400);
        expect(response.text).toContain('Invalid tags');
    });

    it('should return 400 if queried with an invalid difficulty', async () => {
        const response = await request(app)
            .post('/questions')
            .send({ difficulties: { invalid: true } });

        expect(response.status).toBe(400);
        expect(response.text).toContain('Invalid difficulties');
    });

    it('should return 404 if queried with non-existent tags', async () => {
        const response = await request(app)
            .post('/questions')
            .send({ tags: ['nonExistentTag'] });

        expect(response.status).toBe(404);
        expect(response.text).toContain('not found');
    });

    it('should return 404 if queried with existing tags with no corresponding questions', async () => {
        const response = await request(app)
            .post('/questions')
            .send({ tags: ['testag'] });

        expect(response.status).toBe(404);
        expect(response.text).toContain('not found');
    });
});


