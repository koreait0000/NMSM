package com.example.nmsm.sta.model.dto;

import com.example.nmsm.sta.model.HotelInfoEntity;
import lombok.Data;

import java.util.List;

@Data
public class HotelInfoDTO extends HotelInfoEntity {
    private List<String> imgList;
    private List<HotelServiceDTO> serviceList;
    private int reviewNum;
    private int like;
}

