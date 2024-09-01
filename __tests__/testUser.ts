import { User } from "@supabase/supabase-js";

export const testUser:User = {
    app_metadata: { provider: "email", providers: ["email"] },
    aud: "authenticated",
    confirmed_at:"2024-08-17T22:07:05.792715Z",
    created_at:"2024-08-17T22:07:05.78385Z",
    email:"example@email.com",
    email_confirmed_at: "2024-08-17T22:07:05.792715Z",
    id: "9979192d-d27e-43pp000-34da76ed051f",
    identities: [{
        identity_id: "5bcc42ee-9670-4a899926d24e31e2f8",
        id: "997969420d-d27e-43e5-a887-34da76ed051f",
        user_id: '',
        provider: ""
    }],
    is_anonymous: false,
    last_sign_in_at: "2024-08-31T21:28:13.640808Z",
    phone: "",
    role: "authenticated",
    updated_at: "2024-09-01T18:15:57.229491Z",
    user_metadata: {},
}
