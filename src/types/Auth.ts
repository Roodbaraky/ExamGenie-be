import { User } from "@supabase/supabase-js"

export interface Token {
    access_token: string
    refresh_token: string
    user:User
}