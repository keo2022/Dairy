package com.capstone.diary.mapper;

import com.capstone.diary.vo.UserVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface KeywordMapper {
    void addKeyword(@Param("directoryId") int directoryId, @Param("keyword") String keyword);
    List<String> getKeyword(int directoryId);
}
