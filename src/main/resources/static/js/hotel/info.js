// Initialize Swiper 
var swiper = new Swiper(".mySwiper", {
  cssMode: true,
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },
  pagination: {
    el: ".swiper-pagination",
  },
  mousewheel: true,
  keyboard: true,
});

var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
  center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
  level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴



//가격 계산
var h_price = document.getElementById('h_price');
var dogNum = document.getElementById('dogNum');
var checkIN = document.getElementById('checkIN');
var checkOUT = document.getElementById('checkOUT');




function calHotelPrice () {
  var hotelPrice = h_price.substr(1, h_price.length-2);
  var result = document.getElementById('result');
  let days = checkOUT - checkIN;
  let totalPrice = hotelPrice * days * dogNum;

  let innerResult = `₩${hotelPrice} X ${days}박 X ${dogNum}마리 = ₩${totalPrice}`;
  console.log(innerResult);
  result.innerHTML = innerResult;
}

document.addEventListener('DOMContentLoaded', calHotelPrice());











