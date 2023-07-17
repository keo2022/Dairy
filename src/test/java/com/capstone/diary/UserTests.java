package com.capstone.diary;

import com.capstone.diary.dto.UserDTO;
import com.capstone.diary.service.UserService;
import com.capstone.diary.vo.UserVO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class UserTests {

    @Autowired(required = false)
    private UserService userService;
    @Test
    public void testjoin(){
        UserDTO userDTO = UserDTO.builder()
                .userId("testid")
                .userPassword("testpass")
                .build();
        userService.join(userDTO);

    }
    @Test
    public void testlogin(){
        UserDTO userDTO = UserDTO.builder()
                .userId("1111")
                .userPassword("1111")
                .build();
        log.info(userService.login(userDTO));
    }
}
