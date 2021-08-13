package com.example.nmsm.dyn.controller;

import com.example.nmsm.dyn.service.BookInfoService;
import com.example.nmsm.dyn.service.HotelService;

import com.example.nmsm.sta.config.auth.PrincipalDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hotel")
public class BookController {

    @Autowired
    private BookInfoService bookInfoService;
    @Autowired

    private HotelService hotelService;

    @GetMapping("/book")
    public String bookHotelInfo(Model model,
                                @AuthenticationPrincipal PrincipalDetails principalDetails) {

        return "/hotel/book";
    }

    @PostMapping("/book")
    public String insBookHotelInfo(@AuthenticationPrincipal PrincipalDetails principalDetails){

        bookInfoService.insBookHotelInfo();
        return "/my/mybook";
    }


}
