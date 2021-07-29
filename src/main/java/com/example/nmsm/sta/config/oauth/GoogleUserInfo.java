package com.example.nmsm.sta.config.oauth;

import java.util.Map;

public class GoogleUserInfo extends OAuth2UserInfo{

    public GoogleUserInfo(Map<String,Object> attributes){
        this.attributes = attributes;
    }
    @Override
    public String getProvider() {
        return "google";
    }
    @Override
    public String getProviderId() {
        return attGet("sub");
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
