export interface Question {
    URL?: string
    id?: number
    difficulty: string
    tags: string[]
}

export type DifficultyLevel = 'foundation' | 'crossover' | 'higher' | 'extended';
export type Difficulties = {
    [key in DifficultyLevel]?: boolean;
};

export interface FetchQuestionsProps {
    tagsToUse?: string[],
    difficulties?: Difficulties,
    limit?: number | string,
    className?: string,
    contentType?: string,
    recallPeriod?: string | number
}

export interface FetchTagsFromSowProps {
    className: string,
    currentWeek: number,
    recallPeriod: number
}
export interface NewQuestion extends Question {
    answerImage:string
    image: string
}
