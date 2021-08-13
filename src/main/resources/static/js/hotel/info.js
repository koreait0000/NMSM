// // Initialize Swiper
// var swiper = new Swiper(".mySwiper", {
//   cssMode: true,
//   navigation: {
//     nextEl: ".swiper-button-next",
//     prevEl: ".swiper-button-prev",
//   },
//   pagination: {
//     el: ".swiper-pagination",
//   },
//   mousewheel: true,
//   keyboard: true,
// });
//
// var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
// var options = { //지도를 생성할 때 필요한 기본 옵션
//   center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
//   level: 3 //지도의 레벨(확대, 축소 정도)
// };
//
// var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴



//가격 계산

function calHotelPrice () {
  let h_price = document.getElementById('h_price').innerHTML;
  let dogNum = document.getElementById('dogNum').value;
  let checkIN = document.getElementById('checkIN');
  let checkOUT = document.getElementById('checkOUT');
  let result = document.getElementById('result');

  let days = dateDiff(checkOUT.value, checkIN.value);

  if(isNaN(days)) days=1;
  if(dogNum==='') dogNum=1;

  let hotelPrice = h_price.substring(1, h_price.length-2);
  let totalPrice = hotelPrice * days * dogNum;

  let innerResult = `₩${hotelPrice} X ${days}박 X ${dogNum}마리 = ₩${totalPrice}`;
  result.innerHTML = innerResult;
}

function dateDiff(_date1, _date2) {
  let diffDate_1 =new Date(_date1);
  let diffDate_2 =new Date(_date2);

  let diff = Math.abs(diffDate_1.getTime() - diffDate_2.getTime());
  diff = Math.ceil(diff / (1000 * 3600 * 24));

  return diff;
}

document.addEventListener('DOMContentLoaded',calHotelPrice());










