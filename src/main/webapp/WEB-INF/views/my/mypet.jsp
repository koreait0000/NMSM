<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
    <section>
        <h1>나의 반려견</h1>
        <div class="mypet-box">
            <%-- ${pets}를 이용해서 내 강아지 값 들고오기 --%>
            <!-- TODO : 등록한 강아지 사진 / 이름 들고 오기 -->
            <img src="/image/NM.png" alt="" width="200">
            <h4>식빵이</h4>
        </div>

        <div class="toggle-btn">
            <a>
                <img src="/image/foorprint.svg" width="100">
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
                                    <div><img src="/image/NM.png" alt="" width="200"></div>
                                </label>
                                <input type="file" id="input-file" name="file"/>
                            </div>
                        </label>
                    </li>

                    <li>
                        <label>
                            반려견 이름
                            <div class="input"><input type="text" name="d_nm"></div>
                        </label>
                    </li>
                    <li>
                        <label>
                            반려견 생년월일
                            <div class="input"><input type="date" name="d_birth"></div>
                        </label>
                    </li>

                    <li>
                        <label>
                            반려견 성별
                            <div>
                                <label for="d_gender">
                                    <input type="radio" name="d_gender" id="d_gender" value="true" checked>
                                    <span>남</span>
                                </label>

                                <label for="d_gender">
                                    <input type="radio" name="d_gender" id="d_gender" value="false">
                                    <span >여</span>
                                </label>
                            </div>
                        </label>
                    </li>

                    <li>
                        <label>
                            중성화
                            <div>
                                <label for="d_neuter">
                                    <input type="radio" name="d_neuter" id="d_neuter" value="true" checked>
                                    <span>완료</span>
                                </label>

                                <label for="d_neuter">
                                    <input type="radio" name="d_neuter" id="d_neuter" value="false">
                                    <span>미완료</span>
                                </label>
                            </div>
                        </label>
                    </li>

                    <li>
                        <label>
                            반려견 견종
                            <div class="select">
                                <select name="breed_pk">
                                <c:forEach items="${breeds}" var="breed">
                                    <option value="${breed.breed_pk}">${breed.breed_nm}</option>
                                </c:forEach>
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
                                <input type="text" name="d_regNum">
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
