create database product;
use product;
create table products(
id int primary key auto_increment,
product_code varchar(50),
product_name varchar(50),
product_price int,
product_amount int,
product_description varchar(50),
product_status bit
);

insert into products(id, product_code, product_name, product_price, product_amount, product_description, product_status) values 
(1,'22B1', 'Bánh choocolate', 50000, 1000, 'Mềm', 1),
(2,'22K1', 'Kẹo mút', 30000, 1000, 'Cứng', 1),
(3,'22B2', 'Bánh oreo', 30000, 500, 'Giòn', 1),
(4,'22B3', 'Bánh Quế', 20000, 2000, 'Giòn', 0),
(5,'22K2', 'Kẹo dừa', 30000, 1000, 'Cứng', 0),
(6,'22K3', 'Kẹo cao su', 10000, 10000, 'Mềm dẻo', 1);

select * from products;

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
explain select * from products where product_code ='22K2';
create unique index i_product_code on products(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index

alter table products add index i__name_and_gia(product_name, product_price);
explain select * from products where product_name = 'Kẹo mút' and product_price = 30000;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
 create view w_products as
select p.id, p.product_code, p.product_name, p.product_price,p.product_amount ,p.product_description from products p ;

-- Tiến hành sửa đổi view
create or replace view w_products as 
select id, product_code, product_name from products where product_description='Cứng';
select * from w_products;

-- Tiến hành xoá view
drop view w_products ;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure sp_get_all_products()
begin 
select * from products;
end //
delimiter ;
call sp_get_all_products();

-- Tạo store procedure thêm một sản phẩm mới
 delimiter //
create procedure sp_add_product( p_code varchar(50), p_name varchar(50), price int, amount int, des varchar(50), stt bit  )
begin 
insert into products (
product_code ,
product_name ,
product_price ,
product_amount ,
product_description ,
product_status )
values ( p_code , p_name , price, amount , des, stt  );
end //
delimiter ;
call sp_add_product('22B1', 'Bánh quy', 50000, 500, 'Giòn', 1);
select * from products;
drop procedure sp_add_product;

-- Tạo store procedure sửa thông tin sản phẩm theo id
create delimiter //
create procedure sp_update_product(p_id int, p_code varchar(50), p_name varchar(50), price int, amount int, des varchar(50), stt bit  )
begin 
update products set
id = p_id,
product_code = p_code ,
product_name = p_name,
product_price = price,
product_amount = amount,
product_description = des,
product_status = stt
where id = p_id;
end //
delimiter ;
call sp_update_product(3,'22B6', 'Bánh Ốc', 500, 10000, 'Giòn', 1);
select * from products;

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure sp_delete_products_by_id(in p_id int)
begin 
delete from products where id = p_id;
end //
delimiter ;
call sp_delete_products_by_id(1);






