package com.example.nmsm.dyn.service;

import com.example.nmsm.dyn.dao.LocationDAO;
import com.example.nmsm.sta.model.HotelInfoEntity;
import com.example.nmsm.sta.model.LocInfoEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class LocationService extends CommonService{

    @Autowired
    LocationDAO locationDAO;

    List<List<Integer>> locs = new ArrayList<>();

    public LocationService(){
        locs.add(getArray(1,9));     //서울
        locs.add(getArray(10,20));   //경기
        locs.add(getArray(21,23));   //인천
        locs.add(getArray(24,26));   //강원
        locs.add(getArray(27,29));   //충북
        locs.add(getArray(30,30));   //세종
        locs.add(getArray(31,33));   //충남
        locs.add(getArray(34,35));   //대전
        locs.add(getArray(36,40));   //경북
        locs.add(getArray(41,43));   //대구
        locs.add(getArray(44,45));   //울산
        locs.add(getArray(46,49));   //부산
        locs.add(getArray(50,53));   //경남
        locs.add(getArray(54,56));   //전북
        locs.add(getArray(57,60));   //전남
        locs.add(getArray(61,62));   //광주
        locs.add(getArray(63,63));   //제주
    }


    private List<Integer> getArray(int start, int end){
        List<Integer> list = new ArrayList<>();

        for (int i=start;i<=end;i++){
            list.add(i);
        }
        return list;
    }

    public void zipToLoc(HotelInfoEntity hotelInfoEntity){
        int location = Integer.parseInt(hotelInfoEntity.getH_location().substring(0,2));
        for (int i=0; i<locs.size(); i++){
            if (locs.get(i).contains(location)){
                String h_loc = (i+1)+"";
                hotelInfoEntity.setH_location(h_loc);
            }
        }
    }

    public List<LocInfoEntity> getLocInfo(){
        return locationDAO.selectAllInfo();
    }
}
