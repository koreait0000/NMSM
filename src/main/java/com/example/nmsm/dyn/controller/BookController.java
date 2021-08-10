package com.example.nmsm.dyn.controller;

import com.example.nmsm.dyn.service.BookInfoService;
import com.example.nmsm.dyn.service.HotelInfoService;
import org.springframework.beans.factory.annotation.Autowired;
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
    private HotelInfoService hotelInfoService;

    @GetMapping("/book")
    public String bookHotelInfo(Model model) {
        return "/hotel/book";
    }

    @PostMapping("/book")
    public String insBookHotelInfo(){
        bookInfoService.insBookHotelInfo();
        return "/my/mybook";
    }


}
