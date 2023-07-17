package com.capstone.diary.controller;

import com.capstone.diary.dto.MemoDTO;
import com.capstone.diary.service.KeywordService;
import com.capstone.diary.service.MemoService;
import com.capstone.diary.service.WrongService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
@Log4j2
@RequiredArgsConstructor
public class MemoController {
    private final MemoService memoService;

    private final KeywordService keywordService;

    @PostMapping("/add")
    public String add(MemoDTO memoDTO, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes){
        log.info("add POST......");
        memoService.add(memoDTO);
        int directoryId = Integer.parseInt(request.getParameter("directoryId"));
        model.addAttribute("msg", "등록되었습니다..");
        model.addAttribute("url", "/main?directoryId="+directoryId);
        return "alert";
    }
    @GetMapping("/main")
    public void main(Model model, @SessionAttribute(value = "logininfo", required = false) String userId, @RequestParam(value = "directoryId", defaultValue = "0")int directoryId){
        model.addAttribute("directoryId",directoryId);
        model.addAttribute("back",memoService.getParentId(directoryId));
        model.addAttribute("directory", memoService.getDirectory(userId, directoryId));
        model.addAttribute("content",memoService.getContent(directoryId));
        model.addAttribute("path", memoService.path(directoryId));

    }
    @PostMapping("/register")
    public String register(MemoDTO memoDTO, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes){
        log.info("register POST......");
        memoService.register(memoDTO);
        String directoryId = request.getParameter("directoryId");
        model.addAttribute("msg", "등록되었습니다..");
        model.addAttribute("url", "/main?directoryId="+directoryId);
        return "alert";
    }

    @GetMapping({"/study/listen", "/study/speak", "/study/write", "/study/blank", "/study/make", "/study/random"})
    public void study (Model model, HttpServletRequest request,
                       @RequestParam(value = "directoryId", defaultValue = "0")int directoryId, @RequestParam(value = "index", defaultValue = "0")int index){
        String longSentence= memoService.getContent(directoryId);
        String[] sentences = longSentence.split("\\n");

        String dId = request.getParameter("directoryId");

        String random = "";
        switch ((Integer.parseInt(dId) + index) % 4){
            case 1: random = "listen"; break;
            case 2: random = "speak"; break;
            case 3: random = "blank"; break;
            default: random = "write"; break;
        }


        model.addAttribute("directoryName", memoService.getDirectoryName(directoryId));
        model.addAttribute("directoryId", dId);
        model.addAttribute("index", index);
        model.addAttribute("content", sentences);
        model.addAttribute("random", random);

        model.addAttribute("keyword", keywordService.getKeyword(directoryId));
    }
    @GetMapping("/review")
    public void reviewGet(Model model, @SessionAttribute(value = "logininfo", required = false) String userId){
        model.addAttribute("review", memoService.getReview(userId));
        model.addAttribute("today", memoService.getDate());

    }

    @PostMapping("/review")
    public String reviewPost(Model model, int directoryId){
        memoService.studyCount(directoryId);
        model.addAttribute("msg", "제출했습니다..");
        model.addAttribute("url", "/main?directoryId="+directoryId);
        return "alert";
    }
    @PostMapping("/deleteReview")
    public String deleteReview(Model model, int directoryId){
        memoService.deleteReview(directoryId);
        model.addAttribute("msg", "제출했습니다..");
        model.addAttribute("url", "/review");
        return "alert";
    }
    @GetMapping("/search")
    public void searchGet(Model model, String word){
        model.addAttribute("word", word);
        model.addAttribute("search", memoService.search(word));

    }
    @PostMapping("/search")
    public String searchPost(Model model, String word){
        try {
            // 파라미터를 URL 인코딩하여 리다이렉션할 URL을 생성합니다.
            String encodedWord = URLEncoder.encode(word, "UTF-8");

            // 인코딩된 파라미터와 함께 리다이렉션합니다.
            return "redirect:/search?word=" + encodedWord;
        } catch (UnsupportedEncodingException e) {
            // 인코딩 예외 처리를 수행합니다.
            e.printStackTrace();
            // 예외 발생 시 대체할 페이지를 반환합니다.
            return "redirect:/custom404";
        }
    }

    @PostMapping("/addKeyword")
    public String addKeyword(Model model, int directoryId, String keyword){
        keywordService.addKeyword(directoryId, keyword);
        model.addAttribute("msg", "등록했습니다.");
        model.addAttribute("url", "/main?directoryId="+directoryId);
        return "alert";
    }

    @GetMapping("/test")
    public void test(){    }


}
