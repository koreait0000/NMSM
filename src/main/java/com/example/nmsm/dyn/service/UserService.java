package com.example.nmsm.dyn.service;

import com.example.nmsm.dyn.dao.UserDAO;
import com.example.nmsm.sta.model.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService extends CommonService{

    @Autowired
    private UserDAO userDAO;

    public int doJoin(UserEntity userEntity){

        return userDAO.insertUser(userEntity);
    }
}
