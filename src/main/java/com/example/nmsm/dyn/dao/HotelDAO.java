package com.example.nmsm.dyn.dao;


import com.example.nmsm.sta.model.HotelInfoEntity;
import com.example.nmsm.sta.model.HotelServiceEntity;
import com.example.nmsm.sta.model.dto.HotelInfoDTO;
import com.example.nmsm.sta.model.BookInfoEntity;
import com.example.nmsm.sta.model.dto.HotelReviewDTO;

import com.example.nmsm.sta.model.dto.HotelServiceDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HotelDAO {

    List<HotelInfoDTO> selHotelList(BookInfoEntity bookInfoEntity);
    HotelInfoDTO selHotelInfo(BookInfoEntity bookInfoEntity);
    List<HotelReviewDTO> selHotelReview(BookInfoEntity bookInfoEntity);
    List<HotelInfoDTO> selectLikeHotelInfoByIuser(int iuser);
    HotelInfoDTO    selectMyHotelInfoByIuser(int iuser);
    int selectHPkByIuser(int iuser);

    int insHotelReview(HotelReviewDTO hotelReviewDTO);
    int insAvgStar(int ihotel);

    int insertHotel(HotelInfoEntity hotelInfoEntity);
    int insertService(List<HotelServiceEntity> hotelServiceDTOS);

    int updHotelReview(HotelReviewDTO hotelReviewDTO);
    int updHotelReviewImg(HotelReviewDTO hotelReviewDTO);
    int updateHotelInfo(HotelInfoEntity hotelInfoEntity);

    int delHotelReview(HotelReviewDTO hotelReviewDTO);
    int delHotelReviewImg(HotelReviewDTO hotelReviewDTO);
    int deleteService(int ihotel);


    int selReviewNum(int ihotel);
    int selMaxPageVal(String hLocation, int recordCnt);
}
