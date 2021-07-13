drop database nmsm;

create database nmsm default character set utf8mb4 collate utf8mb4_general_ci;

use nmsm;

CREATE TABLE user (
  iuser INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  u_nm VARCHAR(10) NOT NULL,
  u_email VARCHAR(30) UNIQUE NOT NULL,
  u_pw VARCHAR(60) NOT NULL,
  u_birth DATE,
  u_tel VARCHAR(11),
  auth VARCHAR(10) check(auth in('ADMIN','USER','OWNER'))
);

CREATE TABLE dog_breed (
    breed_pk INT PRIMARY KEY AUTO_INCREMENT,
    breed_nm VARCHAR(30) NOT NULL
);

CREATE TABLE dog_info (
  idog INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  iuser INT UNSIGNED NOT NULL,
  breed_pk INT UNSIGNED NOT NULL,
  d_age DATE NOT NULL,
  d_nm VARCHAR(10) NOT NULL,
  d_gender TINYINT(1) UNSIGNED NOT NULL,
  d_weight FLOAT(4, 2) UNSIGNED NOT NULL,
  d_regNum INT(12) comment '강아지 등록 번호',
  d_neuter TINYINT(1) UNSIGNED NOT NULL comment '0 : 중성화 했음, 1 : 중성화 안했음',
  FOREIGN KEY (iuser) REFERENCES user (iuser),
  FOREIGN KEY (breed_pk) REFERENCES dog_breed (breed_pk)
);


CREATE TABLE hotel_info (
    ihotel INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    iuser INT UNSIGNED,
    h_capacity INT UNSIGNED NOT NULL,
    h_location VARCHAR(10) NOT NULL,
    h_address VARCHAR(50) NOT NULL,
    h_price INT UNSIGNED NOT NULL,
    mapX decimal(20, 16) NOT NULL,
    mapY double(20, 16) NOT NULL,
    h_preDetail VARCHAR(100) NOT NULL comment '요약 설명',
    h_detail TEXT NOT NULL,
    h_tel VARCHAR(11) NOT NULL,
    h_star FLOAT(2, 1),
    FOREIGN KEY (iuser) REFERENCES user (iuser)
);

CREATE TABLE service (
    iservice INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    s_nm VARCHAR(20) not null
);

CREATE TABLE hotel_service (
    s_price INT UNSIGNED,
    ihotel INT UNSIGNED,
    iservice INT UNSIGNED,
    PRIMARY KEY (ihotel, iservice),
    FOREIGN KEY (iservice) REFERENCES service (iservice),
    FOREIGN KEY (ihotel) REFERENCES hotel_info (ihotel)
);


CREATE TABLE hotel_img (
    ihotel INT UNSIGNED,
    h_img VARCHAR(100) NOT NULL,
    PRIMARY KEY (ihotel, h_img),
    FOREIGN KEY (ihotel) REFERENCES hotel_info (ihotel)
);

CREATE TABLE book_info (
    ibook INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    checkIN DATE NOT NULL,
    checkOUT DATE NOT NULL,
    ihotel INT UNSIGNED,
    iuser INT UNSIGNED,
    service INT UNSIGNED,
    FOREIGN KEY (ihotel) REFERENCES hotel_info (ihotel),
    FOREIGN KEY (iuser) REFERENCES user (iuser)
);

CREATE TABLE book_dog (
    ibook INT UNSIGNED,
    idog INT UNSIGNED,
    PRIMARY KEY (ibook, idog),
    FOREIGN KEY (ibook) REFERENCES book_info (ibook),
    FOREIGN KEY (idog) REFERENCES dog_info (idog)
);

CREATE TABLE hotel_review (
    ireview INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    iuser INT UNSIGNED,
    ihotel INT UNSIGNED,
    review_star FLOAT(2, 1),
    review_cnt VARCHAR(100),
    review_regdt DATE DEFAULT NOW(),
    FOREIGN KEY (iuser) REFERENCES user (iuser),
    FOREIGN KEY (ihotel) REFERENCES hotel_info (ihotel)
);

CREATE TABLE review_img (
    ireview INT UNSIGNED,
    review_img VARCHAR(100),
    PRIMARY KEY (ireview, review_img),
    FOREIGN KEY (ireview) REFERENCES hotel_review (ireview)
);

CREATE TABLE like_list (
  ihotel INT UNSIGNED,
  iuser INT UNSIGNED,
  PRIMARY KEY (ihotel, iuser)
);

CREATE TABLE book_dog_service (
    ibds int unsigned PRIMARY KEY,
    ibook int unsigned,
    idog int unsigned,
    iservice INT UNSIGNED,
    ihotel INT UNSIGNED,
    FOREIGN KEY (ibook) REFERENCES book_dog(ibook),
    FOREIGN KEY (idog) REFERENCES book_dog (idog),
    FOREIGN KEY (iservice) REFERENCES hotel_service (iservice),
    FOREIGN KEY (ihotel) REFERENCES hotel_service (ihotel)
);

