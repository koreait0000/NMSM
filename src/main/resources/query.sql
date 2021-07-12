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
  d_type INT UNSIGNED NOT NULL comment '0 : 소형견, 1 : 중형견, 2 : 대형견',
  breed_pk INT UNSIGNED NOT NULL,
  d_age INT UNSIGNED NOT NULL,
  d_nm VARCHAR(10) NOT NULL,
  d_weight FLOAT(4, 2) NOT NULL,
  d_gender TINYINT(1) UNSIGNED NOT NULL,
  d_regNum INT(12) comment '강아지 등록 번호',
  d_neuter TINYINT(1) UNSIGNED NOT NULL comment '0 : 중성화 했음, 1 : 중성화 안했음',
  FOREIGN KEY (iuser) REFERENCES user (iuser),
  FOREIGN KEY (breed_pk) REFERENCES dog_breed (breed_pk)
); -- 관련 설명 comment 필요


CREATE TABLE hotel_info (
    ihotel INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    iuser INT UNSIGNED,
    h_acceptable INT UNSIGNED NOT NULL,
    h_location VARCHAR(10) NOT NULL,
    h_address VARCHAR(50) NOT NULL,
    h_price INT UNSIGNED NOT NULL,
    mapX decimal(20, 16) NOT NULL,
    mapY double(20, 16) NOT NULL,
    h_preDetail VARCHAR(100) NOT NULL comment '리스트에서 미리 볼 수 있는 설명',
    h_detail VARCHAR(500) NOT NULL,
    h_tel VARCHAR(11) NOT NULL,
    h_service INT,
    FOREIGN KEY (iuser) REFERENCES user (iuser)
);

CREATE TABLE hotel_img (
    ihotel INT UNSIGNED,
    h_img VARCHAR(100) NOT NULL,
    PRIMARY KEY (ihotel, h_img)
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
    PRIMARY KEY (ibook, idog)
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
    PRIMARY KEY (ireview, review_img)
);

CREATE TABLE like_list (
  ihotel INT UNSIGNED,
  iuser INT UNSIGNED,
  PRIMARY KEY (ihotel, iuser)
);