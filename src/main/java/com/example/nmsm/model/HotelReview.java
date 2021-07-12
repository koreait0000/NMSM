package com.example.nmsm.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class HotelReview {
    private int ireview;
    private int iuser;
    private int ihotel;
    private double review_star;
    private String review_cnt;
    private String review_img;
    private String review_regdt;

}
