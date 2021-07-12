package com.example.nmsm.service;

import com.example.nmsm.config.auth.PrincipalDetails;
import com.example.nmsm.dao.BookInfoDAO;
import com.example.nmsm.model.BookInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookInfoService extends CommonService{
    @Autowired
    private BookInfoDAO bookInfoDAO;

    public List<BookInfo> getBookInfo(PrincipalDetails principalDetails){
        return bookInfoDAO.selectBookInfoByUpk(getIuser(principalDetails));
    }
}
