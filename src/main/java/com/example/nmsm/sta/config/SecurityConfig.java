package com.example.nmsm.sta.config;

import com.example.nmsm.sta.config.auth.PrincipalOauth2UserService;
import com.example.nmsm.sta.handler.LoginSuccessHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private PrincipalOauth2UserService principalOauth2UserService;
    @Bean
    public BCryptPasswordEncoder encodePwd(){
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http)throws Exception{
        // TODO : 접근 제어 설정
        http
            .csrf().disable()
            .authorizeRequests()
//            .antMatchers("").permitAll() // 허용
//            .antMatchers("").authenticated() // 인증 필요
//            .antMatchers().access("hasRole('ROLE_ADMIN')")
            .anyRequest().permitAll()
            // 로그인 관련 부분
            .and()
            .formLogin()
            .loginPage("/login")
            .loginProcessingUrl("/login")
            .usernameParameter("u_email")
            .passwordParameter("u_pw")
            .defaultSuccessUrl("/")
            // 로그아웃
            .and()
            .logout()
            .logoutSuccessUrl("/")
            .and()
            .oauth2Login()
            .loginPage("/login")
            .successHandler(new LoginSuccessHandler())
            .userInfoEndpoint()
            .userService(principalOauth2UserService); // 로그인 후 처리




    }
}
