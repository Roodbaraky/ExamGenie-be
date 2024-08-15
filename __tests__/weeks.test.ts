import { describe, expect, it } from 'vitest';
import { fetchWeeks } from '../src/models/weeks';

interface Week {
    week_number: number,
    tags: string[]
}

describe('fetchWeeks', () => {
    it('should return an array of week objects when called', async () => {
        const weeks = await fetchWeeks('9xPb')
        expect(Array.isArray(weeks)).toBe(true)
        weeks.forEach((week: Week) => expect(week).toMatchObject({
            week_number: expect.any(Number),
            tags: expect.arrayContaining([expect.any(String)])
        }))
    });

    it('should error if passed an invalid className', async () => {
        try {
            const weeks = await fetchWeeks(99 as any)
            throw Error('Wrong error')
        } catch (error) {
            expect(error as Error).toBe('Invalid className')
        }
    });

    it('should error if passed a valid className which does not exist in classes', async () => {
        try {
            const weeks = await fetchWeeks('validClassname')
            throw Error('Wrong error')
        } catch (error) {
            expect(error as Error).toBe('Class not found')
        }
    })

})