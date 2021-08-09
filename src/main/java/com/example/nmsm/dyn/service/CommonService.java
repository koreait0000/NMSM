package com.example.nmsm.dyn.service;


import com.example.nmsm.sta.config.auth.PrincipalDetails;
import org.springframework.stereotype.Service;

@Service
public class CommonService {

    public int getIuser(PrincipalDetails principalDetails){
        return principalDetails.getUserEntity().getIuser();
    }


}
