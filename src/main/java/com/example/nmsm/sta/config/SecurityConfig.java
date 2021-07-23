package com.example.nmsm.sta.config;

import com.example.nmsm.sta.handler.LoginSuccessHandler;
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
    @Bean
    public BCryptPasswordEncoder encodePwd(){
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http)throws Exception{
        http
            .csrf().disable() // ?
            .httpBasic().disable() // ?
            .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)

            .and()
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
//                .deleteCookies() // TODO : ???

            .and()
            .oauth2Login()
            .loginPage("/login")
            .successHandler(new LoginSuccessHandler())
            .userInfoEndpoint(); // 로그인 후 처리




    }
}
