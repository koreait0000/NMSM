package com.example.nmsm.sta.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class DogInfoEntity {
    private int idog;
    private int iuser; //
    private int breed_pk; //
    private int d_birth; //
    private String d_nm; //
    private boolean d_gender; //
    private double d_weight;
    private int d_regNum;//
    private boolean d_neuter; // 중성화 여부

}
