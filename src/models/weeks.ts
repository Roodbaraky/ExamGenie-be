import { supabase } from "../database/supabaseClient";
export const fetchWeeks = async (className: string) => {
    console.log(className)
    const { data, error } = await supabase
    .rpc('get_weeks_with_tags', {classname:className})

    if (error) {
        console.log(error)
        throw error
    }
    
    return data
}