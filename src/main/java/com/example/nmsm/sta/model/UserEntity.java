package com.example.nmsm.sta.model;


import lombok.*;

@Data
@Builder
public class UserEntity {
    private int iuser;
    private String u_nm;
    private String u_email;
    private String u_pw;
    private String u_birth;
    private String u_tel;
    private String auth; // ADMIN USER OWNER


}
