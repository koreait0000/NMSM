<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <meta
          name="viewport"
          content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"
  />

  <!-- fullcalendar CDN -->

  <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js"></script>
  <!-- fullcalendar 언어 CDN -->

  <script type="application/javascript" href="/js/hostCalendar.js" ></script>
  <link rel="stylesheet" href="/css/hostCalendar.css" />


<body>
<div class="wrap">
  <div class="container">
    <!-- calendar -->
    <div class="calendar-container" id="calendar-container">
      <!-- TODO : host 이름 받아오기 -->
      <div class="calendar-title">**HOST님의 예약현황</div>
      <div class="calendar" id="calendar"></div>
    </div>
  </div>
</body>
</html>