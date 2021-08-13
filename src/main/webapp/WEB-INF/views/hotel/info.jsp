<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <script href="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  <script href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	3230aea4ab512dde1e4de89760aa5719"></script>ㄴ



<div class="wrap">
  <section>
    <div class="container">
      <div class="hotel-detail">
        <h1 class="hotel-name">${h_name}</h1>
        <div class="row">
          <div class="col-md-8">
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
          <div class="col-md-4">
            <div id="map" style="width:500px;height:400px;"></div>
          </div>
        </div>
      </div>

      <div class="hotel-contents">
        <div class="hotel-article">
          <h1>${data.h_name}</h1>
          <div class="row">
            <div class="col-10">
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
              />
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
          <h1 id="h_price">₩${data.h_price}/박</h1>
          <div class="booking-option">
            <label>체크인<input type="date" id="checkIN"/></label>
            <label>체크아웃<input type="date" id="checkOUT" /></label>
            <label>반려견<input type="number" id="dogNum" placeholder="마리수"/></label>
          </div>
          <button onclick="calHotelPrice()">견적내기</button>
          <button type="submit">예약하기</button>
          <hr />
          <h1 id="result"></h1>
          <h1>총 합계 ₩280,889</h1>
        </div>
      </div>

      <div class="review-box">
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
                    class="form-control ml-1 shadow-none textarea"></textarea>
          </div>
          <div class="mt-2">
            <button class="btn shadow-none" type="button">Post</button>
          </div>
          <h2>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            ${data.h_star} (후기 ${result.reviewNum}개)
          </h2>
          <div class="review">
            <img
                    src="/image/NM.png"
                    alt=""
                    width="60"
                    height="60"
                    style="border-radius: 50%"
            />
            <!--호스트 프로필 사진 -->
            <h4>host name1</h4>
            <p>date 2021-07-12</p>
            <p>
              review contents : Lorem ipsum dolor, sit amet consectetur
              adipisicing elit. Accusantium dolore optio impedit atque.
              Eius eos voluptatibus soluta enim officiis corporis fuga.
              Tenetur voluptates minima quidem a, et itaque accusamus est!
            </p>
          </div>
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
          <br />
          <hr />
          <br />
          <div class="review-profile">
            <img
                    src="/image/NM.png"
                    alt=""
                    width="60"
                    height="60"
                    style="border-radius: 50%"
            />
            <!--호스트 프로필 사진 -->
            <h4>host name2</h4>
            <p>date 2021-07-11</p>
            <p>
              review contents : Lorem ipsum dolor, sit amet consectetur
              adipisicing elit. Accusantium dolore optio impedit atque.
              Eius eos voluptatibus soluta enim officiis corporis fuga.
              Tenetur voluptates minima quidem a, et itaque accusamus
              est!
            </p>
          </div>
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
          <br />
          <hr />
          <br />
          <div class="review-profile">
            <img
                    src="/image/NM.png"
                    alt=""
                    width="60"
                    height="60"
                    style="border-radius: 50%"
            />
            <!--호스트 프로필 사진 -->
            <h4>host name3</h4>
            <p>date 2021-07-10</p>
            <p>
              review contents : Lorem ipsum dolor, sit amet consectetur
              adipisicing elit. Accusantium dolore optio impedit atque.
              Eius eos voluptatibus soluta enim officiis corporis fuga.
              Tenetur voluptates minima quidem a, et itaque accusamus
              est!
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
            <br>
          </div>
        </div>
      </div>
    </div>
</div>
</div>
</div>
</section>
</div>

