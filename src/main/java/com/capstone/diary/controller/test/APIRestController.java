package com.capstone.diary.controller.test;

import com.capstone.diary.service.OCR.OCRGeneralAPIDemo;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
@Log4j2
@RestController
public class APIRestController {
    @Autowired
    private OCRGeneralAPIDemo ocrGeneralAPIDemo;

    @PostMapping("/clovaOCR")
    public String clovaOCR(@RequestParam("uploadFile") MultipartFile file){
        log.info("POST clovaOCR...");
        String result = "";
        try {
            // 1. 파일 저장 경로 설정 : 실제 서비스되는 위치 (프로젝트 외부에 저장)
            String uploadPath = "/Users/dmsdh/testimage";
            //C:\Users\dmsdh\testimage
            // 2. 원본 파일 이름 알아오기
            String originalFileName = file.getOriginalFilename();
            String filePathName = uploadPath + originalFileName;
            // 3. 파일 생성
            File file1 = new File(filePathName);
            // 4. 서버로 전송
            file.transferTo(file1);
            // 서비스에 파일 path와 파일명 전달  -> 서비스 메소드에서 변경
            // 서비스에서 반환된 텍스트를 result에 저장
            result = ocrGeneralAPIDemo.clovaOCRService(filePathName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(result);
        return result;
    }


}