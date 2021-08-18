package com.example.nmsm.sta.config.auth;

import com.example.nmsm.dyn.dao.UserDAO;
import com.example.nmsm.sta.config.oauth.*;
import com.example.nmsm.sta.model.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService {

    @Autowired
    private UserDAO userDAO;
    private BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {

        OAuth2User oAuth2User = super.loadUser(userRequest);

        System.out.println(oAuth2User.getAttributes());


        String provider = userRequest.getClientRegistration().getRegistrationId(); // google

        OAuth2UserInfo oAuth2UserInfo = null;
        switch (provider){
            case "google":
                oAuth2UserInfo = new GoogleUserInfo(oAuth2User.getAttributes());
                break;
            case "facebook":
                oAuth2UserInfo = new FacebookUserInfo(oAuth2User.getAttributes());
                break;
            case "naver":
                oAuth2UserInfo = new NaverUserInfo((Map<String, Object>) oAuth2User.getAttributes().get("response"));
                break;
            case "kakao":
                oAuth2UserInfo = new KakaoUserInfo(oAuth2User.getAttributes());
                break;
            default:
                System.out.println("지원하지 않는 로그인");
        }
        // 회원 정보 받아오기 + 회원가입 하기
        String providerId = oAuth2UserInfo.getProviderId();
        String username = oAuth2UserInfo.getName();
        String email = oAuth2UserInfo.getEmail();
        String password = bCryptPasswordEncoder.encode(username+providerId);
        String role = "ROLE_USER";
        UserEntity user = userDAO.selectByEmail(email);

        if(user == null){
            user = new UserEntity();
            user.setU_email(email);
            user.setU_nm(username);
            user.setU_pw(password);
            user.setU_birth(null);
            user.setU_tel(null);
            user.setAuth(role);
            System.out.println(user);
            userDAO.insertUser(user);
        }else {

        }

        return new PrincipalDetails(user,oAuth2User.getAttributes());
    }
}
