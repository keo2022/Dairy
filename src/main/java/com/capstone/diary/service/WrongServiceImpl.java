package com.capstone.diary.service;

import com.capstone.diary.dto.WrongDTO;
import com.capstone.diary.mapper.WrongMapper;
import com.capstone.diary.vo.WrongVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class WrongServiceImpl implements WrongService {
    private final WrongMapper wrongMapper;
    private final ModelMapper modelMapper;


    @Override
    public void wrongAdd(WrongDTO wrongDTO) {
        WrongVO wrongVO = modelMapper.map(wrongDTO, WrongVO.class);
        wrongMapper.wrongAdd(wrongVO);
    }

    @Override
    public List<WrongDTO> getWrong(String userId) {
        List<WrongDTO> dtoList = wrongMapper.getWrong(userId).stream()
                .map(vo -> modelMapper.map(vo, WrongDTO.class))
                .collect(Collectors.toList());
        return dtoList;
    }

    @Override
    public void delete(String content) {
        wrongMapper.delete(content);
    }

}
