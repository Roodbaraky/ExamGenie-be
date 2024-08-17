import { supabase } from "../database/supabaseClient";
export const fetchClasses = async () => {
    const { data, error } = await supabase
        .from('classes')
        .select('*')
        // WHERE className IN ARRAY_AGG(user.classes)...
    if (error) {
        throw error
    }
    return data
}