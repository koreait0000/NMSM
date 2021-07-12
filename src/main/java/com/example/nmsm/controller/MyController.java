package com.example.nmsm.controller;

import com.example.nmsm.config.auth.PrincipalDetails;
import com.example.nmsm.model.DogInfoEntity;
import com.example.nmsm.model.NmsmUserEntity;
import com.example.nmsm.service.BookInfoService;
import com.example.nmsm.service.DogInfoService;
import com.example.nmsm.service.UserService;
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

    @GetMapping("/")
    public String goMain(){
        return "/main";
    }

    @GetMapping("/regist")
    public String goRegist(){



        return "/regist";
    }

    @PostMapping("/regist")
    public String doRegist(NmsmUserEntity userEntity){
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

    @GetMapping("/my/myfav")
    public String goMyFav(Model model,
                           @AuthenticationPrincipal PrincipalDetails principalDetails){

        bookInfoService.getBookInfo(principalDetails);
        return "/my/mybook";
    }

    @GetMapping("/my/myhotel")
    public String goMyHotel(Model model,
                           @AuthenticationPrincipal PrincipalDetails principalDetails){

        bookInfoService.getBookInfo(principalDetails);
        return "/my/mybook";
    }

}
