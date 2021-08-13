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

    openBtn.addEventListener("click", openModal);
    overlay.addEventListener("click", closeModal);
    // 모달 창 띄우기

    // 모달 슬라이드
    console.clear();

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

    //datepicker
    $(document).ready(function () {
    $(".input-daterange").datepicker({
        format: "dd-mm-yyyy",
        clearBtn: true,
        disableTouchKeyboard: true,
        todayHighlight: true,
        startDate: "0d",
    });
});

//datepicker
$(document).ready(function () {
 $(".input-daterange").datepicker({
     format: "dd-mm-yyyy",
     clearBtn: true,
     disableTouchKeyboard: true,
     todayHighlight: true,
     startDate: "0d",
 });
});

