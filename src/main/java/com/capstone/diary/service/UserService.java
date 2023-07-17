package com.capstone.diary.service;

import com.capstone.diary.dto.UserDTO;
import com.capstone.diary.vo.UserVO;

public interface UserService {
    void join(UserDTO userDTO);
    String login(UserDTO userDTO);


}
