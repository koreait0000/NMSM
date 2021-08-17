<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%--<meta charset="UTF-8">--%>
<%--<meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
<%--<meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<!-- 파비콘 Favicon -->




<div class="wrap">
  <nav class="gnb nav">
    <div class="logo">
      <a href="/">
        <img src="/image/nav_logo.svg" alt="logo" width="100" />
      </a>
    </div>

    <ul>
      <!-- 프로젝트에 대한 설명 페이지로 이동-->
      <li class="btn">ABOUT</li>
      <!-- 조원들 프로필 페이지 -->
      <li class="btn">CONTACT</li>

      <!-- Button trigger modal -->
      <sec:authorize access="isAnonymous()">
      <li class="btn" id="openBtn">
        LOG IN
        <div class="foot-print foot"></div>
      </li>
    </ul>
      </sec:authorize>

      <sec:authorize access="isAuthenticated()">

      <li class="menu btn" id="myBtn">
        <div class="foot-print foot"></div>
      </li>

      <div class="lnb">
        <ul>
          <a href="/my/mypet"><li>반려견 등록</li></a>
          <a href="#"><li>프로필 수정</li></a>
          <a href="/my/myhotelbook"><li>예약관리</li></a>
          <a href="/my/mylike"><li>찜목록</li></a>
        <sec:authorize access="hasRole('OWNER')">
          <a href="/my/myhotel"><li>호스트 호텔관리</li></a>
        </sec:authorize>
        </ul>
      </div>
      </sec:authorize>
  </nav>
  <div class="modal hidden">
    <!-- 모달창 백그라운드-->

    <div class="modal-content" id="scale-up-center">

      <!-- 회원가입 -->
      <div class="signup">
        <h2 class="form-title" id="signup">
          <span>or</span>Sign up
        </h2>
        <form id="regist" class="form-holder" method="post" action="/my/regist">
          <input name="u_nm" type="text" class="input" placeholder="Name" />
          <input name="u_email" type="email" class="input" placeholder="Email" />
          <input name="u_pw" type="password" class="input" placeholder="Password"/>
          <input name="u_tel" type="tel" class="input" placeholder="tel" />
          <input name="u_birth" type="date" class="input" />
        </form>
        <button form="regist" class="submit-btn btn">Sign up</button>
      </div>
      <!-- 회원가입 -->
      <!-- 로그인 -->
      <div class="login slide-up">
        <div class="center">
          <h2 class="form-title" id="login">
            <span>or</span>Log in
          </h2>
          <form id="loginForm" class="form-holder" method="post" action="/login">
            <input type="email" class="input" placeholder="Email" name="u_email" />
            <input
              type="password"
              class="input"
              placeholder="Password"
              name="u_pw"
            />
          </form>
          <button form="loginForm" class="submit-btn btn">Log in</button>

          <div class="social">
            <p>Social Login</p>
            <div class="social-login">
              <a href="/oauth2/authorization/naver">
                <img class="naver" src="/image/naver.png" alt="" />
              </a>
              <a href="/oauth2/authorization/google">
                <img class="google" src="/image/google.png" alt="" />
              </a>
<%--                  TODO : 카카오 설정 넣기--%>
              <a><img class="kakao" src="/image/kakaotalk.png" alt="" /></a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="modal-overlay"></div>
  </div>
</div>
<script type="application/javascript" src="/js/header.js" defer></script>