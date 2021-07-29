package com.example.nmsm.sta.config.oauth;

import java.util.Map;

public class OAuth2UserInfo {
    protected Map<String,Object> attributes;

    public String getProviderId(){return null;}
    public String getProvider(){return null;}
    public String getEmail(){return null;}
    public String getName(){return null;}
    protected String attGet(String key){
        return attributes.get(key).toString();
    }
}
