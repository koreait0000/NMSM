package com.example.nmsm.dyn.dao;

import com.example.nmsm.sta.model.BookDogEntity;
import com.example.nmsm.sta.model.BookDogServiceEntity;
import com.example.nmsm.sta.model.BookInfoEntity;
import com.example.nmsm.sta.model.dto.BookInfoDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface BookInfoDAO {

    List<BookInfoEntity> selectBookInfoByUpk(int u_pk);

    void insBookHotel(BookInfoDTO bookInfoDTO);
    void insBookDog(BookDogEntity bookDogEntity);
    void insBookDogService(BookDogServiceEntity bookDogServiceEntity);

    void updBookHotel(BookInfoEntity bookInfoEntity);
    void updBookDog(BookDogEntity bookDogEntity);
    void updBookDogService(BookDogServiceEntity bookDogServiceEntity);

    void delBookHotel(int ibook);
    void delBookDog(BookDogEntity bookDogEntity);
    void delBookDogService(BookDogServiceEntity bookDogServiceEntity);


}
