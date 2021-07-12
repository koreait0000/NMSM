package com.example.nmsm.sta.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class BookInfoEntity {
    private int ibook;
    private String checkIn;
    private String checkOut;
    private int ihotel;
    private int iuser;
    private int service;

}
