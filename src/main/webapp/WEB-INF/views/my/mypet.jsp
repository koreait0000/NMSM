<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
    <section>
        <h1>나의 반려견</h1>
        <div class="mypet-box">
            <!-- TODO : 등록한 강아지 사진 / 이름 들고 오기 -->
            <img src="../img/NM.png" alt="" width="200">
            <h4>식빵이</h4>
        </div>

        <div class="toggle-btn">
            <a>
                <img src="../img/foorprint.svg" width="100">
                <h6>반려견 등록</h6>
            </a>
        </div>

        <div class="form-holder">
            <form>
                <ul>
                    <li>
                        <label>
                            반려견 사진등록
                            <div>
                                <label for="input-file">
                                    <!-- 사진 누르면 업로드 되도록 했음 -->
                                    <div><img src="../img/NM.png" alt="" width="200"></div>
                                </label>
                                <input type="file" id="input-file"/>
                            </div>
                        </label>
                    </li>

                    <li>
                        <label>
                            반려견 이름
                            <div class="input"><input type="text "></div>
                        </label>
                    </li>
                    <li>
                        <label>
                            반려견 생년월일
                            <div class="input"><input type="date"></div>
                        </label>
                    </li>

                    <li>
                        <label>
                            반려견 성별
                            <div>
                                <label for="dog-gender">
                                    <input type="radio" name="dog-gender" id="dog-gender" value="남" checked>
                                    <span>남</span>
                                </label>

                                <label for="dog-gender">
                                    <input type="radio" name="dog-gender" id="dog-gender" value="여">
                                    <span >여</span>
                                </label>
                            </div>
                        </label>
                    </li>

                    <li>
                        <label>
                            중성화
                            <div>
                                <label for="dog-net">
                                    <input type="radio" name="dog-net" id="dog-net" value="미완료" checked>
                                    <span>완료</span>
                                </label>

                                <label for="dog-net">
                                    <input type="radio" name="dog-net" id="dog-net" value="미완료">
                                    <span>미완료</span>
                                </label>
                            </div>
                        </label>
                    </li>

                    <li>
                        <label>
                            반려견 견종
                            <div class="select">
                                <select>
                                    <!-- TODO : 반려견 견종 받아오기 (믹스견도 데이터에 넣어주세요) -->
                                    <option>믹스</option>
                                </select>
                            </div>
                        </label>
                    </li>

                    <li>
                        <label>
                            유형
                            <div>
                                <label for="dog-size">
                                    <input type="radio" name="dog-size" id="dog-size" value="소형견" checked>
                                    <span>소형견</span>
                                </label>
                                <label for="dog-size">
                                    <input type="radio" name="dog-size" id="dog-size" value="중형견">
                                    <span>중형견</span>
                                </label>
                                <label for="dog-size">
                                    <input type="radio" name="dog-size" id="dog-size" value="대형견">
                                    <span>대형견</span>
                                </label>
                            </div>
                        </label>
                    </li>

                    <li>
                        <label>
                            반려견 등록번호
                            <div class="input">
                                <input type="text">
                            </div>
                        </label>
                    </li>
                    <li>
                        <button class="btn" type="submit">등록하기</button>
                    </li>
                </ul>
            </form>
        </div>
    </section>
</div>
