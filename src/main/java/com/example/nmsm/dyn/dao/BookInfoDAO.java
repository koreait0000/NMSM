package com.example.nmsm.dyn.dao;

import com.example.nmsm.sta.model.BookInfoEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface BookInfoDAO {

    List<BookInfoEntity> selectBookInfoByUpk(int u_pk);
    
}
