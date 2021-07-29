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
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    private UserDAO userDAO;

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
            default:
                System.out.println("지원하지 않는 로그인");
        }
        // TODO : 로그인 처리 정리하기
        String providerId = oAuth2UserInfo.getProviderId();
        String email = oAuth2UserInfo.getEmail();
        String username = provider + providerId;
        String password = bCryptPasswordEncoder.encode("겟인데어");
        String role = "ROLE_USER";

        System.out.println(provider);

        UserEntity user = userDAO.selectByUnm(username);

        if(user == null){
//            user = UserEn.builder()
//                .username(username)
//                .password(password)
//                .email(email)
//                .role(role)
//                .provider(provider)
//                .providerId(providerId)
//                .build();
            userDAO.insertUser(user);
        }else {

        }

        return new PrincipalDetails(user,oAuth2User.getAttributes());
    }
}
