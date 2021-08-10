<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="wrap">
  <section>
    <div class="form-holder">
      <form action="/my/myhotel" method="post">
        <div class="hotel-info"><input type="text" class="input" placeholder="호텔 이름" name="h_name"/></div>
        <div class="hotel-info"><textarea id="" cols="30" rows="10" name="h_detail">호텔 설명</textarea></div>
        <div class="hotel-info"><input type="text" class="input" placeholder="다음(카카오)주소 API 주소등록" name="h_address"/></div>
<%--        <div class="hotel-info"><input type="email" class="input" placeholder="호스트 이메일" /></div>--%>
        <div class="hotel-info"><input type="number" class="input" placeholder="호스트 휴대전화" name="u_tel" value="${u_tel}"/></div>
        <div class="hotel-info"><input type="number" class="input" placeholder="호텔 전화번호" name="h_tel"/></div>
        <div class="hotel-info"><input type="number" class="input"  placeholder="수용 가능 마리 수" name="h_capacity"/></div>
        <div class="hotel-info">
          <h6>호텔이미지 등록</h6>
          <input type="file" class="input" />
        </div>
        <div class="service-holder hotel-info">
<%--          <h6>서비스는 대형견, 중형견, 소형견으로 Kg단위로 책정 되어집니다.</h6>--%>
<%--          <div class="service">--%>
<%--            <div><img src="/image/salon.png" alt=""></div>--%>
<%--            <label><input type="radio" class="input" />미용 서비스</label>--%>
<%--            <div><input type="text" class="input"  placeholder="대형견 : 가격 설정"/></div>--%>
<%--            <div><input type="text" class="input"  placeholder="중형견 : 가격 설정"/></div>--%>
<%--            <div><input type="text" class="input"  placeholder="소형견 : 가격 설정"/></div>--%>
<%--          </div>--%>
<%--          <div class="service">--%>
<%--            <div><img src="/image/salon.png" alt=""></div>--%>
<%--            <label><input type="radio" class="input" />스파 서비스</label>--%>
<%--            <div><input type="text" class="input"  placeholder="대형견 : 가격 설정"/></div>--%>
<%--            <div><input type="text" class="input"  placeholder="중형견 : 가격 설정"/></div>--%>
<%--            <div><input type="text" class="input"  placeholder="소형견 : 가격 설정"/></div>--%>
<%--          </div>--%>
<%--          <div class="service">--%>
<%--            <div><img src="/image/salon.png" alt=""></div>--%>
<%--            <label><input type="radio" class="input" />--%>
<%--              그루밍 서비스<br>--%>
<%--              (목욕, 발톱, 빗질)--%>
<%--            </label>--%>
<%--            <div><input type="text" class="input"  placeholder="대형견 : 가격 설정"/></div>--%>
<%--            <div><input type="text" class="input"  placeholder="중형견 : 가격 설정"/></div>--%>
<%--            <div><input type="text" class="input"  placeholder="소형견 : 가격 설정"/></div>--%>
<%--          </div>--%>
          <c:forEach items="${services}" var="service">
          <div class="service">
            <div><img src="/image/service${service.iservice}.png" alt=""></div>
            <label><input type="radio" class="input" />${service.s_nm}</label>
            <div><input type="text" class="input"  placeholder="가격 설정"/></div>
          </div>
          </c:forEach>
        </div>

        <button>등록하기</button>
      </form>
    </div>
  </section>
</div>
