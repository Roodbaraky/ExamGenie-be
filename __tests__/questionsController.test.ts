import express from 'express';
import request from 'supertest';
import { describe, expect, it } from 'vitest';
import { app } from '../src';
import { getQuestions } from '../src/controllers/questionsController';

app.use(express.json());
app.get('/questions', getQuestions);



describe('GET /questions', () => {


    it('should fetch questions by tag', async () => {
        const response = await request(app).get('/questions').query({ tag: 'Pythagoras' });

        expect(response.status).toBe(200);
        response.body.forEach(question =>
            expect(question).toMatchObject({
                id: expect.any(Number),
                difficulty: expect.any(String),
                tags: expect.arrayContaining([
                    expect.objectContaining({ tag: expect.stringContaining('Pythagoras') })
                ])
            }))
    });

    it('should fetch questions by difficulty', async () => {
        const response = await request(app).get('/questions').query({ difficulty: 'foundation' });

        expect(response.status).toBe(200);
        response.body.forEach(question =>
            expect(question).toMatchObject({
                id: expect.any(Number),
                difficulty: 'foundation',
                tags: expect.any(Array)
            })
        );
    });

    it('should fetch questions by tag and difficulty', async () => {
        const response = await request(app).get('/questions').query({ tag: 'Pythagoras', difficulty: 'foundation' });

        expect(response.status).toBe(200);
        expect(response.status).toBe(200);
        response.body.forEach(question =>
            expect(question).toMatchObject({
                id: expect.any(Number),
                difficulty: 'foundation',
                tags: expect.arrayContaining([
                    expect.objectContaining({ tag: expect.stringContaining('Pythagoras') })
                ])
            }))
    });

    it('should fetch all questions when no tag or difficulty is provided', async () => {
        const response = await request(app).get('/questions');

        expect(response.status).toBe(200);
        expect(response.body).toEqual(expect.arrayContaining([
            expect.objectContaining({})
        ]));
    });

    it('should return 400 if queried with an invalid tag', async () => {
        const response = await request(app).get('/questions').query({ tag: '123' });

        expect(response.status).toBe(400);
        expect(response.text).toContain('Invalid tag');
    });

    it('should return 400 if queried with an invalid difficulty', async () => {
        const response = await request(app).get('/questions').query({ difficulty: 'invalid' });

        expect(response.status).toBe(400);
        expect(response.text).toContain('Invalid difficulty');
    });

    it('should return 404 if queried with non-existent tags', async () => {
        const response = await request(app).get('/questions').query({ tag: 'nonExistentTag' });

        expect(response.status).toBe(404);
        expect(response.text).toContain('not found');
    });

    it('should return 404 if queried with existing tags with no corresponding questions', async () => {
        const response = await request(app).get('/questions').query({ tag: 'testag' });

        expect(response.status).toBe(404);
        expect(response.text).toContain('not found');
    });
});

