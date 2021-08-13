package com.example.nmsm.dyn.controller;

import com.example.nmsm.dyn.service.HotelService;
import com.example.nmsm.sta.config.auth.PrincipalDetails;
import com.example.nmsm.sta.model.UserEntity;
import com.example.nmsm.dyn.service.BookInfoService;
import com.example.nmsm.dyn.service.DogInfoService;
import com.example.nmsm.dyn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/my")
public class MyController {

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    private UserService userService;
    @Autowired
    private DogInfoService dogInfoService;
    @Autowired
    private BookInfoService bookInfoService;
    @Autowired
    private HotelService hotelInfoService;

    @PostMapping("/regist")
    public String doRegist(UserEntity userEntity){
        System.out.println(userEntity);
        userService.doJoin(userEntity);
        return "nmsm";
    }

    // TODO : 모두 model에 할당해주기!
    @GetMapping("/mypet")
    public String goMyPet(Model model,
                          @AuthenticationPrincipal PrincipalDetails principalDetails){

        dogInfoService.getDogInfo(principalDetails);
        return "/my/mypet";
    }

    @GetMapping("/mybook")
    public String goMyBook(Model model,
                           @AuthenticationPrincipal PrincipalDetails principalDetails){

        bookInfoService.getBookInfo(principalDetails);
        return "/my/mybook";
    }

    @GetMapping("/mylike")
    public String goMyFav(Model model,
                           @AuthenticationPrincipal PrincipalDetails principalDetails){

//        hotelInfoService.getLikeHotel(principalDetails);
        return "/my/mylike";
    }

    @GetMapping("/myhotel")
    public String goMyHotel(Model model,
                           @AuthenticationPrincipal PrincipalDetails principalDetails){

        System.out.println("hello");
//        hotelInfoService.getMyHotel(principalDetails);
        return "/my/myhotel";
    }

    @GetMapping("/myhotelbook")
    public String goMyHotelBook(){

        return "/my/myhotelbook";
    }

    


}
