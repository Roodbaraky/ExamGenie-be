
import { describe, expect, it } from 'vitest';
import { areDifficultiesValid, areTagsValid, Difficulties, fetchQuestions, TagObject, } from '../src/models/questions';

describe('areTagsValid', () => {
    it('should return true for valid tags array', () => {
        const validTags: TagObject[] = [
            { tag: 'Geometry' },
            { tag: 'Area of a Circle' },
        ];
        expect(areTagsValid(validTags)).toBe(true);
    });

    it('should return false if tags is not an array', () => {
        const invalidTags: any = { tag: 'Geometry' };
        expect(areTagsValid(invalidTags)).toBe(false);
    });

    it('should return false if tag is not an object', () => {
        const invalidTags: any = ['Geometry', 'Area of a Circle'];
        expect(areTagsValid(invalidTags)).toBe(false);
    });

    it('should return false if tag property is missing', () => {
        const invalidTags: any = [{}];
        expect(areTagsValid(invalidTags)).toBe(false);
    });

    it('should return false if tag property is not a string', () => {
        const invalidTags: any = [{ tag: 123 }];
        expect(areTagsValid(invalidTags)).toBe(false);
    });

    it('should return false if tag property is a numeric string', () => {
        const invalidTags: TagObject[] = [{ tag: '123' }];
        expect(areTagsValid(invalidTags)).toBe(false);
    });

    it('should return true for an empty tags array', () => {
        const validTags: TagObject[] = [];
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

describe('fetchQuestions', () => {
    it('should fetch questions by tag', async () => {
        const questions = await fetchQuestions({ tags: [{ tag: 'Pythagoras' }] });
        const questions2 = await fetchQuestions({ tags: [{ tag: 'Trigonometry' }] });

        questions.forEach(question => {
            expect(question).toMatchObject({
                id: expect.any(Number),
                difficulty: expect.any(String),
                tags: expect.arrayContaining([
                    expect.objectContaining({ tag: expect.stringContaining('Pythagoras') })
                ])
            });
        });
        questions2.forEach(question => {
            expect(question).toMatchObject({
                id: expect.any(Number),
                difficulty: expect.any(String),
                tags: expect.arrayContaining([
                    expect.objectContaining({ tag: expect.stringContaining('Trigonometry') })
                ])
            });
        });

    });

    it('should fetch questions when a partial tag match is found', async () => {
        const questions = await fetchQuestions({ tags: [{ tag: 'pyth' }] });
        questions.forEach(question => {
            expect(question).toMatchObject({
                id: expect.any(Number),
                difficulty: expect.any(String),
                tags: expect.arrayContaining([
                    expect.objectContaining({ tag: expect.stringContaining('Pyth') })
                ])
            });
        });
    })

    it('should fetch all questions when no tag is provided', async () => {
        const questions = await fetchQuestions();
        expect(questions.length).toBe(5)
        questions.forEach(question => {
            expect(question).toMatchObject({
                id: expect.any(Number),
                difficulty: expect.any(String),
                tags: expect.any(Array)
            });
        });
    });

    it('should error if queried with invalid tags', async () => {
        try {
            const tag = 9;
            const questions = await fetchQuestions({ tags: [{ tag: tag }] as any });
            expect(questions).toBeUndefined();
        } catch (error) {

            console.log(error)
            expect((error as Error).message).toBe('Invalid tags')
        }

    });
});