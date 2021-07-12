package com.example.nmsm.dyn.dao;

import com.example.nmsm.sta.model.UserEntity;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDAO {

    UserEntity selectByUnm(String u_nm);
    int insertUser(UserEntity userEntity);
}
