package com.capstone.diary.dto;

import lombok.*;

@ToString
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {
    private String userId;
    private String userPassword;
    private String name;
}
