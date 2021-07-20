package com.example.nmsm.dyn.dao;

import com.example.nmsm.sta.model.BookInfoEntity;
import com.example.nmsm.sta.model.HotelInfoEntity;
import com.example.nmsm.sta.model.HotelReviewEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HotelDAO {
    List<HotelInfoEntity> getHotelList(BookInfoEntity bookInfoEntity);
    HotelInfoEntity getHotelInfo(BookInfoEntity bookinfo);
    List<HotelReviewEntity> getHotelReview(int ihotel);

    void insHotelReview(HotelReviewEntity hotelReviewEntity);
    void insHotelReviewImg(String reviewImg);

    void updHotelReview(HotelReviewEntity hotelReviewEntity);

    void delHotelReview(int ireview);


    int selMaxPageVal(BookInfoEntity bookinfo);
}
