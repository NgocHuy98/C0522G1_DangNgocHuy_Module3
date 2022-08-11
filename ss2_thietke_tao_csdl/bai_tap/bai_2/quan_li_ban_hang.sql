drop database if exists quan_ly_ban_hang;
create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer(
c_id int primary key ,
c_name varchar(25) ,
c_age tinyint
);

create table order_product(
o_id int primary key,
c_id int not null,
o_date datetime,
o_total_price int,
foreign key (c_id) references customer(c_id)
);

create table product(
p_id int primary key,
p_name varchar(25),
p_price int
);

create table order_detail(
o_id int,
p_id int,
od_qty int,
primary key(o_id, p_id),
foreign key(o_id) references order_product(o_id),
foreign key(p_id) references product(p_id)
);