// 모달 창 띄우기
const openBtn = document.getElementById("openBtn");
const modal = document.querySelector(".modal");
const overlay = modal.querySelector(".modal-overlay");

const openModal = () => {
  modal.classList.remove("hidden");
};
const closeModal = () => {
  modal.classList.add("hidden");
};
if(openBtn){
  openBtn.addEventListener("click", openModal);
}
overlay.addEventListener("click", closeModal);
// 모달 창 띄우기

// 모달 슬라이드

const loginBtn = document.getElementById("login");
const signupBtn = document.getElementById("signup");

loginBtn.addEventListener("click", (e) => {
  let parent = e.target.parentNode.parentNode;
  Array.from(e.target.parentNode.parentNode.classList).find((element) => {
    if (element !== "slide-up") {
      parent.classList.add("slide-up");
    } else {
      signupBtn.parentNode.classList.add("slide-up");
      parent.classList.remove("slide-up");
    }
  });
});

signupBtn.addEventListener("click", (e) => {
  let parent = e.target.parentNode;
  Array.from(e.target.parentNode.classList).find((element) => {
    if (element !== "slide-up") {
      parent.classList.add("slide-up");
    } else {
      loginBtn.parentNode.parentNode.classList.add("slide-up");
      parent.classList.remove("slide-up");
    }
  });
});
// 모달 슬라이드

// TODO : 로그인 했을 때 버튼 보이게
// 마우스 클릭했을 때 sub-menu 나타나게하기
$(document).ready(function() {
  $('.menu').on('click', function() {
    $('.lnb').slideToggle();
  })
})


