import { supabase } from "../database/supabaseClient";
export const fetchClasses = async () => {
    const { data, error } = await supabase
        .from('classes')
        .select('*')
        
    if (error) {
        throw error
    }
    return data
}