
import { beforeEach, describe, expect, it, vi } from 'vitest';
import { getQuestions } from '../src/controllers/questionsController';
import request from 'supertest';
import express from 'express';
import * as questionModel from '../src/models/questions';
import { app } from '../src';


app.use(express.json());
app.get('/questions', getQuestions);


vi.mock('../models/questions', () => ({
    fetchQuestions: vi.fn()
}));

describe('GET /questions', () => {
    beforeEach(() => {
        vi.restoreAllMocks();
    });

    it('should fetch questions by tag', async () => {
        const tag = 'Pythagoras';
        const mockQuestions = [{ id: 1, subject: 'Math' }, { id: 2, subject: 'Math' }];
        vi.spyOn(questionModel, 'fetchQuestions').mockResolvedValue(mockQuestions);

        const response = await request(app).get('/questions').query({ tag });

        expect(response.status).toBe(200);
        expect(response.body).toEqual(mockQuestions);
    });

    it('should fetch all questions when no tag is provided', async () => {
        const mockQuestions = [{ id: 1, subject: 'Math' }, { id: 2, subject: 'Math' }];
        vi.spyOn(questionModel, 'fetchQuestions').mockResolvedValue(mockQuestions);

        const response = await request(app).get('/questions');

        expect(response.status).toBe(200);
        expect(response.body).toEqual(mockQuestions);
    });

    it('should return 500 if there is an error in the model', async () => {
        vi.spyOn(questionModel, 'fetchQuestions').mockRejectedValue(Error('Database error'));

        const response = await request(app).get('/questions');

        expect(response.status).toBe(500);

        expect(response.text).toContain('Internal Server Error');
    });

    it('should return 404 if queried with NonExistentTags', async () => {
        const response = await request(app).get('/questions/?tag=cat')
        expect(response.status).toBe(404)
        expect(response.text).toContain('not found')
    })

    it('should return 404 if queried with existing tags with no corresponding questions', async () => {
        const response = await request(app).get('/questions/?tag=testag')
        expect(response.status).toBe(404)
        expect(response.text).toContain('not found')
    })
});