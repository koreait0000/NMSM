<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
<!-- datapicker -->

<script type="application/javascript" href="/js/hostCalendar.js" defer></script>
<link rel="stylesheet" href="/css/hostCalendar.css" />
<%--  <link rel="stylesheet" href="/css/nmsm.css"/>--%>
<%--  <link rel="stylesheet" href="/css/header.css"/>--%>


<div class="wrap">
  <img src="image/background-ocean.svg" class
  <div class="container title">
    <div class="row">
      <div class="col-md-4">
        <h2 class="sub-title-1">반려견을 위한</h2>
        <div class="bar"></div>
      </div>
      <div class="col-md-8"></div>
    </div>
    <div class="row">
      <div class="col-md"></div>
      <div class="col-md">
        <h1 class="sub-title-2 tracking-in-expand">호캉스</h1>
      </div>
    </div>
  </div>


  <section>
    <div class="form-book container px-1 px-sm-5 mx-auto">
      <form autocomplete="off" action="/hotel/list" method="post">
        <div class="input-group flex-row d-flex justify-content-center">
          <div class="col input-daterange">
            <label
                    class="ml-3 form-control-placeholder"
                    id="start-p"
                    for="start"
            >체크인
              <span class="fa fa-calendar" id="fa-1"></span>
              <input
                      type="text"
                      id="start"
                      name="checkIN"
                      class="form-control text-left mr-2"
                      placeholder="From"/>
            </label>
          </div>
          <div class="col input-daterange">
            <label
                    class="ml-3 form-control-placeholder"
                    id="end-p"
                    for="end"
            >체크아웃
              <span class="fa fa-calendar" id="fa-2"></span>
              <input
                      type="text"
                      id="end"
                      name="checkOUT"
                      class="form-control text-left ml-2"
                      placeholder="To"/>
            </label>
          </div>
          <div class="col">
            <label
            >위치
              <div>
                <select name="hLocation">
                <c:forEach var="loc" items="${locs}">
                  <option value="${loc.loc_code}">${loc.loc_name}</option>
                </c:forEach>
                </select>
              </div>
            </label>
          </div>
          <div class="col">
            <label
            >반려견
              <input type="number" placeholder="마리 수" name="bookDogNum" min="1" >
            </label>
          </div>
          <div class="col">
            <button><i class="fas fa-search fa-1.2x"></i></button>
          </div>
        </div>
      </form>
    </div>
  </section>
</div>