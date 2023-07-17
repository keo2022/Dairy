package com.capstone.diary.service;

import com.capstone.diary.dto.UserDTO;
import com.capstone.diary.mapper.KeywordMapper;
import com.capstone.diary.mapper.UserMapper;
import com.capstone.diary.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class KeywordServiceImpl implements KeywordService{
    private final KeywordMapper keywordMapper;
    private final ModelMapper modelMapper;


    @Override
    public void addKeyword(int directoryId, String keyword) {
        keywordMapper.addKeyword(directoryId, keyword);
    }

    @Override
    public List<String> getKeyword(int directoryId) {
        return keywordMapper.getKeyword(directoryId);
    }
}
