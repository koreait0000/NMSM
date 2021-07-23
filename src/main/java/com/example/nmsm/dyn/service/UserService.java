package com.example.nmsm.dyn.service;

import com.example.nmsm.dyn.dao.UserDAO;
import com.example.nmsm.sta.model.LikeListEntity;
import com.example.nmsm.sta.model.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService extends CommonService{

    @Autowired
    private UserDAO userDAO;

    private String hashPw(String pw){
        return new BCryptPasswordEncoder().encode(pw);
    }

    public int doJoin(UserEntity userEntity){

        userEntity.setAuth("USER");
        userEntity.setU_pw(hashPw(userEntity.getU_pw()));
        return userDAO.insertUser(userEntity);
    }

    public void insLike(LikeListEntity likeListEntity) {
        userDAO.insLike(likeListEntity);
    }
}
