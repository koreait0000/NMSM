package com.example.nmsm.dyn.service;


import com.example.nmsm.dyn.dao.ServiceDAO;
import com.example.nmsm.sta.config.auth.PrincipalDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommonService {
    @Autowired
    protected ServiceDAO serviceDAO;

    public int getIuser(PrincipalDetails principalDetails){
        int num = principalDetails.getUserEntity().getIuser();
        System.out.println("내 정보는 : "+num);
        return num;
    }


}
