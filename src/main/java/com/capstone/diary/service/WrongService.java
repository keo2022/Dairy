package com.capstone.diary.service;

import com.capstone.diary.dto.WrongDTO;
import com.capstone.diary.vo.WrongVO;

import java.util.List;

public interface WrongService {
    void wrongAdd(WrongDTO wrongDTO);
    List<WrongDTO> getWrong(String userId);
    void delete(String content);
}
