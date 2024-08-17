import { describe, expect, it } from 'vitest';
import { fetchTags, FetchTagsProps } from '../src/models/questions';

//add unit tests for areFetchArgsValid && checkIfClassExists

describe('fetchTags', () => {
    it('should fetch an array of tags when passed className, currentWeek, and recallPeriod', async () => {
        const exampleArgs: FetchTagsProps = { className: '9xPb', currentWeek: 2, recallPeriod: 1 }
        const tags = await fetchTags(exampleArgs)
        expect(tags.length).toBe(4)
        expect(Array.isArray(tags)).toBe(true)
        tags.forEach((tag: string) => expect(typeof tag).toBe('string'))
    });

    it('should error if queried with an invalid className', async () => {
        try {
            const exampleArgs: FetchTagsProps = { className: 9 as any, currentWeek: 2, recallPeriod: 1 }
            const tags = await fetchTags(exampleArgs)
            expect(tags).toBeUndefined()
        } catch (error) {
            expect((error as Error).message).toBe('Invalid className')

        }
    });

    it('should error if queried with an invalid currentWeek', async () => {
        try {
            const exampleArgs: FetchTagsProps = { className: '9xPb', currentWeek: 'invalid' as any, recallPeriod: 1 }
            const tags = await fetchTags(exampleArgs)
            expect(tags).toBeUndefined()
        } catch (error) {
            expect((error as Error).message).toBe('Invalid currentWeek')

        }
    });

    it('should error if queried with an invalid recallPeriod', async () => {
        try {
            const exampleArgs: FetchTagsProps = { className: '9xPb', currentWeek: 2, recallPeriod: 'invalid' as any }
            const tags = await fetchTags(exampleArgs)
            expect(tags).toBeUndefined()
        } catch (error) {
            expect((error as Error).message).toBe('Invalid recallPeriod')

        }
    });
    //This next test will need to evaluate how negative results of currentWeek - recallPeriod are handled i.e. it should recall topics from the previous scheme of work, need to decide how to approach this and seed db with data that can verify it, inadequate at present.
    // it.only('should', async ()=>{
    //     try {
    //         const exampleArgs: FetchTagsProps = { className: '9xPb', currentWeek: 1, recallPeriod: 5 }
    //         const tags = await fetchTags(exampleArgs)
    //         console.log(tags)
    //         expect(tags).toBeUndefined()
    //     } catch (error) {
    //         console.error(error)
    //         expect((error as Error).message).toBe('Invalid className')

    //     }
    // })

    it('should error if queried with a valid, but non-existent className', async () => {
        try {
            const exampleArgs: FetchTagsProps = { className: 'NotARealClass' as any, currentWeek: 2, recallPeriod: 1 }
            const tags = await fetchTags(exampleArgs)
            expect(tags).toBeUndefined()
        } catch (error) {
            expect((error as Error)).toBe('Class not found')

        }


    })
})