import { User } from '@supabase/supabase-js';
declare global {
  declare namespace Express {
    interface Request {
      user?: User
    }
    interface Response {
      user?: User
    }
  }
}