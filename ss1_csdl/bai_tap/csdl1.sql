create database if not  exists `student-management` ;
create table class(
id int not null,
`name` varchar(45)
);
create table teacher(
id int not null,
`name` varchar(45),
age int ,
country varchar(45)
);

insert into class(id, `name`) values (1,'huy');
insert into class(id, `name`) values (2,'huyen');

insert into teacher values (1,'huy hoang',17,'canada'),
                           (2,'john',18,'brazil'),
                           (3,'jack',15,'italya'),
						   (4,'faker',26,'korea'),
						   (5,'ronaldo',35,'japan'),
						   (6,'jame',36,'japan');

select * from class;
select * from teacher; 
SET SQL_SAFE_UPDATES = 0;
update class set `name` ='hoang' where id =1;
update class set `name` ='tien' where id =2;
update teacher set `name` = 'huy' where id=3; 
delete from teacher where `name` ='faker';
delete from teacher where `name` ='ronaldo';
alter table teacher add column `point` int;
alter table teacher drop column `point`;	