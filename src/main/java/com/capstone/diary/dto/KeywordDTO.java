package com.capstone.diary.dto;

import lombok.*;

@ToString
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class KeywordDTO {
    private int keywordId;
    private int directoryId;
    private String keyword;
}
