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
  let checkIN = document.getElementById('checkIN').value;
  let checkOUT = document.getElementById('checkOUT').value;
  let result = document.getElementById('result');

  let days = dateDiff(checkOUT, checkIN);

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



////////////////////////////////////////review/////////////////////////////////////////////

//리뷰 리스트 띄우기
var reviewListElem = document.querySelector('#reviewList');
var loginUserPk = reviewListElem.dataset.loginUserPk;
var ihotel = reviewListElem.dataset.ihotel;

function getReviewListAjax() {
  fetch('review' + ihotel)
      .then(function(res) {
        return res.json();
      })
      .then(function(myJson) {
        console.log(myJson);
        makeReviewElemList(myJson);
      });
}

function makeReviewElemList(data) {
  reviewListElem.innerHTML = '';

  data.forEach(function (item) {

    const reviewDiv = document.createElement('div');
    const profileImgDiv = document.createElement('div');
    const nameDiv = document.createElement('h4');
    const dateDiv = document.createElement('p');
    const reviewCntDiv = document.createElement('p');

    const iconDiv = document.createElement('div');
    const likeDiv = document.createElement('div');
    const commentDiv = document.createElement('div');
    const shareDiv = document.createElement('div');


    profileImgDiv.innerText = item.iuser;
    nameDiv.innnerText = item.u_nm;
    dateDiv.innerText = item.review_regdt;
    reviewCntDiv.innerText = item.review_cnt;

    reviewDiv.append(profileImgDiv);
    reviewDiv.append(nameDiv);
    reviewDiv.append(dateDiv);
    reviewDiv.append(reviewCntDiv);
    reviewDiv.append(iconDiv);

    iconDiv.append(likeDiv);
    iconDiv.append(commentDiv);
    iconDiv.append(shareDiv);

    likeDiv.innerHTML = "<div class=\"like\">\n" +
        "                <i class=\"fa fa-thumbs-o-up\"></i>\n" +
        "                <span>Like</span>\n" +
        "              </div>";
    commentDiv.innerHTML = "<div class=\"comment\">\n" +
        "                <i class=\"fa fa-commenting-o\"></i>\n" +
        "                <span>Comment</span>\n" +
        "              </div>";
    shareDiv.innerHTML = "<div class=\"share\">\n" +
        "                <i class=\"fa fa-share\"></i>\n" +
        "                <span>Share</span>\n" +
        "              </div>";

    //로그인 한 사람과 리뷰를 작성한 사람이 같을 때
    if(loginUserPk === item.iuser) {
      var delBtn = document.createElement('button');
      var modBtn = document.createElement('button');

      //리뷰 삭제
      delBtn.addEventListener('click', function() {
        if(confirm('삭제하시겠습니까?')) {
          delAjax(item.ireview);
        }
      });

      modBtn.addEventListener('click', function() {
        modAjax(item.ireview);
      });

      delBtn.innerText = '삭제';
      modBtn.innerText = '수정';

      iconDiv.append(delBtn);
      iconDiv.append(modBtn);

    }

    reviewListElem.append(reviewDiv);
  });
}
document.addEventListener('DOMContentLoaded',getReviewListAjax());

//리뷰 등록, jsp에서 이전에 호텔 사용 기록이 있는지 확인하고 post button 활성화
function regReview(loginUserPk) {

  fetch('review' + ihotel, {method: 'POST'})
      .then(function(res){
        return res.json();
      })
      .then(function(data) {
        console.log(data);

        switch (data.result) {
          case 0:
            alert('리뷰 등록을 실패하였습니다.');
            break;
          case 1:
            getReviewListAjax();
            break;
        }
      })
}
document.addEventListener('DOMContentLoaded',regReview(loginUserPk));
//리뷰 삭제
function delAjax(ireview) {
  fetch('delReview' + ireview, { method: 'DELETE' })
      .then(function(res) {
        return res.json();
      })
      .then(function(data) {
        console.log(data);

        switch(data.result) {
          case 0:
            alert('리뷰 삭제를 실패하였습니다.');
            break;
          case 1:
            getReviewListAjax();
            break;
        }
      });
}

//review 수정
function modAjax(ireview){


}

//like 처리






