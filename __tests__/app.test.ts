import express from 'express';
import request from 'supertest';
import { describe, expect, it } from 'vitest';
import { app } from '../src';
import { checkQuestionsMatchTags, validateQuestionObject } from './questions.test';

app.use(express.json());

describe('---- /questions ----', () => {
    describe('POST /questions', () => {
        it('should fetch questions by tag', async () => {
            const response = await request(app)
                .post('/questions')
                .send({ tags: ['basic'] });

            expect(response.status).toBe(200);
            checkQuestionsMatchTags(response.body, ['bidmas-basic'])
        });

        it('should fetch questions by difficulty', async () => {
            const response = await request(app)
                .post('/questions')
                .send({ difficulties: { foundation: true }, tags:['basic']});

            expect(response.status).toBe(200);
            response.body.forEach(question =>
                validateQuestionObject(question, 'foundation')
            );
        });

        it('should fetch questions by tag and difficulty', async () => {
            const response = await request(app)
                .post('/questions')
                .send({ tags: ['basic'], difficulties: { foundation: true } });

            expect(response.status).toBe(200);
            response.body.forEach(question =>
                validateQuestionObject(question, 'foundation', 'bidmas-basic')
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
                .send({ difficulties: { invalid: true }, tags:['basic'] });
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
})
describe('---- /classes ----', () => {
    describe('GET /classes', () => {
        it('should fetch all classes from the classes table when called', async () => {
            const response = await request(app)
                .get('/classes')

            expect(response.status).toBe(200)
            const classes = response.body
            expect(Array.isArray(classes)).toBe(true)
            classes.forEach(classItem => {
                expect(classItem).toMatchObject({
                    id: expect.any(Number),
                    class_name: expect.any(String),
                   
                })

            });
        });
    })
})


