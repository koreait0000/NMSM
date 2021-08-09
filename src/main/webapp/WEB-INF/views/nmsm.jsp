<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
  <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css"
  />
  <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css"
  />
  <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css"
  />
  <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
  />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
  <!-- datapicker -->

  <script type="application/javascript" href="/js/hostCalendar.js" defer></script>
  <link rel="stylesheet" href="/css/hostCalendar.css" />
  <link rel="stylesheet" href="/css/header.css"/>

<%--  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossOrigin="anonymous">--%>

  <title>놀멍쉬멍</title>
</head>
<body>

<div class="wrap">
    <div class="container">
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
  </section>

  <section>
    <div class="form-book container px-1 px-sm-5 mx-auto">
      <form autocomplete="off">
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
                      class="form-control text-left ml-2"
                      placeholder="To"/>
            </label>
          </div>
          <div class="col">
            <label
            >위치
              <div>
                <select>
                  <option value="서울">서울</option>
                  <option value="대전">대전</option>
                  <option value="광주">광주</option>
                  <option value="대구">대구</option>
                  <option value="부산">부산</option>
                  <option value="제주도">제주도</option>
                </select>
              </div>
            </label>
          </div>
          <div class="col">
            <label
            >반려견
              <input type="number" placeholder="마리 수" min="1" >
            </label>
          </div>
          <div class="col">
            <a href="#"><i class="fas fa-search fa-1.2x"></i></a>
          </div>
        </div>
      </form>
    </div>
  </section>
</div>
</body>
