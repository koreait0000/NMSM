package com.example.nmsm.dyn.service;

import com.example.nmsm.dyn.dao.HotelDAO;
import com.example.nmsm.sta.config.auth.PrincipalDetails;
import com.example.nmsm.sta.model.BookInfoEntity;
import com.example.nmsm.sta.model.HotelInfoEntity;
import com.example.nmsm.sta.model.ServiceEntity;
import com.example.nmsm.sta.model.dto.BookInfoDTO;
import com.example.nmsm.sta.model.dto.HotelInfoDTO;
import com.example.nmsm.sta.model.dto.HotelReviewDTO;
import com.example.nmsm.sta.model.dto.HotelServiceDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class HotelInfoService extends CommonService{

    @Autowired
    private HotelDAO hotelDAO;
    public List<HotelInfoDTO> getLikeHotel(PrincipalDetails principalDetails){
        List<HotelInfoDTO> list = hotelDAO.selectLikeHotelInfoByIuser(getIuser(principalDetails));
        System.out.println("all: "+list.get(0).toString());
        for(HotelServiceDTO a:list.get(0).getServiceList()){
            System.out.println("service : "+a.getS_nm());
        }
        return list;
    }
    public void registHotel(HotelInfoEntity hotelInfoEntity, PrincipalDetails principalDetails){
        // TODO : 호텔이 있냐 없냐에 따라 insert or update
        hotelInfoEntity.setIuser(getIuser(principalDetails));
        hotelDAO.insertHotel(hotelInfoEntity);

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

    public List<ServiceEntity> getAllService(){
        return serviceDAO.selectAllInfo();
    }

    public void regisHotelImg(PrincipalDetails principalDetails,
                              MultipartFile[] files){
        if(files == null)return;
        int iuser = getIuser(principalDetails);
        String baseDir = "D:/nmsm/"+iuser;
        System.out.printf(baseDir);
        File folder = new File(baseDir);
        folder.mkdir();
        for(int i=0; i<files.length; i++){
            String fileName = iuser+"-"+(i+1)+".jpg";
            File saveFile = new File(baseDir,fileName);
            try {
                files[i].transferTo(saveFile);
                System.out.printf("파일 성공!");
            } catch (IOException e) {
                System.out.printf("파일 실패!");
            }
        }
    }


}
