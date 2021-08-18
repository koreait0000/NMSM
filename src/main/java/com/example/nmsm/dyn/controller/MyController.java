package com.example.nmsm.dyn.controller;

import com.example.nmsm.dyn.service.*;
import com.example.nmsm.sta.config.auth.PrincipalDetails;
import com.example.nmsm.sta.model.DogInfoEntity;
import com.example.nmsm.sta.model.HotelInfoEntity;
import com.example.nmsm.sta.model.HotelServiceEntity;
import com.example.nmsm.sta.model.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

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
    private HotelService hotelService;
    @Autowired
    private LocationService locationService;

    @PostMapping("/regist")// check
    public String doRegist(UserEntity userEntity){
        System.out.println(userEntity);
        userService.doJoin(userEntity);
        return "nmsm";
    }

    @GetMapping("/mypet") // front
    public String goMyPet(Model model,
                          @AuthenticationPrincipal PrincipalDetails principalDetails){

        model.addAttribute("pets",dogInfoService.getDogInfo(principalDetails));
        model.addAttribute("breeds",dogInfoService.getDogBreed());
        return "/my/mypet";
    }

    @PostMapping("/mypet")
    public String registMyPet(Model model,
                              DogInfoEntity dogInfoEntity,
                              MultipartFile file,
                              @AuthenticationPrincipal PrincipalDetails principalDetails){
//        System.out.println(dogInfoEntity);
        dogInfoService.registMyDog(dogInfoEntity,file,principalDetails);
        return "redirect:mypet";
    }

    @GetMapping("/mybook") // front
    public String goMyBook(Model model,
                           @AuthenticationPrincipal PrincipalDetails principalDetails){

        bookInfoService.getBookInfo(principalDetails);
        return "/my/mybook";
    }

    @GetMapping("/mylike")
    public String goMyFav(Model model,
                           @AuthenticationPrincipal PrincipalDetails principalDetails){

        model.addAttribute("list", hotelService.getLikeHotel(principalDetails));
        return "/my/mylike";
    }

    @GetMapping("/myhotel")
    public String goMyHotel(Model model,
                           @AuthenticationPrincipal PrincipalDetails principalDetails){

        model.addAttribute("services", hotelService.getAllService());
        model.addAttribute("hotel", hotelService.getMyHotel(principalDetails));
        return "/my/myhotel";
    }
    @PostMapping("/myhotel")
    public String registHotel(HotelInfoEntity hotelInfoEntity,
                              String h_address_1,
                              String h_address_2,
                              int[] iservice,
                              int[] s_price,
                              @RequestParam MultipartFile[] files,
                              @AuthenticationPrincipal PrincipalDetails principalDetails){
        hotelInfoEntity.setH_address(h_address_1+h_address_2); // h_address 수정
        hotelService.registHotel(hotelInfoEntity,principalDetails); // hotel 등록
        hotelService.regisHotelImg(principalDetails,files); // hotel image 등록
        hotelService.registHotelService(principalDetails,iservice,s_price);
        return "redirect:/my/myhotel";
    }

    @GetMapping("/myhotelbook")
    public String goMyHotelBook(Model model,
                                @AuthenticationPrincipal PrincipalDetails principalDetails){

        model.addAttribute("u_nm",userService.getUnmAuth(principalDetails));
        return "/my/myhotelbook";
    }

    


}
