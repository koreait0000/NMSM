package com.example.nmsm.dyn.dao;

import com.example.nmsm.sta.model.dto.HotelInfoDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HotelDAO {

    List<HotelInfoDTO> selectLikeHotelInfoByIuser(int iuser);
    HotelInfoDTO selectMyHotelInfoByIuser(int iuser);
}
