import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv'
dotenv.config()

const SUPABASE_URL = process.env.SUPABASE_URL 
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_KEY 
const SUPABASE_KEY = process.env.SUPABASE_KEY 


export const supabase = createClient(SUPABASE_URL!, SUPABASE_KEY!)

//Connect with service key to bypass RLS
export const supabaseSeedClient = createClient(SUPABASE_URL!, SUPABASE_SERVICE_KEY!)
