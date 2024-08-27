import { jwtDecode } from "jwt-decode";
import { supabase } from "../database/supabaseClient";
import { Token } from "../types/Auth";
import { CustomUser } from "../middleware/user";

export const fetchClasses = async (token?: Token) => {
    if (!token) throw Error('No token')
    const userId = token.user.id
    const user = jwtDecode(token?.access_token) as CustomUser
    if (user.user_role === 'admin') {
        const { data, error } = await supabase
            .from('classes')
            .select('*')
        if (error) return Promise.reject(error)
        if (data)
            return data

    }
    else {
        const { data, error } = await supabase.rpc('get_user_classes', {
            userid: userId
        })
        if (error) return Promise.reject(error)
        if (data)
            return data
    }
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