package com.capstone.diary;

import com.capstone.diary.dto.MemoDTO;
import com.capstone.diary.dto.UserDTO;
import com.capstone.diary.mapper.MemoMapper;
import com.capstone.diary.service.MemoService;
import com.capstone.diary.vo.MemoVO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class MemoTests {

    @Autowired(required = false)
    private MemoMapper memoMapper;
    @Autowired(required = false)
    private MemoService memoService;

    @Test
    public void registerTest(){
        MemoDTO memoDTO = MemoDTO.builder()
                .content("test content")
                .directoryId(0)
                .build();
        memoService.register(memoDTO);
    }


}
