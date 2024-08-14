import { tags as tagData } from "./tags";
type DifficultyLevel = 'foundation' | 'crossover' | 'higher' | 'extended';

interface Question {
    id: number;
    difficulty: DifficultyLevel;
}

interface Tag {
    id?: number;
    tag: string;
}

interface QuestionTag {
    question_id: number;
    tag_id: number;
}

interface Class {
    id?: number
    class_name: string
    sow_id?: number
}


export const questions: Question[] = [
    { id: 1, difficulty: 'crossover' },
    { id: 2, difficulty: 'foundation' },
    { id: 3, difficulty: 'higher' },
    { id: 4, difficulty: 'foundation' },
    { id: 5, difficulty: 'crossover' },
];


export const tags: Tag[] = tagData


export const questionTags: QuestionTag[] = [
    { question_id: 1, tag_id: 4 },
    { question_id: 2, tag_id: 1 },
    { question_id: 2, tag_id: 2 },
    { question_id: 2, tag_id: 6 },
    { question_id: 3, tag_id: 3 },
    { question_id: 4, tag_id: 1 },
    { question_id: 5, tag_id: 1 },
    { question_id: 5, tag_id: 5 },
];

export const classes: Class[] = [
    { class_name: '9xPb' },
    { class_name: '9ycB' },
    { class_name: '10xFb' },
    { class_name: '10yPb' },
    { class_name: '11xFb' },
    { class_name: '11xPb' },
    { class_name: '12M' },
    { class_name: '13M' },

]