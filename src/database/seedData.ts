import { Tag, tags as tagData } from "./data/tags";
import { Question, questions as questionData } from './data/questions'
import { QuestionTag, questionTags as questionTagsData } from './data/questionTags'
import { Class, classes as classData } from './data/classes'
import { SoW, sows as sowData } from "./data/sows";
import { Week, weeks as weekData } from "./data/weeks";
import { WeeksTags, weeksTags as weeksTagsData } from "./data/weeksTags";
import { SoWWeek, sowsWeeks as sowWeekData } from "./data/sowsWeeks";
import { ClassSows, classSows as classSowsData } from "./data/classSows";

export const questions: Question[] = questionData
export const tags: Tag[] = tagData
export const questionTags: QuestionTag[] = questionTagsData
export const classes: Class[] = classData
export const sows: SoW[] = sowData
export const weeks: Week[] = weekData
export const weeksTags: WeeksTags[] = weeksTagsData
export const sowWeeks: SoWWeek[] = sowWeekData
export const classSows: ClassSows[] = classSowsData

export const seedData ={
    questions,
    tags,
    questionTags,
    classes,
    sows,
    weeks,
    weeksTags,
    sowWeeks,
    classSows
}