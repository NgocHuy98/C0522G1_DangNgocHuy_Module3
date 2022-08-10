use quan_ly_ban_hang;

insert into customer (c_id, c_name, c_age) values
(1,'Minh Quan', 10),
(2,'Ngoc oanh', 20),
(3,'Hong Ha', 50);

insert into order_product (o_id, c_id, o_date, o_total_price) values
(1,1,'2006-03-26',null),
(2,2,'2006-03-21',null),
(3,1,'2006-03-09',null);

insert into product(p_id, p_name, p_price) values
(1,'May Giat',3),
(2,'Tu Lanh',5),
(3,'Dieu Hoa',7),
(4,'Quat',1),
(5,'Bep Dien',2);

insert into order_detail (o_id, p_id, od_qty) values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);
-- Hiển thị các thông tin  gồm oID, oDate, 
-- oPrice của tất cả các hóa đơn trong bảng Order
select op.o_id, op.o_date, op.o_total_price
from order_product op;
-- Hiển thị danh sách các khách hàng đã mua hàng,
--  và danh sách sản phẩm được mua bởi các khách

select c.c_id, c.c_name, c.c_age, p.p_name
from customer c 
join order_product op on c.c_id= op.c_id
join order_detail od on op.o_id = od.o_id
join product p on p.p_id= od.p_id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.c_id, c.c_name, c.c_age
from customer c
where c.c_id not in(select c.c_id
from customer c 
join order_product op on c.c_id= op.c_id
join order_detail od on op.o_id = od.o_id
join product p on p.p_id= od.p_id
);
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại
--  mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)

select op.o_id, op.o_date as date_pay, 
sum((ifnull(od.od_qty,0)* ifnull(p.p_price,0))) as bill_order
from order_product op
join order_detail od on op.o_id = od.o_id
join product p on p.p_id = od.p_id
group by op.o_id;