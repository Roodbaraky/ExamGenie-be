
import { describe, expect, it } from 'vitest';
import { fetchQuestions } from '../src/models/questions';
import { PostgrestError } from '@supabase/supabase-js';



describe('fetchQuestions', () => {
    it('should fetch questions by tag', async () => {
        const questions = await fetchQuestions('Pythagoras');
        const questions2 = await fetchQuestions('Trigonometry');

        const expectedQuestions = [
            {
                "id": 2,
                "created_at": "2024-07-31T18:46:13.328528",
                "difficulty": "foundation"
            }
        ];
        const expectedQuestions2 = [
            {
                "id": 2,
                "created_at": "2024-07-31T18:46:13.328528",
                "difficulty": "foundation"
            }
        ]

        expect(questions).toEqual(expectedQuestions);
        expect(questions2).toEqual(expectedQuestions2);

    });

    it('should fetch questions when a partial tag match is found', async () => {
        const questions = await fetchQuestions('pyth');
        const expectedQuestions = [
            {
                "id": 2,
                "created_at": "2024-07-31T18:46:13.328528",
                "difficulty": "foundation"
            }
        ];
        expect(questions).toEqual(expectedQuestions)
    })

    it('should fetch all questions when no tag is provided', async () => {
        const questions = await fetchQuestions(null);

        const expectedQuestions = [
            {
                "id": 1,
                "created_at": "2024-07-31T18:46:13.328528",
                "difficulty": "crossover"
            },
            {
                "id": 2,
                "created_at": "2024-07-31T18:46:13.328528",
                "difficulty": "foundation"
            },
            {
                "id": 3,
                "created_at": "2024-07-31T18:46:13.328528",
                "difficulty": "higher"
            },
            {
                "id": 4,
                "created_at": "2024-07-31T18:46:13.328528",
                "difficulty": "foundation"
            },
            {
                "id": 5,
                "created_at": "2024-07-31T18:46:13.328528",
                "difficulty": "crossover"
            }
        ];
        expect(questions).toEqual(expectedQuestions);
    });

    it('should error if queried with invalid tags', async () => {
        try{
            const tag = 9;
            const questions = await fetchQuestions(tag as any);
            expect(questions).toBeUndefined();
        }catch(error){
           
            console.log(error)
            expect((error as Error).message).toBe('Invalid tag')
        }
        
    });




});