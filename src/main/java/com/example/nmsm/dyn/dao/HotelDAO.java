package com.example.nmsm.dyn.dao;


import com.example.nmsm.sta.model.dto.HotelInfoDTO;
import com.example.nmsm.sta.model.BookInfoEntity;
import com.example.nmsm.sta.model.HotelReviewEntity;
import com.example.nmsm.sta.model.ReviewImgEntity;
import com.example.nmsm.sta.model.dto.HotelInfoDTO;
import com.example.nmsm.sta.model.dto.HotelReviewDTO;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HotelDAO {

    List<HotelInfoDTO> selHotelList(BookInfoEntity bookInfoEntity);
    HotelInfoDTO selHotelInfo(BookInfoEntity bookInfoEntity);
    List<HotelReviewDTO> selHotelReview(BookInfoEntity bookInfoEntity);
    List<HotelInfoDTO> selectLikeHotelInfoByIuser(int iuser);
    HotelInfoDTO selectMyHotelInfoByIuser(int iuser);

    void insHotelReview(HotelReviewDTO hotelReviewDTO);
    void insHotelReviewImg(HotelReviewDTO hotelReviewDTO);
    void insAvgStar(HotelReviewDTO hotelReviewDTO);

    int updHotelReview(HotelReviewDTO hotelReviewDTO);
    int updHotelReviewImg(HotelReviewDTO hotelReviewDTO);

    int delHotelReview(HotelReviewDTO hotelReviewDTO);
    int delHotelReviewImg(HotelReviewDTO hotelReviewDTO);

    int selReviewNum(int ihotel);
    int selMaxPageVal(String hLocation);
}
