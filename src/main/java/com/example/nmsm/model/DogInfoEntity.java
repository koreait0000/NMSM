package com.example.nmsm.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class DogInfoEntity {
    private int idog;
    private int iuser;
    private int d_type;
    private int d_breed;
    private int d_age;
    private String d_nm;
    private double d_weight;
    private boolean d_gender;
    private int d_regNum;
    private boolean d_neuter;

}
