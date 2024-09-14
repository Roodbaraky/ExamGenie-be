/* eslint-disable @typescript-eslint/no-explicit-any */
import { describe, expect, it } from '@jest/globals';
import { fetchClasses, isClassNameValid } from '../src/models/classes';
import '../__mocks__/supabaseClient';
import { Token } from '../src/types/Auth';
import { testUser } from './testUser';
import { jwtDecode } from 'jwt-decode';

const mockToken: Token = {
    access_token: '',
    refresh_token: '',
    user: testUser
}
jest.mock('jwt-decode', () => ({
    jwtDecode: jest.fn()
}))



describe('isClassNameValid', () => {
    it('should return true when passed a valid className', () => {
        const result = isClassNameValid('10xyz')
        expect(result).toBe(true)
    });

    it('should error if passed an invalid className', async () => {
        try {
            await isClassNameValid('invalidClassName')
            throw Error('Wrong error')
        } catch (error) {
            expect((error as Error).message).toBe('Invalid className')
        }
    })
})

describe('fetchClasses', () => {
    beforeAll(() => {
        (jwtDecode as jest.Mock).mockImplementation(() => ({
            ...testUser,
            user_role: 'admin'
        }));
    });

    it('should return an array of class objects when called', async () => {
        const { setTestData } = jest.requireMock('../src/database/supabaseClient.ts')
        setTestData(['']);
        const classes = await fetchClasses(mockToken)
        expect(Array.isArray(classes)).toBe(true)
        classes.forEach((classItem: any) => {
            expect(classItem).toMatchObject({
                id: expect.any(Number),
                class_name: expect.any(String),
            })
        })
    });
    //For some reason the following test invokes the ACTUAL Supabase client, not the mock implementation found in __mocks__
    // it('should return and array of class objects corresponding to the user, if not admin/anon', async () => {
    //     (jwtDecode as jest.Mock).mockImplementation(() => ({
    //         ...testUser,
    //         user_role: 'moderator'
    //     }));
    //     const  supabase  = jest.requireActual('../__mocks__/supabaseClient')
    //     // const supabase = jest.requireMock('../src/database/supabaseClient.ts')
    //     await fetchClasses(mockToken)
    //     expect(supabase.rpc).toHaveBeenCalledWith('get_user_classes', { userid: `9979192d-d27e-43pp000-34da76ed051f` })
    // })

    it('should  error if called without a token', async () => {
        try {
            await fetchClasses()
            throw Error('Wrong error')
        } catch (error) {
            expect((error as Error).message).toBe('No token')
        }
    });

    it('should handle supabase errors', async () => {
        const { setTestError } = jest.requireMock('../src/database/supabaseClient.ts')
        setTestError(Error('Supabase error'))
        try {
            await fetchClasses(mockToken)
        }
        catch (error) {
            expect((error as Error).message).toBe('Supabase error')
        }

    });





})