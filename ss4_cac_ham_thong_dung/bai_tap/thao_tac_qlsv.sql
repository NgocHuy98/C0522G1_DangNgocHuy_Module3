use quan_ly_sinh_vien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * 
from subject s
where s.credit = (select max(credit)from subject);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select *
from subject s
join mark m on s.sub_id = m.sub_id
where m.mark = (select max(mark)from mark);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, 
-- xếp hạng theo thứ tự điểm giảm dần
select s.student_id,s.student_name, avg(m.mark) from mark m
join student s on s.student_id = m.mark_id
group by student_name
order by m.mark desc;