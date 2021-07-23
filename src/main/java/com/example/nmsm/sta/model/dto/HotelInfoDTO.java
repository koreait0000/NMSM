package com.example.nmsm.sta.model.dto;

import com.example.nmsm.sta.model.HotelInfoEntity;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class HotelInfoDTO extends HotelInfoEntity {
    private List<String> imgList;
}
