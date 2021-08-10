<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="wrap">
  <section>
    <div class="reservation-box">
      <div class="calender">
        <h1>달력 api</h1>
      </div>
      <form action="post">
        <input type="text" class="input" placeholder="Name" />
        <div>
          <input type="email" class="input" placeholder="Email" />
          <select name="" id="">
            <option value="">naver.com</option>
            <option value="">google.com</option>
            <option value="">google.com</option>
            <option value="">google.com</option>
          </select>
        </div>
        <input type="number" class="input" placeholder="000-0000-0000" />
        <label for=""><input type="radio">픽업요청</label>
        <label for=""><input type="radio">미용</label>
        <label for=""><input type="radio">스파</label>
        <label for=""><input type="radio">아카데미</label>
      </form>
      <div class="drag-drop-box">
        <div class="dogs-box">
          <div class="dogs-box-text">
            <h1>예약할 강아지</h1>
          </div>
          <div class="draggable" draggable="true">
            <img src="/image/NM.png" alt="" width="100" height="100">
            <p>Dog name</p>
          </div>
          <div class="draggable" draggable="true">
            <img src="/image/NM.png" alt="" width="100" height="100">
            <p>Dog name</p>
          </div>
        </div>
        <div class="dogs-box">
          <div class="dogs-box-text">
            <h1>내 강아지</h1>
            <p>드래그 해주세요</p>
          </div>
          <div class="draggable" draggable="true">
            <img src="/image/NM.png" alt="" width="100" height="100">
            <p>Dog name</p>
          </div>
          <div class="draggable" draggable="true">
            <img src="/image/NM.png" alt="" width="100" height="100">
            <p>Dog name</p>
          </div>
        </div>
      </div>
    </div>
    <div class="payment-box">
      <h1>결제방식 선택</h1>
      <label for=""><input type="radio" name="" id="">무통장입금</label>
      <label for=""><input type="radio" name="" id="">카드결제</label>
      <label for=""><input type="radio" name="" id="">휴대폰결제</label>
      <label for=""><input type="radio" name="" id="">간편결제</label>

      <label for=""><input type="radio" name="" id="">KakaoPay</label>
      <label for=""><input type="radio" name="" id="">NaverPay</label>
      <label for=""><input type="radio" name="" id="">Payco</label>
      <button type="submit">결제하기</button>
    </div>
  </section>
</div>
