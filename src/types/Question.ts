
export type Tag = {
    tag: string
}

export interface Question {
    id: number
    difficulty: string
    tags: Tag[]
}
