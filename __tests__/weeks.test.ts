/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable @typescript-eslint/no-explicit-any */
import { describe, expect, it } from '@jest/globals';
import '../__mocks__/supabaseClient';
import { fetchWeeks, isClassNameValid } from '../src/models/weeks';
import { checkIfClassExists } from '../src/models/classes';

interface Week {
    week_number: number,
    tags: string[]
}

jest.mock('../src/models/weeks', () => ({
    ...jest.requireActual('../src/models/weeks'),
    isClassNameValid: jest.fn(),
}));

jest.mock('../src/models/classes.ts', () => ({
    ...jest.requireActual('../src/models/classes'),
    checkIfClassExists: jest.fn(),
}))

beforeEach(() => {
    jest.clearAllMocks();
    const { setTestData, setTestError } = jest.requireMock('../src/database/supabaseClient') as any;
    setTestData({ signedUrl: 'mockedSignedUrl' });
    setTestError(null);
});

afterEach(() => {
    jest.clearAllMocks();
    const { setTestData, setTestError } = jest.requireMock('../src/database/supabaseClient') as any;
    setTestData({ signedUrl: 'mockedSignedUrl' });
    setTestError(null);
});

describe('fetchWeeks', () => {
    it('should return an array of week objects when called', async () => {
        const { setTestData } = jest.requireMock('../src/database/supabaseClient.ts')
        setTestData([{ id: 1, week_number: 1, tags: ['tag1'] }])
        const weeks = await fetchWeeks('9xPb')
        expect(Array.isArray(weeks)).toBe(true)
        weeks.forEach((week: Week) => expect(week).toMatchObject({
            week_number: expect.any(Number),
            tags: expect.arrayContaining([expect.any(String)])
        }))
    });

    it('should error if passed an invalid className', async () => {
        try {
            await fetchWeeks(99 as any)
            throw Error('Wrong error')
        } catch (error) {
            expect((error as Error).message).toBe('Invalid className')
        }
    });

    it('should error if passed a valid className which does not exist in classes', async () => {
        try {
            (checkIfClassExists as jest.Mock).mockRejectedValue(Error('Class not found'))
            const weeks = await fetchWeeks('validClassname')
            throw Error('Wrong error')
        } catch (error) {
            expect((error as Error).message).toBe('Class not found')
        }
        (checkIfClassExists as jest.Mock).mockRestore()
    })

    it('should handle supabase errors', async () => {
        const { setTestError } = jest.requireMock('../src/database/supabaseClient.ts')
        setTestError(Error('Supabase error'))
        try {
            const weeks = await fetchWeeks('validClassname')
            throw Error('Wrong error')
        } catch (error) {
            expect((error as Error).message).toBe('Supabase error')
        }
    })
})