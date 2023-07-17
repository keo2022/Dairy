package com.capstone.diary.controller;

import com.capstone.diary.dto.UserDTO;
import com.capstone.diary.service.UserService;
import com.capstone.diary.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.UUID;

@Controller
@Log4j2
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    @GetMapping("/join")
    public void joinGet(){
        log.info("join GET.......");
    }
    @PostMapping("/join")
    public String joinPost(UserDTO userDTO, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes){
        log.info("join POST......");
        if(bindingResult.hasErrors()){
            log.info("has error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            model.addAttribute("msg", "회원가입 실패하였습니다. 다시 시도해주세요");
            model.addAttribute("url", "/join");
            return "alert";
        }
        log.info(userDTO);
        userService.join(userDTO);
        model.addAttribute("msg", "회원가입 되었습니다. 로그인화면으로 이동합니다.");
        model.addAttribute("url", "/login");
        return "alert";
    }

    @GetMapping("/login")
    public void loginGet(){
        log.info("login GET.......");
    }
    @PostMapping("/login")
    public String loginPost(UserDTO userDTO, BindingResult bindingResult, HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes){
        log.info("login POST......");

        if(bindingResult.hasErrors()){
            log.info("has error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            model.addAttribute("msg", "로그인에 실패하였습니다. 다시 시도해주세요");
            model.addAttribute("url", "/join");
            return "alert";
        }

        HttpSession session = request.getSession();
        session.setAttribute("logininfo", userService.login(userDTO));
        model.addAttribute("msg", "로그인되었습니다.");
        model.addAttribute("url", "/main");
        return "alert";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes){

        Cookie userCookie = WebUtils.getCookie(request, "remember-me"); // 무효화할 쿠키 객체 생성
        if(userCookie != null) {
            userCookie.setMaxAge(0); // 쿠키의 수명을 0으로 설정하여 즉시 만료시킴
            response.addCookie(userCookie); // 응답에 쿠키 추가
        }
        session.invalidate();
        model.addAttribute("msg", "로그아웃되었습니다.");
        model.addAttribute("url", "/main");
        return "alert";
    }
}
