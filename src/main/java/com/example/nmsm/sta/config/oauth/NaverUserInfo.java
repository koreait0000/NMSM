package com.example.nmsm.sta.config.oauth;

import java.util.Map;

public class NaverUserInfo extends OAuth2UserInfo{

    public NaverUserInfo(Map<String,Object> attributes){
        this.attributes = attributes;
    }
    @Override
    public String getProvider() {
        return "naver";
    }
    @Override
    public String getProviderId() {
        return attGet("id");
    }
    @Override
    public String getEmail() {
        return attGet("email");
    }
    @Override
    public String getName() {
        return attGet("name");
    }
}
