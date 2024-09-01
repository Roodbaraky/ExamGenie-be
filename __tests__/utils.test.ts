/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable @typescript-eslint/no-explicit-any */
import { beforeEach, describe, expect, it, jest } from '@jest/globals';
import { checkBucketUploads, getImgURLFromId, uploadPNGsToBucket } from '../src/utils/bucketFuncs';
import { testImage } from './testImage';


jest.mock('../src/database/supabaseClient', () => {
    let testData = {
        signedUrl: 'mockedSignedUrl',
    };
    let testError: Error | null = null;

    const createSignedUrlMock = jest.fn(() => ({
        data: testData,
        error: testError,
    }));

    const uploadMock = jest.fn((imgUrl: string) => ({
        data: testData,
        error: testError,
    }))

    const listMock = jest.fn((folderName: string) => ({
        data: testData,
        error: testError
    }))

    const fromMock = jest.fn(() => ({
        createSignedUrl: createSignedUrlMock,
        upload: uploadMock,
        list: listMock
    }));

    const mockSupabaseClient = {
        storage: {
            from: fromMock,
        },
    };

    return {
        supabase: mockSupabaseClient,
        setTestData: (newData: any) => {
            testData = newData;
        },
        setTestError: (error: Error) => {
            testError = error
        }
    };
});

beforeEach(() => {
    jest.clearAllMocks();
    const { setTestData, setTestError } = jest.requireMock('../src/database/supabaseClient') as any;
    setTestData({ signedUrl: 'mockedSignedUrl' });
    setTestError(null);
});

describe('getImgURLFromId', () => {
    it('should return a signed URL when passed an imageId', async () => {
        const { setTestData, supabase } = jest.requireMock('../src/database/supabaseClient') as any;
        setTestData({ signedUrl: 'www.image.com' });
        const result = await getImgURLFromId(1, 'questions');
        expect(result).toEqual('www.image.com');
        expect(supabase.storage.from).toHaveBeenCalledWith('questions');
        expect(supabase.storage.from('questions').createSignedUrl).toHaveBeenCalledWith('public/1.png', 3600);
    });

    it('should return and error when passed an invalid id/bucketName', async () => {
        try {
            const result = await getImgURLFromId(null as any, null as any) as any
            expect(result).toBeUndefined()
        }
        catch (error) {
            expect((error as Error).message).toBe('Invalid input data')
        }
    });

    it('should handle supabase errors gracefully', async () => {
        const { setTestError, supabase } = jest.requireMock('../src/database/supabaseClient') as any;
        setTestError(Error('Supabase error'))
        try {
            const result = await getImgURLFromId(1, 'questions');
            expect(result).toBeUndefined()
        } catch (error) {
            expect((error as Error).message).toBe('Supabase error')
        }

    })
});

describe('uploadPNGsToBucket', () => {
    it('should log successfully uploaded image/question details on success', async () => {
        const { setTestData, supabase } = jest.requireMock('../src/database/supabaseClient') as any;
        const log = jest.spyOn(console, 'log').mockImplementation(() => { })
        setTestData('1.png')
        await uploadPNGsToBucket([1, 2, 3], [Buffer.from(testImage), Buffer.from(testImage), Buffer.from(testImage)], 'questions')
        expect(supabase.storage.from).toHaveBeenCalledWith('questions')
        expect(supabase.storage.from('questions').upload).toHaveBeenCalledWith('public/1.png', Buffer.from(testImage), { "cacheControl": "3600", "contentType": "image/png" });
        expect(supabase.storage.from('questions').upload).toHaveBeenCalledWith('public/2.png', Buffer.from(testImage), { "cacheControl": "3600", "contentType": "image/png" });
        expect(supabase.storage.from('questions').upload).toHaveBeenCalledWith('public/3.png', Buffer.from(testImage), { "cacheControl": "3600", "contentType": "image/png" });
        expect(log).toHaveBeenCalledTimes(3)
        expect(log).toHaveBeenCalledWith('Successfully uploaded image for question 1:', '1.png');
        expect(log).toHaveBeenCalledWith('Successfully uploaded image for question 2:', '1.png');
        expect(log).toHaveBeenCalledWith('Successfully uploaded image for question 3:', '1.png');
        log.mockRestore()
    });

    it('should error if passed invalid images', async () => {
        try {
            const result = await uploadPNGsToBucket([1, 2, 3] as any, null as any, 'questions') as any
            throw Error('wrong error')

        } catch (error) {
            expect((error as Error).message).toBe('Invalid images')
        }
    });

    it('should error if passed invalid itemIds', async () => {
        try {
            const result = await uploadPNGsToBucket(null as any, [Buffer.from(testImage), Buffer.from(testImage), Buffer.from(testImage)], 'questions') as any
            throw Error('wrong error')

        } catch (error) {
            expect((error as Error).message).toBe('Invalid imageIds')
        }
    });

    it('should error if passed invalid bucketName', async () => {
        try {
            const result = await uploadPNGsToBucket([1, 2, 3] as any, [Buffer.from(testImage), Buffer.from(testImage), Buffer.from(testImage)], null as any) as any
            throw Error('wrong error')
        } catch (error) {
            expect((error as Error).message).toBe('Invalid bucketName')
        }
    });

    it('should handle supabase errors gracefully', async () => {
        const { setTestError, supabase } = jest.requireMock('../src/database/supabaseClient') as any;
        setTestError(Error('Supabase error'))
        try {
            await uploadPNGsToBucket([1, 2, 3], [Buffer.from(testImage), Buffer.from(testImage), Buffer.from(testImage)], 'questions')
        } catch (error) {
            expect((error as Error).message).toBe('Supabase error')
        }


    })
})

describe('checkBucketUploads', () => {
    it('should return true if files exist in the bucket corresponding to itemIds', async () => {
        const { setTestData, supabase } = jest.requireMock('../src/database/supabaseClient') as any;
        setTestData([{ name: '1.png' }, { name: '2.png' }, { name: '3.png' }])
        const result = await checkBucketUploads([1, 2, 3], 'questions')
        expect(result).toBe(true)
        expect(supabase.storage.from).toBeCalledWith('questions')
        expect(supabase.storage.from('questions').list).toBeCalledWith('public')
        expect(supabase.storage.from('questions').list).toHaveBeenCalledTimes(1)
    });

    it('should return false if files do not exist in the bucket', async () => {
        const { setTestData, supabase } = jest.requireMock('../src/database/supabaseClient') as any;
        setTestData([{ name: '1.png' }, { name: '2.png' }, { name: '3.png' }])
        const result = await checkBucketUploads([4, 5, 6], 'questions')
        expect(result).toBe(false)
        expect(supabase.storage.from).toBeCalledWith('questions')
        expect(supabase.storage.from('questions').list).toBeCalledWith('public')
        expect(supabase.storage.from('questions').list).toHaveBeenCalledTimes(1)
    });

    it('should error if passed invalid bucketName', async () => {
        try {
            await checkBucketUploads([1, 2, 3], 99 as any)
            throw Error('wrong error')
        } catch (error) {
            expect((error as Error).message).toBe('Invalid bucketName')
        }
    });

    it('should error if passed invalid itemIds', async () => {
        try {
            await checkBucketUploads(['a' as any, 'b', 'c'], 'questions')
            throw Error('wrong error')
        } catch (error) {
            expect((error as Error).message).toBe('Invalid itemIds')
        }
    });
})