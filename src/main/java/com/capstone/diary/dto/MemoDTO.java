package com.capstone.diary.dto;

import lombok.*;

@ToString
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MemoDTO {
    private int directoryId;
    private String userId;
    private String directoryName;
    private int parentId;
    private String content;
    private String recent;
    private int studyCount;
    private int complete;
}
