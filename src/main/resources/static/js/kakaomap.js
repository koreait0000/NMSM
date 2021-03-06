function findAddr(){
    new daum.Postcode({
        oncomplete: function(data) {

            console.log(data);
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('h_location').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById('h_address_1').value = roadAddr;
            }
            else if(jibunAddr !== ''){
                document.getElementById("h_address_2").value = jibunAddr;
            }
        }
    }).open();
}