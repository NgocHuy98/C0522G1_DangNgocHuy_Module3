create database user_jdbc;
use user_jdbc;
create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);
insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');
insert into users(name, email, country) values('Tý','Tyngao@che.uk','Isarel');
insert into users(name, email, country) values('Phúc','PhucDu@c123.com','Mong Co');
insert into users(name, email, country) values('Hùng','HungDo@c123.com','Ai Cập');
select*from users;

delimiter //
create procedure sp_view_list_user()
begin 
select *
from users;
end //
delimiter ;
call sp_view_list_user();

create delimiter //
create procedure sp_update_users(p_id int, p_name varchar(50),p_email varchar(50), p_country varchar(50) )
begin 
update users set
id = p_id,
name = p_name,
email=p_email,
country=p_country
where id = p_id;
end //
delimiter ;
call sp_update_users(1,'Trí','Tri88@c123.com','Mong Co');



delimiter //
create procedure sp_delete_users_by_id( p_id int)
begin 
delete from users where id = p_id;
end //
delimiter ;
call sp_delete_users_by_id(1);

delimiter //
create procedure sp_select_country(in p_country varchar(50))
begin 
select* from users where users.country=p_country;
end //
delimiter ;
drop procedure sp_select_country;
call sp_select_country('Mong Co');

 