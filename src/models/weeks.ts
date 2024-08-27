import { supabase } from "../database/supabaseClient";
import { checkIfClassExists } from "./classes";



export const isClassNameValid = (className: unknown) => {
    if (typeof className !== 'string') return Promise.reject('Invalid className')
}

export const fetchWeeks = async (className: string) => {
        await isClassNameValid(className)
        await checkIfClassExists(className)
        const { data, error } = await supabase
            .rpc('get_weeks_with_tags', { classname: className })

        if (error) {
            return Promise.reject(error)
        }
        return data
        ? data
        : Promise.reject('Weeks data not found')
   
}


