<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <meta
          name="viewport"
          content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"
  />
  <link rel="stylesheet" href="/fullcalendar/main.css" />
  <link rel="stylesheet" href="/css/hostCalendar.css" />




<div class="wrap">
  <div class="container">
    <div class="calendar-container" id="calendar-container">
      <div class="calendar-title">${u_nm}님의 예약현황</div>
      <div class="calendar" id="calendar"></div>
    </div>
  </div>
</div>
<script type="application/javascript" src="/fullcalendar/main.js" ></script>
<script type="application/javascript" src="/js/hostCalendar.js" ></script>