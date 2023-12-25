package org.vivekn4u.com.springvideoservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.vivekn4u.com.springvideoservice.entity.FileData;
import org.vivekn4u.com.springvideoservice.service.FirebaseJwtUtil;

import java.util.List;

@RestController
@RequestMapping("/api")
public class VideoController {

    @Autowired
    private FirebaseJwtUtil firebaseJwtUtil;

    @GetMapping("/video")
    public ResponseEntity getVideoUrl(){
        List<FileData> videos =  firebaseJwtUtil .getVideoFileList();

        if(videos ==null || videos.isEmpty()){
            return new ResponseEntity<String>("No Data Available!", HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<List<FileData>>(videos, HttpStatus.OK);
    }

    @PostMapping("/upload")
    public ResponseEntity create(@RequestParam(name = "file") MultipartFile file) {
        String fileName = "";
        try {
                fileName = firebaseJwtUtil.saveVideoFile(file);
            // do whatever you want with that
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
        return new ResponseEntity<String>(fileName, HttpStatus.OK);
    }

}
