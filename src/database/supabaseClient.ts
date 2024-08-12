import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv'
dotenv.config()

const SUPABASE_URL = process.env.SUPABASE_URL 
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_KEY 
const VITE_KEY=process.env.VITE_SUPABASE_ANON_KEY

export const supabase = createClient(SUPABASE_URL!, SUPABASE_SERVICE_KEY!)
