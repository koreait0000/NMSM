package com.example.nmsm.dyn.dao;

import com.example.nmsm.sta.model.BookInfoEntity;
import com.example.nmsm.sta.model.LikeListEntity;
import com.example.nmsm.sta.model.UserEntity;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDAO {

    UserEntity selectByUnm(String u_nm);
    UserEntity selectByEmail(String u_email);
    int insertUser(UserEntity userEntity);
    int insLike(LikeListEntity likeListEntity);
    int chkHotelUse(BookInfoEntity bookInfoEntity);
}
