package com.capstone.diary.vo;

import lombok.*;

@ToString
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
    private String userId;
    private String userPassword;
    private String name;
}
