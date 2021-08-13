package com.example.nmsm.dyn.controller;

import com.example.nmsm.dyn.service.HotelService;
import com.example.nmsm.dyn.service.UserService;
import com.example.nmsm.sta.config.auth.PrincipalDetails;
import com.example.nmsm.sta.model.BookInfoEntity;
import com.example.nmsm.sta.model.LikeListEntity;
import com.example.nmsm.sta.model.dto.BookInfoDTO;
import com.example.nmsm.sta.model.dto.HotelInfoDTO;
import com.example.nmsm.sta.model.dto.HotelReviewDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/hotel")
public class HotelController {

    @Autowired
    private HotelService hotelService;
    @Autowired
    private UserService userService;


    @PostMapping("/list")
    public String selHotelList(Model model, BookInfoDTO bookInfoDTO,
                               @AuthenticationPrincipal PrincipalDetails principalDetails) {
        System.out.println(bookInfoDTO.getHLocation());
        model.addAttribute("list", hotelService.selHotelList(bookInfoDTO));
        model.addAttribute("maxPageVal", hotelService.selMaxPageVal(bookInfoDTO.getHLocation(), bookInfoDTO.getRecordCnt()));
        return "/hotel/list";
    }

    @PostMapping("/like")
    public Map<String, Integer> insLikeHotel(@AuthenticationPrincipal PrincipalDetails principalDetails,
                                             LikeListEntity likeListEntity){
        Map<String, Integer> result = new HashMap();
        likeListEntity.setIuser(userService.getIuser(principalDetails));
        result.put("result", userService.insLike(likeListEntity));
        return result;
    }

    @GetMapping("/info")
    public String selHotelInfo(Model model, BookInfoEntity bookInfoEntity){
        System.out.println("ihotel : " + bookInfoEntity.getIhotel());
        HotelInfoDTO data = hotelService.selHotelInfo(bookInfoEntity);
        model.addAttribute("data", data);
        return "/hotel/info";
    }

    @ResponseBody
    @GetMapping("/review")
    public Map<String, Object> selHotelReview(@RequestBody BookInfoDTO bookInfoDTO,
                                              @AuthenticationPrincipal PrincipalDetails principalDetails){
        int ihotel = bookInfoDTO.getIhotel();
        bookInfoDTO.setIuser(hotelService.getIuser(principalDetails));

        Map<String, Object> result = new HashMap();
        result.put("list", hotelService.selHotelReview(bookInfoDTO));
        result.put("reviewNum", hotelService.selReviewNum(ihotel));
        result.put("maxPageVal", hotelService.selMaxPageVal(bookInfoDTO.getHLocation(), bookInfoDTO.getRecordCnt()));
        result.put("chkHotelUse", hotelService.chkHotelUse(bookInfoDTO));

        return result;
    }

    @ResponseBody
    @PostMapping("/review")
    public Map<String, Integer> insHotelReview(@RequestBody HotelReviewDTO hotelReviewDTO,
                                 @AuthenticationPrincipal PrincipalDetails principalDetails){
        hotelReviewDTO.setIuser(hotelService.getIuser(principalDetails));
        Map<String, Integer> result = new HashMap();
        result.put("result", hotelService.insHotelReview(hotelReviewDTO));
        return result;
    }

    @ResponseBody
    @DeleteMapping("/delReview")
    public Map<String, Integer> delHotelReview(@RequestBody HotelReviewDTO hotelReviewDTO,
                                 @AuthenticationPrincipal PrincipalDetails principalDetails) {
        hotelReviewDTO.setIuser(hotelService.getIuser(principalDetails));
        Map<String, Integer> result = new HashMap();
        result.put("result", hotelService.delHotelReview(hotelReviewDTO));
        return result;
    }

    @ResponseBody
    @PutMapping("/modReview")
    public Map<String, Integer> modHotelReview(@RequestBody HotelReviewDTO hotelReviewDTO,
                                 @AuthenticationPrincipal PrincipalDetails principalDetails) {
        hotelReviewDTO.setIuser(hotelService.getIuser(principalDetails));
        Map<String, Integer> data = new HashMap();
        data.put("data", hotelService.updHotelReview(hotelReviewDTO));
        return data;

    }


}
