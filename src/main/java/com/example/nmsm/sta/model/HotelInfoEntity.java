package com.example.nmsm.sta.model;

import lombok.Data;

@Data
public class HotelInfoEntity {
    private int ihotel;
    private int iuser;
    private int h_capacity;
    private String h_location;
    private String h_address;
    private int h_price;
    private double mapX;
    private double mapY;
    private String h_preDetail;
    private String h_detail;
    private String h_tel;
    private int h_service; //

}
