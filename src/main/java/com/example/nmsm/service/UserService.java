package com.example.nmsm.service;

import com.example.nmsm.dao.NmsmUserDAO;
import com.example.nmsm.model.NmsmUserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService extends CommonService{

    @Autowired
    private NmsmUserDAO nmsmUserDAO;

    public int doJoin(NmsmUserEntity userEntity){

        return nmsmUserDAO.insertUser(userEntity);
    }
}
