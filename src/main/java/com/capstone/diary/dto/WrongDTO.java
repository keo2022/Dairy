package com.capstone.diary.dto;

import lombok.*;

@ToString
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class WrongDTO {
    private int wrongId;
    private int directoryId;
    private String userId;
    private String directoryName;
    private String content;
    private int wrongCount;
}
