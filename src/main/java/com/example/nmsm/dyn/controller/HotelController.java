package com.example.nmsm.dyn.controller;

import com.example.nmsm.dyn.service.HotelService;
import com.example.nmsm.sta.model.BookInfoEntity;
import com.example.nmsm.sta.model.dto.BookInfoDTO;
import com.example.nmsm.sta.model.dto.HotelReviewDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/hotel")
public class HotelController {

    @Autowired
    private HotelService hotelService;

    @GetMapping("/list")
    public String selHotelList(Model model, BookInfoDTO bookInfoDTO){
//        bookInfoDTO.setIuser(hotelInfoService.getIuser(principalDetails));
//        model.addAttribute("list", hotelInfoService.selHotelList(bookInfoDTO, principalDetails));
//        model.addAttribute("maxPageVal", hotelInfoService.selMaxPageVal(bookInfoDTO.getHLocation()));
        return "/hotel/list";
    }

    @PostMapping("/like")
    public String insLikeHotel(){
        return "";
    }

    @GetMapping("/info")
    public String selHotelInfo(Model model, BookInfoEntity bookInfoEntity){
//        System.out.println("ihotel : " + bookInfoEntity.getIhotel());
//        HotelInfoDTO data = hotelInfoService.selHotelInfo(bookInfoEntity);
//        model.addAttribute(data);
        return "/hotel/info";
    }

    @GetMapping("/review")
    public Map<String, Object> selHotelReview(BookInfoDTO bookInfoDTO){
        int ihotel = bookInfoDTO.getIhotel();
        Map<String, Object> result = new HashMap();
        result.put("list", hotelService.selHotelReview(bookInfoDTO));
        result.put("reviewNum", hotelService.selReviewNum(ihotel));
        result.put("maxPageVal", hotelService.selMaxPageVal(bookInfoDTO.getHLocation()));
        return result;
    }

    @PostMapping("/review")
    public String insHotelReview(HotelReviewDTO hotelReviewDTO){
        hotelService.insHotelReview(hotelReviewDTO);
        return "";
    }

    @GetMapping("/delReview")
    public String delHotelReview(HotelReviewDTO hotelReviewDTO) {
        hotelService.delHotelReview(hotelReviewDTO);
        return "";
    }


}
