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

export const checkIfClassExists = async (className: string) => {
    try {
        const { data, error } = await supabase
            .from('classes')
            .select('class_name')
            .eq('class_name', className)

        if (error) {
            return Promise.reject(error);
        }
        if (data && data.length === 0) {
            return Promise.reject('Class not found');

        }
    } catch (error) {
        return Promise.reject(error);
    }
}