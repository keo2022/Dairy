package com.capstone.diary.service;

import com.capstone.diary.dto.UserDTO;

import java.util.List;

public interface KeywordService {
    void addKeyword(int directoryId, String keyword);
    List<String> getKeyword(int directoryId);


}
