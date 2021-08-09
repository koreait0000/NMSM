package com.example.nmsm.sta.model.dto;

import com.example.nmsm.sta.model.BookInfoEntity;
import lombok.Data;

@Data
public class BookInfoDTO extends BookInfoEntity {
    private int book_price;
    private int page;
    private int startIdx;
    private int recordCnt;
    private String hLocation;
    private int bookDogNum;
    private int perStar;
}
