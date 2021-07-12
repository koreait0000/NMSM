package com.example.nmsm.dao;

import com.example.nmsm.model.BookInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface BookInfoDAO {

    List<BookInfo> selectBookInfoByUpk(int u_pk);
}
