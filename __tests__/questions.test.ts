
import { describe, expect, it } from 'vitest';
import { areDifficultiesValid, areTagsValid, Difficulties, fetchQuestions } from '../src/models/questions';
import { Question } from '../src/types/Question';

describe('areTagsValid', () => {
    it('should return true for valid tags array', () => {
        const validTags: string[] = [
            'Geometry',
            'Area of a Circle',
        ];
        expect(areTagsValid(validTags)).toBe(true);
    });

    it('should return false if tags is not an array', () => {
        const invalidTags: any = { tag: 'Geometry' };
        expect(areTagsValid(invalidTags)).toBe(false);
    });


    it('should return false if tag property is not a string', () => {
        const invalidTags: any = [123];
        expect(areTagsValid(invalidTags)).toBe(false);
    });

    it('should return false if tag property is a numeric string', () => {
        const invalidTags: string[] = ['123'];
        expect(areTagsValid(invalidTags)).toBe(false);
    });

    it('should return true for an empty tags array', () => {
        const validTags: string[] = [];
        expect(areTagsValid(validTags)).toBe(true);
    });
});

describe('areDifficultiesValid', () => {
    it('should return true for a valid difficulties object', () => {
        const validDifficulties: Difficulties = {
            foundation: true,
            crossover: false,
            higher: true,
            extended: false,
        };
        expect(areDifficultiesValid(validDifficulties)).toBe(true);
    });

    it('should return false if difficulties is not an object', () => {
        const invalidDifficulties: any = 'invalid';
        expect(areDifficultiesValid(invalidDifficulties)).toBe(false);
    });

    it('should return false if difficulties contains an invalid key', () => {
        const invalidDifficulties: any = {
            foundation: true,
            invalidKey: true,
        };
        expect(areDifficultiesValid(invalidDifficulties)).toBe(false);
    });

    it('should return false if difficulties contains a non-boolean value', () => {
        const invalidDifficulties: any = {
            foundation: 'true',
            crossover: false,
            higher: 1,
            extended: false,
        };
        expect(areDifficultiesValid(invalidDifficulties)).toBe(false);
    });

    it('should return true for an empty difficulties object', () => {
        const validDifficulties: Difficulties = {};
        expect(areDifficultiesValid(validDifficulties)).toBe(true);
    });
});

export const validateQuestionObject = (question: Question, difficulty: string | null = null, tag: string | null = null) => {
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
const checkQuestionsMatchTags = (questions: Question[], tags: string[]) => {
    questions.forEach(question => {
        expect(question).toMatchObject({
            id: expect.any(Number),
            difficulty: expect.any(String)
        });
        const hasMatchingTag = question.tags.some(tagObj => tags.some(tag => tagObj.tag.toLowerCase().includes(tag.toLowerCase())))
        expect(hasMatchingTag).toBe(true)
    });

}

describe('fetchQuestions', () => {
    it('should fetch questions by tag', async () => {
        const questions = await fetchQuestions({ tags: ['Pythagoras'] });
        const questions2 = await fetchQuestions({ tags: ['Trigonometry', 'Pythagoras'] });
        questions.forEach((question) => validateQuestionObject(question))
        checkQuestionsMatchTags(questions, ['Pythagoras'])
        checkQuestionsMatchTags(questions2, ['Trigonometry', 'Pythagoras'])

    });

    it('should fetch questions when a partial tag match is found', async () => {
        const questions = await fetchQuestions({ tags: ['pyth'] });
        checkQuestionsMatchTags(questions, ['pyth'])
    })

    it('should fetch all questions when no tag is provided', async () => {
        const questions = await fetchQuestions();
        expect(questions.length).toBe(5)
        questions.forEach((question) => validateQuestionObject(question))
    });

    it('should error if queried with invalid tags', async () => {
        try {
            const tag = 9;
            const questions = await fetchQuestions({ tags: [tag] as any });
            expect(questions).toBeUndefined();
        } catch (error) {

            console.log(error)
            expect((error as Error).message).toBe('Invalid tags')
        }

    });
});