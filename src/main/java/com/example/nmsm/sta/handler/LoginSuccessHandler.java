package com.example.nmsm.sta.handler;

import com.example.nmsm.sta.config.auth.PrincipalDetails;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        System.out.println("LoginSuccessHandler 실행");
        PrincipalDetails principalDetails
                = (PrincipalDetails) authentication.getPrincipal();
        if (principalDetails.getUserEntity().getAuth() == null){
            response.sendRedirect("/");
        }else {
            response.sendRedirect("/my");
        }
    }
}
