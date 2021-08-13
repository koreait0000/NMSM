
// 반려견 등록 누르면 form 태그양식 보이게
$(document).ready(function() {
    $('.toggle-btn').on('click', function() {
        $('.form-holder').slideToggle();
    })
})

//있음 클릭했을 때 입력 창 뜸 (수정 예정)
$(document).ready(function() {
    $('.dog-number-btn').on('click', function() {
        $('.dog-number-box').slideToggle();
    })
})