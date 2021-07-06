package com.example.nmsm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MyController {

    @GetMapping("/")
    public String goMain(){
        return "/main";
    }

    @GetMapping("/regist")
    public String goRegist(){

        return "/regist";
    }

    @PostMapping("/regist")
    public String doRegist(){
        // TODO : 여기서 USERENTITY를 받아와 회원가입을 합니다.


        return "";
    }

    @GetMapping("/login")
    public String goLogin(){

        return "";
    }

    @PostMapping("/login")
    public String doLogin(){
        // TODO : 여기서 ID,PW(USERENTITY)를 받아와 로그인을 합니다.
        return "";
    }




}
