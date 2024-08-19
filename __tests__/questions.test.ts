
import { describe, expect, it } from 'vitest';
import { areDifficultiesValid, areTagsValid, Difficulties, fetchQuestions, postQuestions } from '../src/models/questions';
import { Question } from '../src/types/Question';
import { testImage } from './testImage';
import { supabaseSeedClient } from '../src/database/supabaseClient';

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
        const tagsToUse = ['money']
        const questions = await fetchQuestions({ tagsToUse });
        tagsToUse.push('surds')
        const questions2 = await fetchQuestions({ tagsToUse });
        questions.forEach((question) => validateQuestionObject(question))
        expect(checkQuestionsMatchTags(questions, ['money'])).toBe(true)
        expect(checkQuestionsMatchTags(questions2, ['money', 'surds'])).toBe(true)
    });

    it('should fetch questions when a partial tag match is found', async () => {
        const tagsToUse = ['mon']
        const questions = await fetchQuestions({ tagsToUse });
        expect(checkQuestionsMatchTags(questions, ['money'])).toBe(true)
    })

    it('should fetch questions from partial tags if passed multiple partial tags', async () => {
        const tagsToUse = ['mon', 'sur']
        const questions = await fetchQuestions({ tagsToUse });
        expect(checkQuestionsMatchTags(questions, ['money', 'surds'])).toBe(true)
    })

    it('should fetch only questions which are tagged with the specified tags', async () => {
        const tagsToUse = ['bidmas']
        const questions = await fetchQuestions({ tagsToUse });
        questions.forEach(question => question.tags.forEach(tag => expect(tag.includes('bidmas')).toBe(true)))
        tagsToUse.push('nonExistentTag')
        const questions2 = await fetchQuestions({ tagsToUse });
        questions2.forEach(question => question.tags.forEach(tag => expect(tag.includes('bidmas')).toBe(true)))
    })

    it('should fetch all questions when no tag is provided', async () => {
        const questions = await fetchQuestions({});
        expect(questions.length).toBe(20)
        questions.forEach((question) => validateQuestionObject(question))
    });

    it('should error if queried with invalid tags', async () => {
        try {
            const tagsToUse = [9];
            const questions = await fetchQuestions({ tagsToUse } as any);
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
        const limit = 900
        const questions = await fetchQuestions({ limit })
        expect(questions.length < limit).toBe(true)
    }, 3600)
});

// need to reseed db for this
describe('postQuestions', () => {
    it('should return an array of questionIds when passed an array of question objects', async () => {

        const exampleQuestionsArr = [
            { difficulty: "foundation", tags: ["bidmas-basic", "bidmas-with-indices"], image: testImage },
            { difficulty: "crossover", tags: ["bidmas-with-indices"], image: testImage }
        ]
        const actualResult = await postQuestions(exampleQuestionsArr)
        expect(Array.isArray(actualResult)).toBe(true)
        actualResult.forEach((result: number) => expect(typeof result).toBe('number'))
    },6000);

    it('should upload images corresponding to array of question objects', async () => {
        const exampleQuestionsArr = [
            { difficulty: "foundation", tags: ["bidmas-basic", "bidmas-with-indices"], image: testImage },
            { difficulty: "crossover", tags: ["bidmas-with-indices"], image: testImage }
        ]
        const actualResult = await postQuestions(exampleQuestionsArr)
        const expectedFilenames = actualResult.map((result) => result + '.png')
        expect(Array.isArray(actualResult)).toBe(true)
        const { data, error } = await supabaseSeedClient.storage
            .from('questions')
            .list('public')
        if (error) throw error
        if (data) {
            const fileNames = data.map((file) => file.name)

            expectedFilenames.forEach((expectedFilename) => expect(fileNames.includes(expectedFilename)))
        }
    }, 6000)

    //need to do some complex mock to check if image load interrupted, if entries in questions table are deleted
    //for now, I can effectively just re-run the tests as the 2nd run will fail if question_ids exist with no corresponding image


})

