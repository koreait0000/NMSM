<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="hotelResgisteration.js" />
  <link rel="stylesheet" href="hotelResgisteration.css" />
  <title>호텔등록</title>

<body>
<div class="wrap">
  <section>
    <div class="form-holder">
      <form>
        <div class="hotel-info"><input type="text" class="input" placeholder="호텔 이름" /></div>
        <div class="hotel-info"><textarea name="" id="" cols="30" rows="10">호텔 설명</textarea></div>
        <!-- TODO : 호텔주소 등록, api들고오는 작업 자리  -->
        <div class="hotel-info"><input type="text" class="input" placeholder="다음(카카오)주소 API 주소등록" /></div>
        <div class="hotel-info"><input type="email" class="input" placeholder="호스트 이메일" /></div>
        <div class="hotel-info"><input type="number" class="input" placeholder="호스트 휴대전화" /></div>
        <div class="hotel-info"><input type="number" class="input" placeholder="호텔 전화번호" /></div>
        <div class="hotel-info"><input type="number" class="input"  placeholder="수용 가능 마리 수"/></div>
        <div class="hotel-info">
          <h6>호텔이미지 등록</h6>
          <input type="file" class="input" />
        </div>
        <div class="service-holder hotel-info">
          <h6>서비스는 대형견, 중형견, 소형견으로 Kg단위로 책정 되어집니다.</h6>
          <div class="service">
            <div><img src="img/salon.png" alt=""></div>
            <label><input type="radio" class="input" />미용 서비스</label>
            <div><input type="text" class="input"  placeholder="대형견 : 가격 설정"/></div>
            <div><input type="text" class="input"  placeholder="중형견 : 가격 설정"/></div>
            <div><input type="text" class="input"  placeholder="소형견 : 가격 설정"/></div>
          </div>
          <div class="service">
            <div><img src="img/salon.png" alt=""></div>
            <label><input type="radio" class="input" />스파 서비스</label>
            <div><input type="text" class="input"  placeholder="대형견 : 가격 설정"/></div>
            <div><input type="text" class="input"  placeholder="중형견 : 가격 설정"/></div>
            <div><input type="text" class="input"  placeholder="소형견 : 가격 설정"/></div>
          </div>
          <div class="service">
            <div><img src="img/salon.png" alt=""></div>
            <label><input type="radio" class="input" />
              그루밍 서비스<br>
              (목욕, 발톱, 빗질)
            </label>
            <div><input type="text" class="input"  placeholder="대형견 : 가격 설정"/></div>
            <div><input type="text" class="input"  placeholder="중형견 : 가격 설정"/></div>
            <div><input type="text" class="input"  placeholder="소형견 : 가격 설정"/></div>
          </div>
          <div class="service">
            <div><img src="img/pick-up.png" alt=""></div>
            <label><input type="radio" class="input" />픽업 서비스</label>
            <div><input type="text" class="input"  placeholder="가격 설정"/></div>
          </div>
          <div class="service">
            <div><img src="img/pick-up.png" alt=""></div>
            <label><input type="radio" class="input" />드롭 서비스</label>
            <div><input type="text" class="input"  placeholder="가격 설정"/></div>
          </div>
          <div class="service">
            <div><img src="img/pick-up.png" alt=""></div>
            <label><input type="radio" class="input" />산책 서비스</label>
          </div>
          <div class="service">
            <div><img src="img/parking.png" alt=""></div>
            <label><input type="radio" class="input" />주차공간 서비스</label>
          </div>
          <div class="service">
            <div><img src="img/pick-up.png" alt=""></div>
            <label><input type="radio" class="input" />영양제 복용 서비스</label>
          </div>
        </div>

        <button>등록하기</button>
      </form>
    </div>
  </section>
</div>
</body>
</html>
