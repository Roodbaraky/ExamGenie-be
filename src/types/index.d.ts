import { User } from '@supabase/supabase-js';
import Express from 'express-serve-static-core';
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