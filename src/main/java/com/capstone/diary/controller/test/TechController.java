package com.capstone.diary.controller.test;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Log4j2
@Controller
public class TechController {
    @GetMapping("/clovaOCR")
    public void getClovaOCR(){
        log.info("get clova OCR...");
    }

    @GetMapping("/ttstest")
    public void getTts(){
        log.info("get tts test...");
    }
}
