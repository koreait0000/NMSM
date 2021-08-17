package com.example.nmsm.dyn.service;

import com.example.nmsm.dyn.dao.HotelDAO;

import com.example.nmsm.dyn.dao.UserDAO;
import com.example.nmsm.sta.config.auth.PrincipalDetails;
import com.example.nmsm.sta.model.*;
import com.example.nmsm.sta.model.dto.BookInfoDTO;
import com.example.nmsm.sta.model.dto.HotelInfoDTO;
import com.example.nmsm.sta.model.dto.HotelReviewDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.nmsm.sta.config.auth.PrincipalDetails;
import com.example.nmsm.sta.model.BookInfoEntity;
import com.example.nmsm.sta.model.dto.BookInfoDTO;
import com.example.nmsm.sta.model.dto.HotelInfoDTO;
import com.example.nmsm.sta.model.dto.HotelReviewDTO;
import com.example.nmsm.sta.model.dto.HotelServiceDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class HotelService extends CommonService{

    @Autowired
    private HotelDAO hotelDAO;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private LocationService locationService;


    public List<HotelInfoDTO> getLikeHotel(PrincipalDetails principalDetails){
        List<HotelInfoDTO> list = hotelDAO.selectLikeHotelInfoByIuser(getIuser(principalDetails));
        return list;
    }
      
    public void registHotel(HotelInfoEntity hotelInfoEntity, PrincipalDetails principalDetails){
        int ihotel = hotelDAO.selectHPkByIuser(getIuser(principalDetails));
        hotelInfoEntity.setIuser(getIuser(principalDetails));
        System.out.println(ihotel);
        if (ihotel == 0){
            locationService.zipToLoc(hotelInfoEntity); // h_location 수정
            hotelDAO.insertHotel(hotelInfoEntity);
        }else {
            hotelDAO.updateHotelInfo(hotelInfoEntity);
        }
    }
    public HotelInfoDTO getMyHotel(PrincipalDetails principalDetails){
        return hotelDAO.selectMyHotelInfoByIuser(getIuser(principalDetails));
    }

    public List<HotelInfoDTO> selHotelList(BookInfoDTO bookInfoDTO) {
        int startIdx = (bookInfoDTO.getPage() - 1) * bookInfoDTO.getRecordCnt();
        bookInfoDTO.setStartIdx(startIdx);
        List<HotelInfoDTO> result = hotelDAO.selHotelList(bookInfoDTO);
        for (HotelInfoDTO hotelInfoDTO : result){
            System.out.println(hotelInfoDTO);
            System.out.println(hotelInfoDTO.getH_name());
            System.out.println(hotelInfoDTO.getH_preDetail());
            System.out.println(hotelInfoDTO.getH_star());
        }
        return result;
    }

    public HotelInfoDTO selHotelInfo(BookInfoEntity bookInfoEntity){

        return hotelDAO.selHotelInfo(bookInfoEntity);
    }

    public List<HotelReviewDTO> selHotelReview(BookInfoEntity bookInfoEntity){
        List<HotelReviewDTO> data = hotelDAO.selHotelReview(bookInfoEntity);
        return data;
    }


    public int chkHotelUse(BookInfoDTO bookInfoDTO, PrincipalDetails principalDetails) {
        if(principalDetails == null){
            return 0;
        }
        return userDAO.chkHotelUse(bookInfoDTO);
    }

    public int insHotelReview(HotelReviewDTO hotelReviewDTO) {
        int hr = hotelDAO.insHotelReview(hotelReviewDTO);
        int hs = hotelDAO.insAvgStar(hotelReviewDTO.getIhotel());
        int result = hr + hs;
        return result; //result 값이 0보다 크면 insert 성공

    }


    public int selMaxPageVal(String hLocation, int recordCnt) {
        int result = hotelDAO.selMaxPageVal(hLocation, recordCnt);
        System.out.println("selMaxPageVal : "+result);
        return result;
    }

    public int selReviewNum(int ihotel) {
        return hotelDAO.selReviewNum(ihotel);
    }

    public int updHotelReview(HotelReviewDTO hotelReviewDTO) {
        return hotelDAO.updHotelReview(hotelReviewDTO);
    }

    public int delHotelReview(HotelReviewDTO hotelReviewDTO){
        return hotelDAO.delHotelReview(hotelReviewDTO);
    }


    public List<ServiceEntity> getAllService(){
        return serviceDAO.selectAllInfo();
    }

    public void regisHotelImg(PrincipalDetails principalDetails,
                              MultipartFile[] files){
        if(files == null)return;
        // 또는 iuser로 하여금 호텔 pk를 받아와서 처리하도록?
        int iuser = getIuser(principalDetails);
        String baseDir = makeDir("/hotel/"+iuser);
        for(int i=0; i<files.length; i++){
            String fileName = iuser+"-"+(i+1)+".jpg";
            saveFile(baseDir,fileName,files[i]);
        }
    }

    public void registHotelService(PrincipalDetails principalDetails,
                                   int[] iservice,
                                   int[] s_price){
        List<HotelServiceEntity> list = new ArrayList();
        int ihotel = getIhotel(getIuser(principalDetails));
        for(int i=0; i<iservice.length; i++){
            HotelServiceEntity hotelServiceEntity = new HotelServiceEntity();
            hotelServiceEntity.setIhotel(ihotel);
            hotelServiceEntity.setIservice(iservice[i]);
            hotelServiceEntity.setS_price(s_price[iservice[i]-1]);
            System.out.println(hotelServiceEntity);
            list.add(hotelServiceEntity);
        }
        hotelDAO.deleteService(ihotel);
        hotelDAO.insertService(list);
    }

    public int getIhotel(int iuser){
        return hotelDAO.selectHPkByIuser(iuser);
    }

}
