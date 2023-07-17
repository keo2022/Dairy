package com.capstone.diary.service;

import com.capstone.diary.dto.MemoDTO;
import com.capstone.diary.mapper.MemoMapper;
import com.capstone.diary.vo.MemoVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class MemoServiceImpl implements MemoService{
    private final MemoMapper memoMapper;
    private final ModelMapper modelMapper;

    @Override
    public String getDate() {
        return memoMapper.getDate();
    }

    @Override
    public String getParentId(int directoryId) {

        return memoMapper.getParentId(directoryId);
    }

    @Override
    public List<MemoDTO> getDirectory(String userId, int directoryId) {
        List<MemoDTO> dtoList = memoMapper.getDirectory(userId, directoryId).stream()
                .map(vo -> modelMapper.map(vo, MemoDTO.class))
                .collect(Collectors.toList());
        return dtoList;
    }
    @Override
    public void add(MemoDTO memoDTO) {
        MemoVO memoVO = modelMapper.map(memoDTO, MemoVO.class);
        memoMapper.add(memoVO);
    }

    @Override
    public String getContent(int directoryId) {

        return memoMapper.getContent(directoryId);
    }

    @Override
    public void register(MemoDTO memoDTO) {
        MemoVO memoVO = modelMapper.map(memoDTO, MemoVO.class);
        memoMapper.register(memoVO);
    }

    @Override
    public void studyCount(int directoryId) {
        memoMapper.studyCount(directoryId);
    }

    @Override
    public List<MemoDTO> getReview(String userId) {
        List<MemoDTO> dtoList = memoMapper.getReview(userId).stream()
                .map(vo -> modelMapper.map(vo, MemoDTO.class))
                .collect(Collectors.toList());
        return dtoList;
    }

    @Override
    public String getDirectoryName(int directoryId) {
        return memoMapper.getDirectoryName(directoryId);
    }


    @Override
    public List<MemoDTO> search(String word) {
        List<MemoDTO> dtoList = memoMapper.search(word).stream()
                .map(vo -> modelMapper.map(vo, MemoDTO.class))
                .collect(Collectors.toList());
        return dtoList;
    }

    @Override
    public String path(int directoryId) {
        return memoMapper.path(directoryId);
    }

    @Override
    public void deleteReview(int directoryId) {
        memoMapper.deleteReview(directoryId);
    }
}
