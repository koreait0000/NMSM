package com.example.nmsm.sta.model.dto;

import com.example.nmsm.sta.model.HotelReviewEntity;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class HotelReviewDTO extends HotelReviewEntity {
    List<String> h_r_img;
}
