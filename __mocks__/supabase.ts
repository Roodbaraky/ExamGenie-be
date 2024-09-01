export const createSupabaseMock = () => {
    const fromMock = jest.fn(() => ({
      select: jest.fn(() => ({
        eq: jest.fn(() => ({
          single: jest.fn(() => ({
            data: { id: 1, name: 'Test' },
            error: null,
          })),
        })),
      })),
      insert: jest.fn(() => ({
        single: jest.fn(() => ({
          data: { id: 1, name: 'Test' },
          error: null,
        })),
      })),
      update: jest.fn(() => ({
        eq: jest.fn(() => ({
          single: jest.fn(() => ({
            data: { id: 1, name: 'Updated Test' },
            error: null,
          })),
        })),
      })),
      delete: jest.fn(() => ({
        eq: jest.fn(() => ({
          single: jest.fn(() => ({
            data: null,
            error: null,
          })),
        })),
      })),
    }));
  
    const uploadMock = jest.fn(() => ({
      data: { Key: 'path/to/uploaded/file.png' },
      error: null,
    }));
  
    const downloadMock = jest.fn(() => ({
      data: new Blob(['mock file content']),
      error: null,
    }));
  
    const removeMock = jest.fn(() => ({
      data: null,
      error: null,
    }));
  
    const listMock = jest.fn(() => ({
      data: [
        { name: 'file1.png', id: '1' },
        { name: 'file2.png', id: '2' },
      ],
      error: null,
    }));
  
    return {
      from: fromMock,
      storage: {
        from: jest.fn(() => ({
          upload: uploadMock,
          download: downloadMock,
          remove: removeMock,
          list: listMock,
        })),
      },
    };
  };
  