package com.example.nmsm.dyn.service;

import com.example.nmsm.dyn.dao.HotelDAO;
import com.example.nmsm.sta.config.auth.PrincipalDetails;
import com.example.nmsm.sta.model.BookInfoEntity;
import com.example.nmsm.sta.model.dto.BookInfoDTO;
import com.example.nmsm.sta.model.dto.HotelInfoDTO;
import com.example.nmsm.sta.model.dto.HotelReviewDTO;
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

    public List<HotelInfoDTO> selHotelList(BookInfoDTO bookInfoDTO, PrincipalDetails principalDetails) {
        bookInfoDTO.setIuser(getIuser(principalDetails));
        int startIdx = (bookInfoDTO.getPage() - 1) * bookInfoDTO.getRecordCnt();
        bookInfoDTO.setStartIdx(startIdx);
        List<HotelInfoDTO> result = hotelDAO.selHotelList(bookInfoDTO);

        return result;
    }

    public HotelInfoDTO selHotelInfo(BookInfoEntity bookInfoEntity){
        return hotelDAO.selHotelInfo(bookInfoEntity);
    }

    public List<HotelReviewDTO> selHotelReview(BookInfoEntity bookInfoEntity){
        List<HotelReviewDTO> data = hotelDAO.selHotelReview(bookInfoEntity);
        return data;
    }

    public void insHotelReview(HotelReviewDTO hotelReviewDTO) {
        hotelDAO.insHotelReview(hotelReviewDTO);
        hotelDAO.insHotelReviewImg(hotelReviewDTO);
    }


    public int selMaxPageVal(String hLocation) {
        return hotelDAO.selMaxPageVal(hLocation);
    }

    public int selReviewNum(int ihotel) {
        return hotelDAO.selReviewNum(ihotel);
    }

    public int updHotelReview(HotelReviewDTO hotelReviewDTO) {
        int img = hotelDAO.updHotelReviewImg(hotelReviewDTO);
        int cnt = hotelDAO.updHotelReview(hotelReviewDTO);
        return cnt;
    }

    public int delHotelReview(HotelReviewDTO hotelReviewDTO){
        //TODO: 등록된 review에 사진이 있으면 사진 먼저 삭제
        hotelDAO.delHotelReviewImg(hotelReviewDTO);
        return hotelDAO.delHotelReview(hotelReviewDTO);
    }


}
