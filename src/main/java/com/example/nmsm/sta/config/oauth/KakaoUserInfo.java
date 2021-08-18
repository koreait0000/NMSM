package com.example.nmsm.sta.config.oauth;

import java.util.Map;

public class KakaoUserInfo extends OAuth2UserInfo{

    public KakaoUserInfo(Map<String,Object> attributes){
        this.attributes = attributes;
    }
    @Override
    public String getProviderId() {
        return attributes.get("id").toString();
    }

    @Override
    public String getProvider() {
        return "kakao";
    }
    @Override
    public String getEmail() {
        Map<String, Object> map = (Map<String, Object>) attributes.get("kakao_account");
        String result = map.get("email").toString();
        System.out.println(result);
        return result;
    }

    @Override
    public String getName() {
        Map<String, Object> map = (Map<String, Object>) attributes.get("properties");
        String result = map.get("nickname").toString();
        System.out.println(result);
        return result;
    }
}
