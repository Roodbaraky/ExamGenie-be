
import { describe, expect, it } from 'vitest';
import { fetchQuestions, isDifficultyValid } from '../src/models/questions';

describe('isDifficultyValid', () => {
    it('should return false for non-string difficulty', async () => {
        const result = isDifficultyValid(123 as any);
        expect(result).toBe(false);
    });

    it('should return false for invalid difficulty', async () => {
        const result = isDifficultyValid('invalid');
        expect(result).toBe(false);
    });

    it('should return true for valid difficulty "foundation"', async () => {
        const result = isDifficultyValid('foundation');
        expect(result).toBe(true);
    });

    it('should return true for valid difficulty "crossover"',  () => {
        const result = isDifficultyValid('crossover');
        expect(result).toBe(true);
    });

    it('should return true for valid difficulty "higher"',  () => {
        const result = isDifficultyValid('higher');
        expect(result).toBe(true);
    });

    it('should return true for valid difficulty "extended"',  () => {
        const result = isDifficultyValid('extended');
        expect(result).toBe(true);
    });

    it('should return true for valid difficulty "other"',  () => {
        const result = isDifficultyValid('other');
        expect(result).toBe(true);
    });

    it('should return false for an array with an invalid difficulty',  () => {
        const result = isDifficultyValid(['foundation', 'invalid']);
        expect(result).toBe(false);
    });

    it('should return true for an array with all valid difficulties',  () => {
        const result = isDifficultyValid(['foundation', 'crossover', 'higher']);
        expect(result).toBe(true);
    });
    
})

describe('fetchQuestions', () => {
    it('should fetch questions by tag', async () => {
        const questions = await fetchQuestions({ tag: 'Pythagoras' });
        const questions2 = await fetchQuestions({ tag: 'Trigonometry' });

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
        const questions = await fetchQuestions({ tag: 'pyth' });
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
            const questions = await fetchQuestions({ tag: tag as any });
            expect(questions).toBeUndefined();
        } catch (error) {

            console.log(error)
            expect((error as Error).message).toBe('Invalid tag')
        }

    });
});