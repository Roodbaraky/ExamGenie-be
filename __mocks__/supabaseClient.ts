/* eslint-disable @typescript-eslint/no-explicit-any */
/* eslint-disable @typescript-eslint/no-unused-vars */
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

    const selectMock = jest.fn(() => ({
        eq: jest.fn().mockReturnThis(),
        in: jest.fn().mockReturnThis(),
        is: jest.fn().mockReturnThis(),
        order: jest.fn().mockReturnThis(),
        gte: jest.fn().mockReturnThis(),
        lte: jest.fn().mockReturnThis(),
        data: testData,
        error: testError
    }))

    const fromMock = jest.fn(() => ({
        createSignedUrl: createSignedUrlMock,
        upload: uploadMock,
        list: listMock,
        select: selectMock
    }));
    const rpcMock = jest.fn(() => ({
        data: testData,
        error: testError
    }))
    const mockSupabaseClient = {
        storage: {
            from: fromMock,
        },
        from: fromMock,
        rpc: rpcMock
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