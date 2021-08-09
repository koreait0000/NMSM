package com.example.nmsm.dyn.controller;

import com.example.nmsm.dyn.service.BookInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hotel")
public class BookController {

    @Autowired
    private BookInfoService bookInfoService;

    @PostMapping("/book")
    public String insBookHotelInfo(){
        bookInfoService.insBookHotelInfo();
        return "/my/mybook";
    }
}
