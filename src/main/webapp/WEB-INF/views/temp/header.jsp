<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
      <!-- TODO : 모달창 회원가입 로그인 정보 백엔드 넘기기 -->
      <sec:authorize access="isAnonymous()">
      <li class="btn" id="openBtn">
        LOG IN
        <svg
          class="foot-print"
          xmlns="http://www.w3.org/2000/svg"
          version="1.1"
          xml:space="preserve"
        >
          <title>foot-print</title>
          <g>
            <g stroke="null" id="svg_1">
              <path
                fill="#ffffff"
                stroke="null"
                d="m10.11359,14.96222c-0.21784,0.49421 -0.64702,0.77708 -1.21602,0.87462c-0.24711,0.04227 -0.49096,0.00325 -0.73156,-0.06503c-0.65678,-0.17883 -1.01768,-0.51697 -1.49564,-0.97542c-0.22435,-0.21459 -0.4812,-0.39342 -0.79009,-0.4617c-0.2406,-0.05202 -0.48771,-0.08454 -0.73156,-0.1203c-0.47145,-0.06503 -0.69579,-0.09754 -1.164,-0.17883c-0.43243,-0.07153 -0.83886,-0.24711 -1.23878,-0.41943c-0.28937,-0.12681 -0.55924,-0.29263 -0.77383,-0.52672c-0.18208,-0.19834 -0.3544,-0.40642 -0.43569,-0.67303c-0.13331,-0.42918 -0.05202,-0.81935 0.19508,-1.19326c0.41618,-0.64052 0.71205,-1.16725 1.32006,-1.61919c0.77708,-0.57549 1.60619,-1.05345 2.51657,-1.38184c0.55599,-0.20159 1.13148,-0.30563 1.72649,-0.29588c0.4747,0.00651 0.88113,0.18208 1.23227,0.49096c0.41943,0.36741 0.72831,0.8161 0.97867,1.30706c0.66003,1.30706 0.81935,2.63687 0.8161,4.1c-0.00651,0.37066 -0.07153,0.73482 -0.20809,1.13798z"
                id="svg_2"
              />
              <path
                fill="#ffffff"
                stroke="null"
                d="m13.82017,5.85834c-0.15607,0.31538 -0.31864,0.62426 -0.53323,0.90389c-0.51047,0.65678 -1.13798,1.13148 -1.92807,1.33632c-0.32514,0.08454 -0.64052,0.04877 -0.92665,-0.11055c-0.36416,-0.20484 -0.57875,-0.53323 -0.67954,-0.94615c-0.09754,-0.39017 -0.05202,-0.78359 0.08129,-1.164c0.41293,-1.18675 1.20951,-2.00285 2.32799,-2.48081c0.38041,-0.16257 0.78033,-0.20809 1.1705,-0.09104c0.35765,0.1073 0.59825,0.35115 0.71855,0.7153c0.14631,0.44544 0.1138,0.90063 -0.03252,1.35257c-0.05853,0.16257 -0.13331,0.32189 -0.19834,0.48446l0.00001,0z"
                id="svg_3"
              />
              <path
                fill="#ffffff"
                stroke="null"
                d="m9.32676,4.5838c-0.19834,0.51372 -0.48446,0.95916 -0.90389,1.31681c-0.20159,0.17232 -0.43243,0.29588 -0.68279,0.38366c-0.17558,0.05853 -0.3414,0.03577 -0.51372,-0.00651c-0.66978,-0.16582 -1.04044,-0.63727 -1.27454,-1.24853c-0.24385,-0.63402 -0.26987,-1.28755 -0.17558,-1.95083c0.09754,-0.69254 0.33164,-1.33307 0.77058,-1.8858c0.24385,-0.30888 0.53648,-0.55924 0.90063,-0.72181c0.53323,-0.2341 1.09247,-0.12355 1.49239,0.30238c0.30238,0.32189 0.48446,0.7088 0.582,1.13798c0.15607,0.69905 0.14306,1.39484 -0.02926,2.08739c-0.04552,0.19834 -0.1073,0.39017 -0.16582,0.58525l0,0.00002z"
                id="svg_4"
              />
              <path
                fill="#ffffff"
                stroke="null"
                d="m14.62326,10.60862c-0.19183,0.51697 -0.47795,0.96241 -0.88438,1.31356c-0.32839,0.28612 -0.69254,0.48446 -1.09247,0.58525c-0.56899,0.14306 -1.10222,-0.21134 -1.31031,-0.75107c-0.15282,-0.39992 -0.15607,-0.81285 -0.00651,-1.24203c0.31538,-0.89413 0.85512,-1.56392 1.65821,-1.95733c0.31538,-0.15607 0.64702,-0.2406 0.97867,-0.18533c0.40967,0.06828 0.69579,0.31538 0.8161,0.76083c0.10079,0.37391 0.06503,0.75758 -0.04877,1.14124c-0.03577,0.1138 -0.07478,0.22435 -0.11055,0.33489l0.00001,0z"
                id="svg_5"
              />
              <path
                fill="#ffffff"
                stroke="null"
                d="m4.86911,7.2857c-0.1073,0.31213 -0.25361,0.6015 -0.48771,0.84211c-0.33489,0.33489 -0.72506,0.49421 -1.19651,0.37391c-0.3544,-0.09104 -0.66003,-0.27637 -0.90714,-0.54298c-0.63402,-0.67954 -0.89413,-1.50214 -0.88113,-2.41578c0.00651,-0.51047 0.12681,-0.99818 0.34465,-1.45987c0.16907,-0.36416 0.42918,-0.66003 0.78359,-0.86162c0.57224,-0.32839 1.1705,-0.25036 1.67772,0.21134c0.44544,0.40642 0.7023,0.92014 0.84536,1.49564c0.15932,0.63727 0.14631,1.27779 -0.02601,1.91181c-0.04877,0.14631 -0.10405,0.29588 -0.15282,0.44544l-0.00001,0z"
                id="svg_6"
              />
            </g>
          </g>
        </svg>
      </li>
      </sec:authorize>
      <sec:authorize access="isAuthenticated()">
<%--            TODO : MJ : MyPage 버튼 수정해주세요
            경로 /my/mypet
--%>
      <li class="btn" id="myBtn">
        내 장
      </li>
      </sec:authorize>
    </ul>
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
            <input type="email" class="input" placeholder="Email" />
            <input
              type="password"
              class="input"
              placeholder="Password"
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
