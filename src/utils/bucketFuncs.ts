import { supabase } from "../database/supabaseClient";

export const getImgURLFromId = async (id: number, bucketName: string) => {
    const { data, error } = await supabase.storage
        .from(bucketName)
        .createSignedUrl(`public/${id}.png`, 60 * 60);

    if (error) {
        return Promise.reject(error)
    }
    return data.signedUrl

}

export const uploadPNGsToBucket = async (itemIds: number[], imageArr: Buffer[], bucketName: string) => {
    for (let i = 0; i < imageArr.length; i++) {
        const { data, error } = await supabase.storage
            .from(bucketName)
            .upload(`public/${itemIds[i]}.png`, imageArr[i], {
                contentType: 'image/png',
                cacheControl: '3600',

            });
        if (error) {
            console.error(
                `Error uploading image for question ${itemIds[i]}:`,
                error
            );
            return Promise.reject(error)
        } else {
            console.log(
                `Successfully uploaded image for question ${itemIds[i]}:`,
                data
            );
        }
    }
}

export const checkBucketUploads = async (itemIds: number[], bucketName: string) => {
    const expectedFilenames = itemIds.map((result) => result + '.png')
    const { data, error } = await supabase.storage
        .from(bucketName)
        .list('public')
    if (error) throw error

    const fileNames = data.map((file) => file.name)
    expectedFilenames.forEach((expectedFilename) => {
        if (fileNames.includes(expectedFilename)) return false
    }
    )
    return true
}