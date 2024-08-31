/* eslint-disable @typescript-eslint/no-explicit-any */
import { describe, expect, it } from '@jest/globals';
import { getImgURLFromId } from '../src/utils/bucketFuncs'
import { supabase } from "../src/database/supabaseClient";

// import { convertFromBase64ToImage } from '../src/utils/utils';
// import { testImage } from './testImage';
// import { testImageString } from './testImageString';

// // describe('Utils', () => {
// //     describe('convertFromBase64ToImage', () => {
// //         it('should convert valid base64 strings to image buffers', () => {
// //             const actual = convertFromBase64ToImage(testImage)
// //             const expected = Buffer.from(testImageString)
// //             expect(actual).toEqual(expected)
// //         })
// //     })
// // })
// Jest seems to have its own ideas about encoding that are different to node, so this runs indefinitely...
jest.mock('../src/database/supabaseClient', () => ({
    supabase: {
        storage: {
            from: jest.fn(() => ({
                createSignedUrl: jest.fn(),
            })),
        },
    },
}));

describe('getImgURLFromId', () => {
    beforeEach(() => {
       
        const mockCreateSignedUrl = supabase.storage.from('questions').createSignedUrl as jest.Mock;
        mockCreateSignedUrl.mockReset();
    });

    it('should return a URL string when passed an imageId', async () => {
        const mockCreateSignedUrl = supabase.storage.from('questions').createSignedUrl as jest.Mock;

        mockCreateSignedUrl.mockResolvedValue({
            data: { signedUrl: 'www.image.com' },
            error: null,
        });

        const result = await getImgURLFromId(1, 'questions');
        expect(result).toEqual('www.image.com');
    });

    it('should throw an error when createSignedUrl fails', async () => {
        const mockCreateSignedUrl = supabase.storage.from('questions').createSignedUrl as jest.Mock;

   
        mockCreateSignedUrl.mockResolvedValue({
            data: null,
            error: new Error('Failed to create signed URL'),
        });

        await expect(getImgURLFromId(1, 'questions')).rejects.toThrow('Failed to create signed URL');
    });
});