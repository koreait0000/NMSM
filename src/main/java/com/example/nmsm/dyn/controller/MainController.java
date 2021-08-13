package com.example.nmsm.dyn.controller;

import com.example.nmsm.dyn.service.UserService;
import com.example.nmsm.sta.model.BookInfoEntity;
import com.example.nmsm.sta.model.UserEntity;
import com.example.nmsm.sta.model.dto.BookInfoDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MainController {

    @Autowired
    UserService userService;

    @GetMapping("/")
    public String goMain(){
        return "nmsm";
    }

    @PostMapping("/join")
    public String doJoin(UserEntity userEntity){
        userService.doJoin(userEntity);
        return "redirect:/";
    }
}
