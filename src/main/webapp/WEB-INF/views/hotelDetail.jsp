<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <!-- swiper -->
  <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  <!-- swiper -->

  <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"
  />

  <link rel="stylesheet" href="hotelDetail.js" />
  <link rel="stylesheet" href="hotelDetail.css" />

  <title>HotelDetail</title>

</head>
<body>
<div class="wrap">
  <section>
    <div class="container">
      <div class="hotel-detail">
        <h1 class="hotel-name">Hotel Name</h1>
        <div class="row">
          <div class="col-md-8">
            <div class="swiper-container mySwiper">
              <div class="swiper-wrapper">
                <div class="swiper-slide"><img src="img/NM.png" alt="" class="img-slide" /></div>
                <div class="swiper-slide"><img src="img/NM.png" alt="" class="img-slide" /></div>
                <div class="swiper-slide"><img src="img/NM.png" alt="" class="img-slide" /></div>
                <div class="swiper-slide"><img src="img/NM.png" alt="" class="img-slide" /></div>
                <div class="swiper-slide"><img src="img/NM.png" alt="" class="img-slide" /></div>
                <div class="swiper-slide"><img src="img/NM.png" alt="" class="img-slide" /></div>
              </div>
              <div class="swiper-button-next"></div>
              <div class="swiper-button-prev"></div>
              <div class="swiper-pagination"></div>
            </div>
          </div>
          <div class="col-md-4">
            <!--지도 API  -->
            <img src="img/location.PNG" alt="" class="map" />
          </div>
        </div>
      </div>

      <div class="hotel-contents">
        <div class="hotel-article">
          <h1>HOST 임지영님의 호텔서비스</h1>
          <div class="row">
            <div class="col-10">
              <!--호스트 프로필 -->
              <span class="hotel-rating">
                      <i class="far fa-star"></i>
                      <i class="far fa-star"></i>
                      <i class="far fa-star"></i>
                      <i class="far fa-star"></i>
                      <i class="far fa-star"></i>
                      5.0
                    </span>
              <div class="hotel-location">
                <i class="fas fa-map-marker-alt"></i>
                <h4>대구광역시 중구 성내1동</h4>
              </div>
            </div>
            <div class="col">
              <img
                      src="img/NM.png"
                      alt=""
                      width="70"
                      height="70"
                      style="border-radius: 50%"
              />
            </div>
          </div>
          <h6>
            호텔 설명(간단한 한줄 설명) : Lorem ipsum dolor sit amet
            consectetur adipisicing elit.
          </h6>
          <hr />
          <div class="service-box">
            <div class="service">
              <img src="img/parking.png" alt="" width="60" />
              <p>주차가능</p>
            </div>
            <div class="service">
              <img src="img/dog-walking.png" alt="" width="60" />
              <p>산책 서비스</p>
            </div>
            <div class="service">
              <img src="img/salon.png" alt="" width="60" />
              <p>미용 서비스</p>
            </div>
            <div class="service">
              <img src="img/pick-up.png" alt="" width="60" />
              <p>픽업 서비스</p>
            </div>
          </div>
          <h5>수용 가능한 반려견 20마리</h5>

          <p>
            호텔 설명: Lorem ipsum dolor sit amet consectetur adipisicing
            elit. Repellat suscipit iusto impedit dolore cupiditate
            voluptate aspernatur officiis nemo ex modi! Similique amet natus
            a tempora beatae ea iure nisi temporibus? Lorem ipsum dolor sit,
            amet consectetur adipisicing elit. Expedita excepturi quisquam,
            impedit nobis, reiciendis doloremque, assumenda laborum enim
            iste ipsam ut eaque quaerat nisi nihil. Voluptas nulla saepe
            totam animi! Lorem ipsum dolor sit amet consectetur adipisicing
            elit. Ratione hic veritatis repellat placeat necessitatibus
            magni, dolore neque voluptates adipisci facere iste perferendis
            doloribus. Quidem optio, cupiditate voluptatum ratione animi
            dolore. Lorem ipsum dolor sit amet consectetur adipisicing elit.
            Nesciunt quasi, sunt saepe earum explicabo voluptas labore eius
            optio hic, atque aliquid placeat et! Odit pariatur, ipsa iste
            nam sit natus! Lorem ipsum dolor sit amet consectetur
            adipisicing elit. Quod, odio unde delectus esse dolore suscipit
            aspernatur deserunt odit cum, nulla totam a vero iusto!
            Perferendis, voluptatum expedita. Maiores, beatae molestiae.
            <br /><br />
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi
            doloribus quam aut ipsum laudantium quos veniam natus fugit, quo
            quod deserunt, adipisci, est reprehenderit nisi quibusdam ab
            distinctio consequatur dignissimos! Lorem ipsum, dolor sit amet
            consectetur adipisicing elit. Accusantium debitis ad hic est
            ipsam molestiae, nemo, necessitatibus ducimus rem impedit totam
            et vero neque voluptas quisquam, obcaecati aut fugit temporibus.
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Qui
            saepe unde quis vitae, inventore distinctio! Suscipit
            distinctio, animi nisi earum repellendus maxime et voluptate
            quaerat, atque eaque, cumque illo tenetur? Lorem ipsum dolor sit
            amet consectetur adipisicing elit. Hic voluptas reprehenderit
            laudantium, architecto corrupti corporis consectetur quod
            laboriosam non fugit vel doloribus tenetur temporibus, sequi
            quisquam adipisci nihil ad! Exercitationem!
          </p>
        </div>
        <div class="booking-box">
          <h1>₩280,889/ 박</h1>
          <div class="booking-option">
            <label>체크인<input type="date" /></label>
            <label>체크아웃<input type="date" /></label>
            <label>반려견<input type="number" placeholder="마리수"/></label>
          </div>
          <button type="submit">예약하기</button>
          <hr />
          <h1>₩280,889 X 1박 = ₩280,889</h1>
          <h1>총 합계 ₩280,889</h1>
        </div>
      </div>

      <div class="review-box">
        <div class="p-2">
          <div class="d-flex flex-row align-items-start">
            <img
                    src="img/NM.png"
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
            5.0 (후기 100개)
          </h2>
          <div class="review">
            <img
                    src="img/NM.png"
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
                    src="img/NM.png"
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
                    src="img/NM.png"
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
</body>
</html>

