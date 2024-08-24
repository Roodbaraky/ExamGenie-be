
export const convertFromBase64ToImage = (base64ImageString: string) => {
    const cleanedBase64String = base64ImageString.replace(/^data:image\/\w+;base64,/, '')
    const imageBuffer = Buffer.from(cleanedBase64String, 'base64')
    return imageBuffer
}

