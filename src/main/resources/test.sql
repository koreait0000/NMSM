use nmsm;

select hinfo.*
from hotel_info hinfo
where hinfo.ihotel in
      (select ihotel from like_list
       where iuser = 1);

insert into hotel_info
(ihotel, iuser, h_name, h_capacity, h_location, h_address, h_price, mapX, mapY, h_preDetail, h_detail, h_tel,h_star)
    value
    (1,1,'노르멍쉬멍',10,'우리집','우리집 안방','3000',35.868116,128.601590,'여기는 노르멍쉬멍입니다. 노르멍쉬멍 쉬르멍놀멍', '3000년 역사의 노르멍 쉬르멍에 어서 노르멍 쉬르멍','01000000000',5);

insert into hotel_img
(ihotel, h_img)
values
    (1,'/image/1-1.jpg');

insert into like_list
(ihotel, iuser)
    value
    (1,1);

insert into hotel_service
(s_price, ihotel, iservice)
values
    (10000,1,1),
    (15000,1,2),
    (20000,1,3);

select hser.*, ser.s_nm
from hotel_service hser
         left join service ser
                   on hser.iservice = ser.iservice
where hser.ihotel = 1;
select *
from hotel_info
where ihotel in
      (select ihotel from like_list
       where iuser = 1);