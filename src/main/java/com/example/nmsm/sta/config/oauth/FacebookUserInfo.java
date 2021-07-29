package com.example.nmsm.sta.config.oauth;

import java.util.Map;

public class FacebookUserInfo extends OAuth2UserInfo{

    public FacebookUserInfo(Map<String,Object> attributes){
        this.attributes = attributes;
    }
    @Override
    public String getProvider() {
        return "facebook";
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
