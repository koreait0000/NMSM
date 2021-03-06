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
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
  center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
  level: 3 //지도의 레벨(확대, 축소 정도)
};
var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴


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


////////////////////////////////////////review/////////////////////////////////////////////

let reviewListElem = document.querySelector('#reviewList');
let reviewCntElem = document.querySelector('#reviewCnt');

function selReview() {

}

function selReviewAjax(param) {
  fetch('review?ihotel=' + reviewListElem.dataset.ihotel)
      .then(function(res) {
        return res.json();
      })
      .then(function (myJson) {
        console.log(myJson);
      })
}

function regReview() {
  let reviewCnt = reviewCntElem.value;
  let param = {
    ihotel: reviewListElem.dataset.ihotel,
    cnt: reviewCnt
  };
  regAjax(param);
}
function regAjax(param) {
  const init = {
    method: 'POST',
    body: JSON.stringify(param),
    headers:{
      'accept' : 'application/json',
      'content-type' : 'application/json;charset=UTF-8'
    }
  };

  fetch('review', init)
      .then(function(res) {
        return res.json();
      })
      .then(function(myJson) {
        console.log(myJson);

        switch(myJson.result) {
          case 0: //등록 실패
            alert('등록 실패!');
            break;
          case 1: //등록 성공
            reviewCntElem.value = '';
            break;
        }
      });
}

//리뷰 삭제
function delReview(ireview) {
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
            break;
        }
      });
}

///////////////////////////like///////////////////////
//star 눌렀을 때 동작
let likeIconElem = document.querySelector('#likeIcon');
if (likeIconElem !== null){
  likeIconElem.addEventListener('click', function() {
    if(likeIconElem.classList.contains('far')) {
      insLikeAjax();
    } else {
      delLikeAjax();
    }
  });
}


function insLikeAjax() {
  console.log(reviewListElem);
  const param = {
    ihotel : reviewListElem.dataset.ihotel
  };
  const init = {
    method: 'POST',
    body: JSON.stringify(param),
    headers:{
      'accept' : 'application/json',
      'content-type' : 'application/json;charset=UTF-8'
    }
  };

  fetch('like', init)
      .then(function(res) {
        return res.json();
      })
      .then(function (myJson) {
        if(myJson.result === 1) {
          toggleLike(1);
        }
      })
}

function delLikeAjax() {
  const init = {
    method: 'DELETE'
  };
  const ihotel = reviewListElem.dataset.ihotel;

  fetch('delLike?ihotel=' + ihotel, init)
      .then(function(res) {
        return res.json();
      })
      .then(function (myJson) {
        if(myJson.result === 1) {
          toggleLike(0);
        }
      })
}

//like 여부 확인
function chkLikeAjax() {
  fetch('like?ihotel=' + reviewListElem.dataset.ihotel)
      .then(function(res) {
        return res.json();
      })
      .then(function (myJson) {
        toggleLike(myJson.result);
      })
}

function toggleLike(toggle) {
  console.log(likeIconElem);
        switch (toggle) {
          case 0:  // delete like
            likeIconElem.classList.remove('fas');
            likeIconElem.classList.add('far');
            break;
          case 1: // insert like
            likeIconElem.classList.remove('far');
            likeIconElem.classList.add('fas');
            break;
        }
}

calHotelPrice();
chkLikeAjax();







