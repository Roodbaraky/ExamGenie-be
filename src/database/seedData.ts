type DifficultyLevel = 'foundation' | 'crossover' | 'higher' | 'extended';

interface Question {
    id: number;
    difficulty: DifficultyLevel;
}

interface Tag {
    id: number;
    tag: string;
}

interface QuestionTag {
    question_id: number;
    tag_id: number;
}


export const questions: Question[] = [
    { id: 1, difficulty: 'crossover' },
    { id: 2, difficulty: 'foundation' },
    { id: 3, difficulty: 'higher' },
    { id: 4, difficulty: 'foundation' },
    { id: 5, difficulty: 'crossover' },
];


export const tags: Tag[] = [
    { id: 1, tag: 'Geometry' },
    { id: 2, tag: 'Pythagoras' },
    { id: 3, tag: 'Calculus' },
    { id: 4, tag: 'Area of a Circle' },
    { id: 5, tag: 'Quadratic Equations' },
    { id: 6, tag: 'Trigonometry' },
];


export const questionTags: QuestionTag[] = [
    { question_id: 1, tag_id: 1 },
    { question_id: 1, tag_id: 4 },
    { question_id: 2, tag_id: 1 },
    { question_id: 2, tag_id: 2 },
    { question_id: 2, tag_id: 6 },
    { question_id: 3, tag_id: 3 },
    { question_id: 4, tag_id: 1 },
    { question_id: 5, tag_id: 1 },
    { question_id: 5, tag_id: 5 },
];