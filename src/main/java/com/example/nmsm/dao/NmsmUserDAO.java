package com.example.nmsm.dao;

import com.example.nmsm.model.NmsmUserEntity;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NmsmUserDAO {

    NmsmUserEntity selectByUnm(String u_nm);
    int insertUser(NmsmUserEntity userEntity);
}
