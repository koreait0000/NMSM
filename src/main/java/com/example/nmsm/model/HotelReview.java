package com.example.nmsm.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HotelReview {
    private int ireview;
    private int iuser;
    private int ihotel;
    private double review_star;
    private String review_cnt;
    private String review_img;
    private String review_regdt;

}
