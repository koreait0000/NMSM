package com.example.nmsm.sta.config.auth;

import com.example.nmsm.dyn.dao.UserDAO;
import com.example.nmsm.sta.model.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

// 시큐리티 설정에서 loginProcessingUrl("/login") 일때
// /login 요청에서 자동으로 UserDetailsService 타입으로 IoC 되어있는 loadUserByUserName 함수 실행
@Service
public class PrincipalDetailsService implements UserDetailsService {

    @Autowired
    private UserDAO nmsmUserDAO;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        System.out.println(this.getClass().getSimpleName()+"진입");
        UserEntity userEntity = nmsmUserDAO.selectByUemail(username);
        System.out.println(userEntity);
        if (userEntity != null){
            return new PrincipalDetails(userEntity);
        }
        return null;
    }
}
