package org.vivekn4u.com.springvideoservice.service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.Blob;
import com.google.cloud.storage.Storage;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseToken;
import com.google.firebase.auth.internal.GetAccountInfoResponse;
import com.google.firebase.cloud.StorageClient;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import io.jsonwebtoken.security.Keys;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.vivekn4u.com.springvideoservice.entity.FileData;

import java.io.*;
import java.security.Key;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
//import java.security.PublicKey;


@Service
public class FirebaseJwtUtil {


    private FirebaseApp firebaseApp;

    private StorageClient storageClient;



    @PostConstruct
    public void initialization() {

        try{
            FileInputStream inputStream = new FileInputStream("src/main/resources/tiktok-7f877-serviceAccountKey.json");
            FirebaseOptions options = new FirebaseOptions.Builder()
                    .setCredentials(GoogleCredentials.fromStream(inputStream))
                    .setStorageBucket("tiktok-7f877.appspot.com")
                    .build();

            FirebaseApp.initializeApp(options);
        }
        catch (Exception error) {
            error.printStackTrace();
        }

    }

    private File convertToFile(MultipartFile multipartFile, String fileName) throws IOException {
        File tempFile = new File(fileName);
        try (FileOutputStream fos = new FileOutputStream(tempFile)) {
            fos.write(multipartFile.getBytes());
            fos.close();
        }
        return tempFile;
    }

    public String saveVideoFile(MultipartFile file) throws IOException{
        String fileName = generateFileName(file.getOriginalFilename());
//        Map<String, String> map = new HashMap<>();
//        map.put("firebaseStorageDownloadTokens", imageName);
//        BlobId blobId = BlobId.of("YOUR_BUCKET_NAME", imageName);
//        BlobInfo blobInfo = BlobInfo.newBuilder(blobId)
//                .setMetadata(map)
//                .setContentType(file.getContentType())
//                .build();
        String blobString = "video/" + fileName;
        storageClient.bucket().create(blobString, file.getInputStream());
        return fileName;
    }

    public List<FileData> getVideoFileList(){
        firebaseApp = FirebaseApp.getInstance();
        storageClient = StorageClient.getInstance(firebaseApp);

        List<FileData> files = new ArrayList<>();
        try {
            for (Blob blob : storageClient.bucket().list(/*Storage.BlobListOption.prefix("video/"), Storage.BlobListOption.delimiter("/")*/).iterateAll()) {
                FileData fileData = new FileData();
                fileData.setName(blob.getName());
                fileData.setUrl(blob.getMediaLink());
                files.add(fileData);
            }
            return files;
        }catch (Exception e){
            return files;
        }
    }

    private String generateFileName(String originalFileName) {
        return UUID.randomUUID().toString() + "." + getExtension(originalFileName);
    }

    private String getExtension(String originalFileName) {
        return StringUtils.getFilenameExtension(originalFileName);
    }

}
