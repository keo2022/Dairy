package com.capstone.diary.vo;

import lombok.*;

@ToString
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MemoVO {
    private int directoryId;
    private String userId;
    private String directoryName;
    private int parentId;
    private String content;
    private String recent;
    private int studyCount;
    private int complete;
}
