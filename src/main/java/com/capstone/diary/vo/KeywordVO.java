package com.capstone.diary.vo;

import lombok.*;

@ToString
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class KeywordVO {
    private int keywordId;
    private int directoryId;
    private String keyword;
}
