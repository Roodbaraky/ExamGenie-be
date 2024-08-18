
import { supabase } from "../database/supabaseClient";
export const fetchTags = async () => {
    const { data, error } = await supabase
        .from('tags')
        .select('*')
    if (error) {
        throw error
    }
    return data
}