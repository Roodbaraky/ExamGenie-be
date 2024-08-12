
import { describe, expect, it } from 'vitest';
import { areDifficultiesValid, areTagsValid, Difficulties, fetchQuestions } from '../src/models/questions';
import { Question, Tags } from '../src/types/Question';

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
        tags: expect.any(Array)
    })
};
export const checkQuestionsMatchTags = (questions: Question[], tags: string[]): boolean => {
    if (questions.length === 0) {
        return false
    }
    for (const question of questions) {
        const match = question.tags.filter(qTag => tags.includes(qTag))
        if (match.length == 0) {
            return false
        }
    }
    return true

};

describe('fetchQuestions', () => {
    it('should fetch questions by tag', async () => {
        const tags = ['pythagoras']
        const questions = await fetchQuestions({ tags });
        tags.push('pythagoras')
        const questions2 = await fetchQuestions({ tags });
        questions.forEach((question) => validateQuestionObject(question))
        expect(checkQuestionsMatchTags(questions, ['pythagoras'])).toBe(true)
        expect(checkQuestionsMatchTags(questions2, ['trigonometry', 'pythagoras'])).toBe(true)
    });

    it('should fetch questions when a partial tag match is found', async () => {
        const tags = ['pyth']
        const questions = await fetchQuestions({ tags });
        expect(checkQuestionsMatchTags(questions, ['pythagoras'])).toBe(true)
    })

    it('should fetch questions from partial tags if passed multiple partial tags', async () => {
        const tags = ['pyth', 'calc']
        const questions = await fetchQuestions({ tags });
        expect(checkQuestionsMatchTags(questions, ['calculus', 'pythagoras'])).toBe(true)
    })


    it('should fetch all questions when no tag is provided', async () => {
        const questions = await fetchQuestions({});
        expect(questions.length).toBe(5)
        questions.forEach((question) => validateQuestionObject(question))
    });

    it('should error if queried with invalid tags', async () => {
        try {
            const tags = [9];
            const questions = await fetchQuestions({ tags } as any);
            expect(questions).toBeUndefined();
        } catch (error) {
            expect((error as Error).message).toBe('Invalid tags')
        }
    });

    it('should return the number of questions specified by the limit passed', async () => {
        const limit = 3
        const questions = await fetchQuestions({ limit })
        expect(questions.length).toBe(3)
    })

    it('should error if limit is not a number', async () => {
        try {
            const limit = 'NaN'
            const questions = await fetchQuestions({ limit })
            expect(questions).toBeUndefined()
        } catch (error) {
            expect((error as Error).message).toBe('Invalid limit')
        }
    })

    it('should error if limit is negative', async () => {
        try {
            const limit = -1
            const questions = await fetchQuestions({ limit })
            expect(questions).toBeUndefined()
        } catch (error) {
            expect((error as Error).message).toBe('Invalid limit')
        }
    })

    it('should return all questions if limit > no. questions', async () => {
        const limit = 7
        const questions = await fetchQuestions({ limit })
        expect(questions.length).toBe(5)
    })
});