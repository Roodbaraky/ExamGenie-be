/* eslint-disable @typescript-eslint/no-explicit-any */
import { describe, expect, it } from '@jest/globals';
import { areTagsValid, fetchTagsFromSow } from '../src/models/tags';
import { FetchTagsFromSowProps } from '../src/types/Question';



describe('areTagsValid', () => {
    it('should return true if passed an array of valid tags', () => {
        const validTags = ['tag1', 'tag2', 'tag3'];
        expect(areTagsValid(validTags)).toBe(true);
    })
    it('should return false for an array containing non-string elements', () => {
        const invalidTags1 = [123, 'tag1', true];
        expect(areTagsValid(invalidTags1 as any)).toBe(false);

        const invalidTags2 = ['tag1', 'tag2', null];
        expect(areTagsValid(invalidTags2 as any)).toBe(false);
    });

    it('should return false for an array containing strings that are numbers', () => {
        const invalidTags = ['123', '456', '789'];
        expect(areTagsValid(invalidTags)).toBe(false);
    });

    it('should return true for an empty array', () => {
        const emptyArray: string[] = [];
        expect(areTagsValid(emptyArray)).toBe(true);
    });

    it('should return false for non-array input', () => {
        const nonArrayInputs = [null, undefined, 123, 'string', {}];
        nonArrayInputs.forEach(input => {
            expect(areTagsValid(input as any)).toBe(false);
        });
    });
})


describe('fetchTagsFromSow', () => {
    it('should fetch an array of tags when passed className, currentWeek, and recallPeriod', async () => {
        const exampleArgs: FetchTagsFromSowProps = { className: '9xPb', currentWeek: 25, recallPeriod: 1 }
        const tags = await fetchTagsFromSow(exampleArgs)
        expect(tags?.length).toBe(3)
        expect(Array.isArray(tags)).toBe(true)
        tags.forEach((tag: string) => expect(typeof tag).toBe('string'))
    });

    it('should error if queried with an invalid className', async () => {
        try {
            const exampleArgs: FetchTagsFromSowProps = { className: 9 as any, currentWeek: 2, recallPeriod: 1 }
            const tags = await fetchTagsFromSow(exampleArgs)
            expect(tags).toBeUndefined()
        } catch (error) {
            expect((error as Error).message).toBe('Invalid className')

        }
    });

    it('should error if queried with an invalid currentWeek', async () => {
        try {
            const exampleArgs: FetchTagsFromSowProps = { className: '9xPb', currentWeek: 'invalid' as never, recallPeriod: 1 }
            const tags = await fetchTagsFromSow(exampleArgs)
            expect(tags).toBeUndefined()
        } catch (error) {
            expect((error as Error).message).toBe('Invalid currentWeek')

        }
    });

    it('should error if queried with an invalid recallPeriod', async () => {
        try {
            const exampleArgs: FetchTagsFromSowProps = { className: '9xPb', currentWeek: 2, recallPeriod: 'invalid' as never }
            const tags = await fetchTagsFromSow(exampleArgs)
            expect(tags).toBeUndefined()
        } catch (error) {
            expect((error as Error).message).toBe('Invalid recallPeriod')

        }
    });
    //This next test will need to evaluate how negative results of currentWeek - recallPeriod are handled i.e. it should recall topics from the previous scheme of work, need to decide how to approach this and seed db with data that can verify it, inadequate at present.
    // it.only('should', async ()=>{
    //     try {
    //         const exampleArgs: FetchTagsFromSowProps = { className: '9xPb', currentWeek: 1, recallPeriod: 5 }
    //         const tags = await fetchTagsFromSow(exampleArgs)
    //         console.log(tags)
    //         expect(tags).toBeUndefined()
    //     } catch (error) {
    //         console.error(error)
    //         expect((error as Error).message).toBe('Invalid className')

    //     }
    // })

    it('should error if queried with a valid, but non-existent className', async () => {
        try {
            const exampleArgs: FetchTagsFromSowProps = { className: 'NotARealClass' as never, currentWeek: 2, recallPeriod: 1 }
            const tags = await fetchTagsFromSow(exampleArgs)
            expect(tags).toBeUndefined()
        } catch (error) {
            expect((error as Error)).toBe('Class not found')

        }


    })
})