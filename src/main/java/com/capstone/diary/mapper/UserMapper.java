package com.capstone.diary.mapper;

import com.capstone.diary.vo.UserVO;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    void join(UserVO userVO);
    String login(UserVO userVO);
}
