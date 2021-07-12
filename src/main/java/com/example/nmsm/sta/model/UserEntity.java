package com.example.nmsm.sta.model;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
public class UserEntity {
    private int iuser;
    private String u_nm;
    private String u_email;
    private String u_pw;
    private String u_birth;
    private String u_tel;
    private String auth; // ADMIN USER OWNER
}
