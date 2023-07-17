package com.capstone.diary.service;

import com.capstone.diary.dto.MemoDTO;
import com.capstone.diary.vo.MemoVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MemoService {
    String getDate();
    String getParentId(int directoryId);
    List<MemoDTO> getDirectory(String userId, int directoryId);
    void add(MemoDTO memoDTO);
    String getContent(int directoryId);
    void register(MemoDTO memoDTO);
    void studyCount(int directoryId);
    List<MemoDTO> getReview(String userId);
    String getDirectoryName(int directoryId);
    List<MemoDTO> search(String word);
    String path(int directoryId);
    void deleteReview(int directoryId);





}
