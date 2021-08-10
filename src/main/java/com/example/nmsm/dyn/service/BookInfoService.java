package com.example.nmsm.dyn.service;

import com.example.nmsm.sta.config.auth.PrincipalDetails;
import com.example.nmsm.dyn.dao.BookInfoDAO;
import com.example.nmsm.sta.model.BookInfoEntity;
import com.example.nmsm.sta.model.dto.BookInfoDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookInfoService extends CommonService{
    @Autowired
    private BookInfoDAO bookInfoDAO;

    public List<BookInfoEntity> getBookInfo(PrincipalDetails principalDetails){
        return bookInfoDAO.selectBookInfoByUpk(getIuser(principalDetails));
    }

    public void insBookHotelInfo(){
        bookInfoDAO.insBookHotel(null);
        bookInfoDAO.insBookDog(null);
        bookInfoDAO.insBookDogService(null);
    }

}
