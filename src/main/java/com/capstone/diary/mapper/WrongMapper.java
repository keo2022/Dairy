package com.capstone.diary.mapper;

import com.capstone.diary.vo.WrongVO;

import java.util.List;

public interface WrongMapper {
    void wrongAdd(WrongVO wrongVO);
    List<WrongVO> getWrong(String userId);
    void delete(String content);
}
