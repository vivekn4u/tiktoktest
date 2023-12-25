package org.vivekn4u.com.springvideoservice.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class VideoController {

    @GetMapping("/video")
    public String getVideoUrl(){
        return "URL Path";
    }

}
