<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
    <section>
        <h1>나의 반려견</h1>

        <div class="mypet-box">
            <c:forEach items="${pets}" var="pet">
            <div class="mypet">
                <%-- TODO : 등록한 강아지 사진 바꾸기!--%>
                <img src="/image/NM.png" alt="" width="200">
                <h4>${pet.d_nm}</h4>
            </div>
            </c:forEach>
            <div class="toggle-btn mypet">
                <a>
                    <img src="/image/footprint.svg" width="100">
                    <h6>반려견 등록</h6>
                </a>
            </div>
        </div>



        <div class="form-holder">
            <form action="/my/mypet" method="post">
                <ul>
                    <li>
                        <label>
                            <div class="form-label"><div class="foot-print foot"></div><h4>반려견 사진등록</h4></div>
                            <div>
                                <label for="input-file">
                                    <!-- 사진 누르면 업로드 되도록 했음 -->
                                    <div><img src="/image/NM.png" alt="" width="200"></div>
                                </label>
                                <input type="file" id="input-file"/>
                            </div>
                        </label>
                    </li>

                    <li>
                        <label>
                            <div class="form-label"><div class="foot-print foot"></div><h4>반려견 이름</h4></div>
                            <div><input type="text" placeholder="이름 입력" name="d_nm"></div>
                        </label>
                    </li>

                    <li>
                        <label>
                            <div class="form-label"><div class="foot-print foot"></div><h4>반려견 생년월일</h4></div>
                            <div><input type="date" name="d_birth"></div>
                        </label>
                    </li>

                    <li>
                        <label>
                            <div class="form-label"><div class="foot-print foot"></div><h4>반려견 성별</h4></div>
                            <div class="toggle">
                  <span class="gender check">
                    <input type="radio" name="d_gender" id="dog-gender-m" value="true" checked>
                    <label for="dog-gender-m">남<i class="fas fa-check"></i></label>
                  </span>

                                <span class="gender check">
                    <input type="radio"  name="d_gender" id="dog-gender-f" value="false">
                    <label for="dog-gender-f">여<i class="fas fa-check"></i></label>
                  </span>
                            </div>
                        </label>
                    </li>

                    <li>
                        <label>
                            <div class="form-label"><div class="foot-print foot"></div><h4>중성화</h4></div>
                            <div class="toggle">
                  <span class="dog-net check">
                    <input type="radio" name="d_neuter" value="false" id="dog-net" checked>
                    <label for="dog-net">미완료<i class="fas fa-check"></i></label>
                  </span>

                                <span class="dog-net check">
                    <input type="radio" name="d_neuter" id="dog-net-completion" value="true" >
                    <label for="dog-net-completion">완료<i class="fas fa-check"></i></label>
                  </span>
                            </div>
                        </label>
                    </li>

                    <li>
                        <label>
                            <div class="form-label"><div class="foot-print foot"></div><h4>반려견 견종</h4></div>
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
                            <div class="form-label"><div class="foot-print foot"></div><h4>유형</h4></div>

                            <div class="toggle">
                  <span class="dog-size check">
                    <input type="radio" name="dog-size" id="dog-size-s" value="소형견" checked>
                    <label for="dog-size-s">소형견<i class="fas fa-check"></i></label>
                  </span>
                                <span class="dog-size check">
                    <input type="radio" name="dog-size" id="dog-size-m" value="중형견">
                    <label for="dog-size-m">중형견<i class="fas fa-check"></i></label>
                                    </span>
                                    <span class="dog-size check">
                    <input type="radio" name="dog-size" id="dog-size-l" value="대형견">
                    <label for="dog-size-l">대형견<i class="fas fa-check"></i></label>
                  </span>
                            </div>
                        </label>
                    </li>

                    <li>
                        <label>
                            <div class="form-label"><div class="foot-print foot"></div><h4>반려견 등록번호</h4></div>

                            <div class="toggle">
                  <span class="dog-number check">
                    <input type="radio" name="dog-number" id="dog-number-not" checked>
                    <label class="dog-number-not" for="dog-number-not">없음<i class="fas fa-check"></i></label>
                  </span>

                                <span class="dog-number check" >
                    <input type="radio" name="dog-number" id="dog-number-completion">
                    <label class="dog-number-btn" for="dog-number-completion">있음<i class="fas fa-check"></i></label>
                  </span>
                            </div>
                        </label>
                        <!-- 있음 클릭했을 때 입력 창 뜸 -->
                        <div class="dog-number-box">
                            <input type="text" placeholder="등록번호 입력" name="d_regNum">
                        </div>
                    </li>

                    <li>
                        <button class="btn" type="submit">등록하기</button>
                    </li>
                </ul>
            </form>
        </div>
    </section>
</div>
