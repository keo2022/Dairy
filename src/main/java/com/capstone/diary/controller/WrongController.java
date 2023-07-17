package com.capstone.diary.controller;

import com.capstone.diary.dto.WrongDTO;
import com.capstone.diary.service.WrongService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpServletRequest;

@Controller
@Log4j2
@RequiredArgsConstructor
public class WrongController {
    private final WrongService wrongService;
    @GetMapping("/wrong")
    public void wrongGet(Model model, @SessionAttribute(value = "logininfo", required = false) String userId){
        model.addAttribute("wrong", wrongService.getWrong(userId));
    }
    @PostMapping("/wrong")
    public String wrongPost(WrongDTO wrongDTO,
                            HttpServletRequest request){

        wrongService.wrongAdd(wrongDTO);
        String referer = request.getHeader("Referer");
        return "redirect:"+referer;
    }
    @PostMapping("/deleteWrong")
    public String deleteWrong(Model model, String content){
        wrongService.delete(content);
        model.addAttribute("msg", "삭제했습니다.");
        model.addAttribute("url", "/wrong");
        return "alert";

    }
}
