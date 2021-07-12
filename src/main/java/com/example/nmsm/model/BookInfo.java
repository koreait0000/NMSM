package com.example.nmsm.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class BookInfo {
    private int ibook;
    private String checkIn;
    private String checkOut;
    private int ihotel;
    private int iuser;
    private int idog;
    private int service;

}
