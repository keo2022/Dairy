package com.capstone.diary.mapper;

import com.capstone.diary.vo.MemoVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MemoMapper {
    String getDate();
    String getParentId(int directoryId);
    List<MemoVO> getDirectory(@Param("userId") String userId, @Param("directoryId") int directoryId);
    void add(MemoVO memoVO);
    String getContent(int directoryId);
    void register(MemoVO memoVO);
    void studyCount(int directoryId);
    List<MemoVO> getReview(String userId);
    String getDirectoryName(int directoryId);
    List<MemoVO> search(String word);

    String path(int directoryId);

    void deleteReview(int directoryId);



}
