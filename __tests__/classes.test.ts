import { describe, expect, it } from 'vitest';
import { fetchClasses } from '../src/models/classes';

describe('fetchClasses', () => {
    it('should return an array of class objects when called', async () => {
        const classes = await fetchClasses()
        expect(Array.isArray(classes)).toBe(true)
        classes.forEach((classItem) => {
            expect(classItem).toMatchObject({
                id:expect.any(Number),
                class_name:expect.any(String),
               
            })
        })
    })
})