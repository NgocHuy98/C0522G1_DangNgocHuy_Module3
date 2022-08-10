USE  quan_ly_sinh_vien;

select * from student;
select * from student where student_name like 'H%';
select * from class where month(class.start_date) = 12;
select * from subject where credit>=3 and credit<=5;

SET SQL_SAFE_UPDATES = 0;
update student 
set class_id = 2 
where student_name ='Hung';
select c.class_id, s.student_name 
from class c join student s
on c.class_id=s.class_id;

select s.student_name, sb.sub_name, m.mark 
from mark m
join student s on s.student_id=m.student_id
join subject sb on sb.sub_id = m.sub_id
order by m.mark desc, s.student_name;

