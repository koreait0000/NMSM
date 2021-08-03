package com.example.nmsm.sta.config.auth;

import com.example.nmsm.sta.model.UserEntity;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

// 시큐리티가 login 진행시,
// 로그인 완료 => "security session"에 추가
// Authentication 안에 User 존재
// User => UserDetails로 존재!
@Data
public class PrincipalDetails implements UserDetails, OAuth2User {

    private UserEntity userEntity;
    private Map<String, Object> attributes;

    public PrincipalDetails(UserEntity userEntity){
        // 일반 로그인
        this.userEntity = userEntity;
    }

    public PrincipalDetails(UserEntity userEntity,
                            Map<String, Object> attributes){
        // oauth 로그인
        this.userEntity = userEntity;
        this.attributes = attributes;
    }

    // 권한 리턴
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> collect = new ArrayList<>();
        collect.add(new GrantedAuthority() {
            @Override
            public String getAuthority() {
                return userEntity.getAuth();
            }
        });
        return collect;
    }

    @Override
    public String getPassword() {
        return userEntity.getU_pw();
    }

    @Override
    public String getUsername() {
        return userEntity.getU_nm();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public Map<String, Object> getAttributes() {
        return attributes;
    }

    @Override
    public String getName() {
        return null;
    }

}
