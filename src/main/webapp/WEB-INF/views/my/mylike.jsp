<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
  <section>
    <h1>나의 찜목록</h1>
    <div class="search-filter">
      <button type="menu"></button>
    </div>
    <div class="card-box">
      <ul>
        <c:forEach items="${list}" var="item">
        <li class="card" onclick="location.href='/hotel/info?ihotel=${item.ihotel}';">
          <img src="${itme.h_img}" class="card-image" alt="" />
          <div class="card-overlay">
            <div class="card-header">
              <svg class="card-arc" xmlns="http://www.w3.org/2000/svg"><path fill="#ffffff" /></svg>
              <div class="card-header-text">
                <h3 class="hotel-name">${item.h_name}</h3>
                <span class="hotel-rating">
                <c:forEach begin="1" end="${item.h_star}">
                  &star;
                </c:forEach>
                ${item.h_star}
                </span>
              </div>
            </div>
            <img src="/image/parking.png" alt="" width="30">
            <img src="/image/pick-up.png" alt="" width="30">
            <img src="/image/salon.png" alt="" width="30">
            <p class="hotel-description">
              ${item.h_preDetail}
            </p>
          </div>
        </li>
        </c:forEach>
      </ul>
    </div>
  </section>
</div>
