package com.example.nmsm.config.auth;

import com.example.nmsm.dao.NmsmUserDAO;
import com.example.nmsm.model.NmsmUserEntity;
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
    private NmsmUserDAO nmsmUserDAO;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        System.out.println(this.getClass().getSimpleName()+"진입");
        NmsmUserEntity userEntity = nmsmUserDAO.selectByUnm(username);
        if (userEntity != null){
            return new PrincipalDetails(userEntity);
        }
        return null;
    }
}
