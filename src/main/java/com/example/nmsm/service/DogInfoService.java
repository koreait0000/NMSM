package com.example.nmsm.service;

import com.example.nmsm.config.auth.PrincipalDetails;
import com.example.nmsm.dao.DogInfoDAO;
import com.example.nmsm.model.DogInfoEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DogInfoService extends CommonService{

    @Autowired
    private DogInfoDAO dogInfoDAO;

    public List<DogInfoEntity> getDogInfo(PrincipalDetails principalDetails){

        return dogInfoDAO.selectDogInfoByUpk(getIuser(principalDetails));
    }
}
