package com.example.nmsm.service;


import com.example.nmsm.config.auth.PrincipalDetails;

public class CommonService {

    public int getIuser(PrincipalDetails principalDetails){
        return principalDetails.getUserEntity().getIuser();
    }
}
