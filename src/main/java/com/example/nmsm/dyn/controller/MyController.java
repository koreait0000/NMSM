package com.example.nmsm.dyn.controller;

import com.example.nmsm.dyn.service.HotelInfoService;
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
@RequestMapping("/")
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
    private HotelInfoService hotelInfoService;

    @GetMapping("/")
    public String goMain(){
        return "/main";
    }

    @GetMapping("/regist")
    public String goRegist(){



        return "/regist";
    }

    @PostMapping("/regist")
    public String doRegist(UserEntity userEntity){
        System.out.println(userEntity);
        userEntity.setAuth("USER");
        userEntity.setU_pw(bCryptPasswordEncoder.encode(userEntity.getU_pw()));
        userService.doJoin(userEntity);
        return "";
    }

    @GetMapping("/login")
    public String goLogin(){

        return "";
    }

    // TODO : 모두 model에 할당해주기!
    @GetMapping("/my/mypet")
    public String goMyPet(Model model,
                          @AuthenticationPrincipal PrincipalDetails principalDetails){

        dogInfoService.getDogInfo(principalDetails);
        return "/my/mypet";
    }

    @GetMapping("/my/mybook")
    public String goMyBook(Model model,
                           @AuthenticationPrincipal PrincipalDetails principalDetails){

        bookInfoService.getBookInfo(principalDetails);
        return "/my/mybook";
    }

    @GetMapping("/my/mylike")
    public String goMyFav(Model model,
                           @AuthenticationPrincipal PrincipalDetails principalDetails){

        hotelInfoService.getLikeHotel(principalDetails);
        return "/my/mylike";
    }

    @GetMapping("/my/myhotel")
    public String goMyHotel(Model model,
                           @AuthenticationPrincipal PrincipalDetails principalDetails){


        hotelInfoService.getMyHotel(principalDetails);
        return "/my/mybook";
    }

    


}
