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


    @GetMapping("/list")
    public String selHotelList(Model model, BookInfoDTO bookInfoDTO) {
        System.out.println(bookInfoDTO.getHLocation());
        System.out.println(bookInfoDTO.getCheckIn());
        System.out.println(bookInfoDTO.getCheckOut());
        System.out.println(bookInfoDTO.getBookDogNum());
        model.addAttribute("list", hotelService.selHotelList(bookInfoDTO));
        model.addAttribute("maxPageVal", hotelService.selMaxPageVal(bookInfoDTO.getHLocation(), bookInfoDTO.getRecordCnt()));
        return "/hotel/list";
    }

    @PostMapping("/like")
    public Map<String, Integer> insLikeHotel(@RequestBody LikeListEntity likeListEntity,
                                             @AuthenticationPrincipal PrincipalDetails principalDetails){
        likeListEntity.setIuser(userService.getIuser(principalDetails));
        Map<String, Integer> result = new HashMap();
        result.put("result", userService.insLikeHotel(likeListEntity));
        return result;
    }

    @DeleteMapping("/delLike")
    public Map<String, Integer> delLikeHotel(LikeListEntity likeListEntity,
                                             @AuthenticationPrincipal PrincipalDetails principalDetails) {
        likeListEntity.setIuser(hotelService.getIuser(principalDetails));
        Map<String, Integer> result = new HashMap();
        result.put("result", userService.delLikeHotel(likeListEntity));
        return result;
    }

    @GetMapping("/like")
    public Map<String, Integer> selLike(LikeListEntity likeListEntity,
                                        @AuthenticationPrincipal PrincipalDetails principalDetails) {
        likeListEntity.setIuser(hotelService.getIuser(principalDetails));
        Map<String, Integer> result = new HashMap();
        result.put("result", userService.selLike(likeListEntity));
        return result;
    }

    @GetMapping("/info")
    public String selHotelInfo(Model model, BookInfoEntity bookInfoEntity,
                               @AuthenticationPrincipal PrincipalDetails principalDetails){
        System.out.println("ihotel : " + bookInfoEntity.getIhotel());
        HotelInfoDTO data = hotelService.selHotelInfo(bookInfoEntity);

        model.addAttribute("data", data);
        if(principalDetails != null) {
            model.addAttribute("loginUser", hotelService.getIuser(principalDetails));
        }
        return "/hotel/info";
    }

    @ResponseBody
    @GetMapping("/review/{ihotel}")
    public Map<String, Object> selHotelReview(@RequestBody BookInfoDTO bookInfoDTO,
                                              @AuthenticationPrincipal PrincipalDetails principalDetails){
        int ihotel = bookInfoDTO.getIhotel();
        bookInfoDTO.setIuser(hotelService.getIuser(principalDetails));

        Map<String, Object> result = new HashMap();
        result.put("list", hotelService.selHotelReview(bookInfoDTO));
        result.put("reviewNum", hotelService.selReviewNum(ihotel));
        result.put("maxPageVal", hotelService.selMaxPageVal(bookInfoDTO.getHLocation(), bookInfoDTO.getRecordCnt()));
        result.put("chkHotelUse", hotelService.chkHotelUse(bookInfoDTO, principalDetails));
        System.out.println("chk" + hotelService.chkHotelUse(bookInfoDTO, principalDetails));
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
