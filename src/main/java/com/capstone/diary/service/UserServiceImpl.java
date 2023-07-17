package com.capstone.diary.service;

import com.capstone.diary.dto.UserDTO;
import com.capstone.diary.mapper.UserMapper;
import com.capstone.diary.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
@Log4j2
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
    private final UserMapper userMapper;
    private final ModelMapper modelMapper;


    @Override
    public void join(UserDTO userDTO) {
        log.info(modelMapper);
        UserVO userVO = modelMapper.map(userDTO, UserVO.class);
        log.info(userVO);
        userMapper.join(userVO);


    }

    @Override
    public String login(UserDTO userDTO) {
        UserVO userVO = modelMapper.map(userDTO, UserVO.class);
        return userMapper.login(userVO);
    }



}
