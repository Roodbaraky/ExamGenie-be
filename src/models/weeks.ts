import { supabase } from "../database/supabaseClient";
import { checkIfClassExists, isClassNameValid } from "./classes";

export const fetchWeeks = async (className: string) => {
    try {
        await isClassNameValid(className)
        await checkIfClassExists(className)
        const { data, error } = await supabase
            .rpc('get_weeks_with_tags', { classname: className })

        if (error) {
            return Promise.reject(error)
        }
        return data
            ? data
            : Promise.reject(Error('Weeks data not found'))

    } catch (error) {
        return Promise.reject(error)
    }
}

