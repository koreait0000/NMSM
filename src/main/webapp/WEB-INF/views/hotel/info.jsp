<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
  <script href="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  <script href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	3230aea4ab512dde1e4de89760aa5719"></script>



<div class="container">
  <section>
    <div class="container">
      <div class="hotel-detail">
        <h1 class="hotel-name">${data.h_name}</h1>
        <div class="row">
          <div class="col-md-12">
            <div class="swiper-container mySwiper">
              <div class="swiper-wrapper">
                <!--호텔 사진 반복문 돌리기-->
                <div class="swiper-slide"><img src="/image/NM.png" alt="" class="/image-slide" /></div>
                <div class="swiper-slide"><img src="/image/NM.png" alt="" class="/image-slide" /></div>
                <div class="swiper-slide"><img src="/image/NM.png" alt="" class="/image-slide" /></div>
                <div class="swiper-slide"><img src="/image/NM.png" alt="" class="/image-slide" /></div>
                <div class="swiper-slide"><img src="/image/NM.png" alt="" class="/image-slide" /></div>
                <div class="swiper-slide"><img src="/image/NM.png" alt="" class="/image-slide" /></div>
              </div>
              <div class="swiper-button-next"></div>
              <div class="swiper-button-prev"></div>
              <div class="swiper-pagination"></div>
            </div>
          </div>
        </div>
      </div>

      <div class="hotel-contents container">
        <div class="hotel-article">
          <div class="container">
            <div class="row">
              <div class="col">
                <h1>${data.h_name}</h1>
              </div>
              <div class="col">
                <!-- 좋아요 버튼 -->
                <sec:authorize access="isAuthenticated()">
                <h1><i id="likeIcon" class="far fa-heart"></i></h1>
                </sec:authorize>
              </div>
            </div>
          </div>

          <div class="container">
            <div class="row">
              <div class="col">
                <!--호스트 프로필 -->
                <span class="hotel-rating">
                        <i class="far fa-star"></i>
                        <i class="far fa-star"></i>
                        <i class="far fa-star"></i>
                        <i class="far fa-star"></i>
                        <i class="far fa-star"></i>
                        ${data.h_star}
                </span>
                <div class="hotel-location">
                  <i class="fas fa-map-marker-alt"></i>
                  <h4>${data.h_address}</h4>
                </div>
              </div>
              <div class="col">
                <img
                        src="/image/NM.png"
                        alt=""
                        width="70"
                        height="70"
                        style="border-radius: 50%"
                        class="align-middle"
                />
              </div>
            </div>
          </div>

          <h6>
            호텔 설명(간단한 한줄 설명) : ${data.h_preDetail}
          </h6>

          <hr />

          <div class="service-box">
            <div class="service">
              <img src="/image/parking.png" alt="" width="60" />
              <p>주차가능</p>
            </div>
            <div class="service">
              <img src="/image/dog-walking.png" alt="" width="60" />
              <p>산책 서비스</p>
            </div>
            <div class="service">
              <img src="/image/salon.png" alt="" width="60" />
              <p>미용 서비스</p>
            </div>
            <div class="service">
              <img src="/image/pick-up.png" alt="" width="60" />
              <p>픽업 서비스</p>
            </div>
          </div>

          <h5>수용 가능한 반려견 ${data.h_capacity}마리</h5>

          <p>
            호텔 설명: ${data.h_detail}
          </p>
        </div>

        <div class="booking-box">
          <form action="/hotel/book" method="get">
          <h1 id="h_price">₩${data.h_price}/박</h1>
          <div class="booking-option">
            <label>체크인
              <div><input type="date" id="checkIN"/></div>
            </label>
            <label>체크아웃
              <div><input type="date" id="checkOUT" /></div>
            </label>
            <label>반려견
              <div><input type="number" id="dogNum" placeholder="마리수"/></div>
            </label>
          </div>
          <button class="btn" onclick="calHotelPrice()">견적내기</button>
          <button class="btn" type="submit">예약하기</button>
          <h1 id="result"></h1>
          </form>
        </div>
      </div>

      <div>
        <div id="map" class="map"></div>
      </div>


      <div class="review-box">
        <c:if test="${chkHotelUse} > 0">
          <div class="p-2">
            <div class="d-flex flex-row align-items-start">
              <img
                    src="/image/NM.png"
                    alt=""
                    width="60"
                    height="60"
                    style="border-radius: 50%"
              />
              <textarea
                    class="form-control ml-1 shadow-none textarea" id="reviewCnt" onsubmit="return false"></textarea>
            </div>
            <div class="mt-2">
              <button class="btn shadow-none" type="button" onclick="regReview(${iuser})">Post</button>
            </div>
          </div>
        </c:if>
          <h2>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            ${data.h_star} (후기 ${reviewNum}개)
          </h2>


          <div class="reviewList" data-login-user-pk="${loginUser}" data-ihotel="${data.ihotel}">
            <c:forEach var="item" items="${list}">
              <img
                      src="/image/NM.png"
                      alt=""
                      width="60"
                      height="60"
                      style="border-radius: 50%"
              />
              <h4>${item.u_nm}</h4>
              <p>${item.review_regdt}</p>
              <p>
                  ${item.review_cnt}
              </p>
              <div class="icon">
                <div class="like">
                  <i class="fa fa-thumbs-o-up"></i>
                  <span>Like</span>
                </div>
                <div class="comment">
                  <i class="fa fa-commenting-o"></i>
                  <span>Comment</span>
                </div>
                <div class="share">
                  <i class="fa fa-share"></i>
                  <span>Share</span>
                </div>
              </div>
            </c:forEach>
            <c:if test="${loginUser eq item.iuser}">
              <ul>
                <li class="btn" id="openBtn">수정</li>
                <li class="btn" onclick="delReview(${item.ireview})">삭제</li>
              </ul>
            </c:if>
          </div>
      </div>
    </div>
  </section>
</div>


