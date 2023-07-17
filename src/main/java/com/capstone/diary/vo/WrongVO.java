package com.capstone.diary.vo;

import lombok.*;

@ToString
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class WrongVO {
    private int wrongId;
    private int directoryId;
    private String userId;
    private String directoryName;
    private String content;
    private int wrongCount;

}
