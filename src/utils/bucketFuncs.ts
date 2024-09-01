import { supabase } from "../database/supabaseClient";

export const getImgURLFromId = async (id: number, bucketName: string) => {
    if (!id || !bucketName) return Promise.reject(Error('Invalid input data'))
    const { data, error } = await supabase.storage
        .from(bucketName)
        .createSignedUrl(`public/${id}.png`, 3600);

    if (error) {
        return Promise.reject(error)
    }
    return data?.signedUrl

}

export const uploadPNGsToBucket = async (itemIds: number[], imageArr: Buffer[], bucketName: string) => {
    if (!itemIds || itemIds?.length < 1) return Promise.reject(Error('Invalid imageIds'))
    if (!imageArr || imageArr?.length < 1) return Promise.reject(Error('Invalid images'))
    if (!bucketName || typeof bucketName !== 'string') return Promise.reject(Error('Invalid bucketName'))
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
    if (!bucketName || typeof bucketName !== 'string') return Promise.reject(Error('Invalid bucketName'))
    if (!itemIds.every((itemId) => typeof itemId === 'number')) return Promise.reject(Error('Invalid itemIds'))
    const expectedFilenames = itemIds.map((result) => result + '.png')
    const { data, error } = await supabase.storage
        .from(bucketName)
        .list('public')
    if (error) return Promise.reject(error)

    const fileNames = data?.map((file) => file.name)
    return fileNames.every((fileName) => expectedFilenames.includes(fileName));


}