INSERT INTO dog_breed
    (breed_nm)
    VALUES
    ('골든 리트리버'), ('그레이 하운드'), ('그레이트 덴'), ('그레이트 피레니즈'), ('기타'), ('꼬똥 드 뚤레아'),
    ('네오폴리탄 마스티프'), ('노르포크 테리어'), ('노리치 테리어'), ('뉴펀들랜드'), ('닥스훈트'), ('달마시안'),
    ('댄디 딘몬트 테리어'), ('도고 까나리오'), ('도고 아르젠티노'), ('도베르만'), ('도사'), ('동경견'),
    ('라브라도 리트리버'), ('라사 압소'), ('라이카'), ('래빗 닥스훈드'), ('랫 테리어'), ('레이크랜드 테리어'),
    ('로디지안 리즈백'), ('로트바일러'), ('롯트와일러'), ('마리노이즈'), ('마스티프'), ('말라뮤트'), ('말티즈'),
    ('맨체스터테리어'), ('미니어쳐 닥스훈트'), ('미니어쳐 불 테리어'), ('미니어쳐 슈나우저'), ('미니어쳐 푸들'),
    ('미니어쳐 핀셔'), ('미디엄 푸들'), ('미텔 스피츠'), ('믹스견'), ('바센지'), ('바셋 하운드'), ('버니즈 마운틴 독'),
    ('베들링턴 테리어'), ('벨기에 그로넨달'), ('벨기에 쉽독'), ('벨기에 테뷰런'), ('벨지안 셰퍼드 독'), ('보더 콜리'),
    ('보르조이'), ('보스턴 테리어'), ('복서'), ('볼로네즈'), ('부비에 데 플랑드르'), ('불 테리어'), ('불독'), ('브뤼셀그리펀'),
    ('브리타니 스파니엘'), ('블랙 테리어'), ('비글'), ('비숄 프리제'), ('비어디드 콜리'), ('비즐라'), ('빠삐용'), ('사모예드'),
    ('살루키'), ('삽살개'), ('샤페이'), ('세인트 버나드'), ('센트럴 아시안 오브차카'), ('셔틀랜드 쉽독'), ('셰퍼드'),
    ('슈나우져'), ('스코티쉬 테리어'), ('스코디시 디어하운드'), ('스탠다드 푸들'), ('스테포드셔불테리어'), ('스피츠'), ('시바'),
    ('시베리안 허스키'), ('시베리안라이카'), ('시잉프랑세즈'), ('시츄'), ('시코쿠'), ('실리햄 테리어'), ('실키테리어'),
    ('아나톨리안 셰퍼드'), ('아메리칸 불독'), ('아메리칸 스태퍼드셔 테리어'), ('아메리칸 아키다'), ('아메리칸 에스키모'),
    ('아메리탄 코카 스파니엘'), ('아메리칸 핏불 테리어'), ('아메리칸불리'), ('아이리쉬 레드 앤 화이트 세터'), ('아이리쉬 세터'),
    ('아이리쉬 울프 하운드'), ('아이리쉬소프트코튼휘튼테리어'), ('아키다'), ('아프간 하운드'), ('알라스칸 말라뮤트'), ('에어델 테리어'),
    ('오브차카'), ('오스트랄리안 셰퍼드 독'), ('오스트랄리안 캐틀 독'), ('올드 잉글리쉬 불독'), ('올드 잉글리쉬 쉽독'), ('와이마라너'),
    ('와이어 폭스 테리어'), ('요크셔 테리어'), ('울프독'), ('웨스턴 시베리언 라이카'), ('웨스턴하이랜드화이트테리어'), ('웰시 코기 카디건'),
    ('웰시 코기 펨브로크'), ('웰시 테리어'), ('이탈리안 그레이 하운드'), ('잉글리쉬 세터'), ('잉글리쉬 스프링거 스파니엘'), ('잉글리쉬 코카 스파니엘'),
    ('잉글리쉬 포인터'), ('자이언트 슈나우져'), ('재패니즈 스피츠'), ('잭 러셀 테리어'), ('저먼 셰퍼드 독'), ('저먼 와이어헤어드 포인터'),
    ('저먼 포인터'), ('제주개'), ('제페니즈칭'), ('진도견'), ('차우차우'), ('차이니즈 크레스티드 독'), ('치와와'), ('카레리안 베어독'),
    ('카이훗'), ('캐벌리어 킹 찰스 스파니엘'), ('케니스펜더'), ('케리 블루 테리어'), ('케언 테리어'), ('케인 코르소'), ('코리아 트라이 하운드'),
    ('코리안 마스티프'), ('코카 스파니엘'), ('코카 푸'), ('코카시안오브차카'), ('콜리'), ('클라인스피츠'), ('키슈'), ('키스 훈드'),
    ('토이 맨체스터 테리어'), ('토이 푸들'), ('티베탄 마스티프'), ('파라오 하운드'), ('파슨 러셀 테리어'), ('팔렌'), ('퍼그'), ('페키니즈'),
    ('페터데일테리어'), ('포메라니안'), ('포인터'), ('폭스테리어'), ('푸들'), ('풀리'), ('풍산견'), ('프레사까나리오'), ('프렌치 불독'),
    ('프렌치 브리타니'), ('플랫 코티드 리트리버'), ('플롯하운드'), ('피레니안 마운틴 독'), ('필라 브라질레오'), ('핏불테리어'), ('허배너스'),
    ('화이트이트리버'), ('화이트테리어'), ('훼펫');