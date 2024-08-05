
import { describe, it, expect } from 'vitest';
import { supabase } from '../src/database/supabaseClient';
import { fetchQuestions } from '../src/models/questions';



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

    it('should fetch questions when a partial tag match is found', async ()=>{
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

    it('should handle errors when fetching tag', async () => {
        const tag = 'NonExistentTag';
        const questions = await fetchQuestions(tag);

        expect(questions).toBeUndefined();
    });
});