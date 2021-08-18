<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" ></script>

<div class="container">
  <section>
    <div class="container">
      <div class="row card-box">
        <c:forEach items="${list}" var="item">
          <div class="col card" onclick="location.href='/hotel/info?ihotel=${item.ihotel}';">
            <!-- TODO : 호스트가 등록한 호텔 메인 이미지 -->
            <!-- TODO : 호스트가 등록한 호텔정보 띄우기, 반복문 -->
            <img src="/image/NM.png" class="card-image" alt="" />
            <div class="card-overlay">
              <div class="card-header">
                <svg class="card-arc" xmlns="http://www.w3.org/2000/svg"><path fill="#ffffff" /></svg>
                <div class="card-header-text">
                  <h3 class="hotel-name">${item.h_name}</h3>
                  <!-- like -->
                  <c:if test="${item.like eq 1}">
                    <i class="far fa-star"></i>
                  </c:if>
                  <!-- 별점 -->
                  <span class="hotel-rating">
<%--                    <span style="width: ${item.h_star * 20}%;"></span>--%>
<%--                      ${item.h_star}--%>
                    <c:forEach begin="1" end="${item.h_star}">
                      &star;
                    </c:forEach>
                    ${item.h_star}
                  </span>
                </div>
              </div>
              <!-- TODO : 호스트가 등록한 서비스 이미지 띄우기 (호텔정보) -->
              <img src="/image/parking.png" alt="" width="30">
              <img src="/image/pick-up.png" alt="" width="30">
              <img src="/image/salon.png" alt="" width="30">
              <p class="hotel-description">${item.h_preDetail}</p>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </section>
</div>

<div>
  <c:forEach begin="1" end="${requestScope.maxPageVal}" var="page">
    <c:choose>
      <c:when test="${(empty param.page && page eq 1) || param.page eq page}">
        <span class="selected">${page}</span>
      </c:when>
      <c:otherwise>
        <span><a href="list?page=${page}&recordCnt=${param.recordCnt == null ? 5 : param.recordCnt}">${page}</a></span>
      </c:otherwise>
    </c:choose>
  </c:forEach>
</div>

</div>

