package com.example.nmsm.dyn.service;


import com.example.nmsm.sta.config.auth.PrincipalDetails;


public class CommonService {

    public int getIuser(PrincipalDetails principalDetails){
        return principalDetails.getUserEntity().getIuser();
    }


}
