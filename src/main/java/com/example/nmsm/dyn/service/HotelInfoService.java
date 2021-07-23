package com.example.nmsm.dyn.service;

import com.example.nmsm.dyn.dao.HotelDAO;
import com.example.nmsm.sta.config.auth.PrincipalDetails;
import com.example.nmsm.sta.model.dto.HotelInfoDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HotelInfoService extends CommonService{

    @Autowired
    private HotelDAO hotelDAO;
    public List<HotelInfoDTO> getLikeHotel(PrincipalDetails principalDetails){
        return hotelDAO.selectLikeHotelInfoByIuser(getIuser(principalDetails));
    }
    public HotelInfoDTO getMyHotel(PrincipalDetails principalDetails){
        return hotelDAO.selectMyHotelInfoByIuser(getIuser(principalDetails));
    }
}
