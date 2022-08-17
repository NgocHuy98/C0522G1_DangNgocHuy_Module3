use case_study;

-- Câu 21 	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả 
-- các nhân viên có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho một hoặc nhiều
--  khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.

create view v_nhan_vien as 
select nv.ma_nhan_vien, nv.ho_ten, nv.dia_chi, hd.ma_hop_dong, hd.ngay_lam_hop_dong from nhan_vien nv
right join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where dia_chi like '%Đà Nẵng' 
and year(hd.ngay_lam_hop_dong) = '2021-04-25';

-- Câu 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với
--  tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
set sql_safe_updates = 0;
update v_nhan_vien 
set dia_chi = 'Liên Chiểu' where ma_nhan_vien =2;

--  Câu 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với
--  ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang
delimiter //
create procedure sp_xoa_khach_hang( p_id int)
begin 
delete from khach_hang where ma_khach_hang = p_id;
end //
delimiter ;
call sp_xoa_khach_hang(1);

-- Câu 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu 
-- sp_them_moi_hop_dong  phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc 
-- không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
 delimiter //
create procedure  sp_them_moi_hop_dong( p_ngay_lam_hop_dong datetime, p_ngay_ket_thuc datetime, p_tien_dat_coc double, p_ma_nhan_vien int, p_ma_khach_hang int, p_ma_dich_vu int  )
begin 
insert into hop_dong (
ngay_lam_hop_dong ,
ngay_ket_thuc ,
tien_dat_coc ,
ma_nhan_vien ,
ma_khach_hang,
 ma_dich_vu)
values ( p_ngay_lam_hop_dong , p_ngay_ket_thuc , p_tien_dat_coc, p_ma_nhan_vien , p_ma_khach_hang, p_ma_dich_vu  );
end //
delimiter ;
call sp_them_moi_hop_dong('2020-08-08', '2020-12-10', 0, '4', '1', '2');
drop procedure sp_them_moi_hop_dong;
-- Câu 25	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì 
-- hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
create table `history`(
id int auto_increment primary key,
ma_hop_dong varchar(50),
old_is_delete int,
new_is_delete int,
delete_day date,
shd_con_lai int
);
drop table `history`;
delimiter //
create trigger tr_xoa_hop_dong
after update on hop_dong
for each row
begin
declare bien_dem int;
select count(ma_hop_dong) into bien_dem from hop_dong where is_delete=1;
insert into `history`(ma_hop_dong, old_is_delete, new_is_delete,delete_day, shd_con_lai)
values(old.ma_hop_dong,old.is_delete, new.is_delete,now(),bien_dem);
end //
delimiter ;
drop trigger tr_xoa_hop_dong;
update hop_dong set is_delete=0
where ma_hop_dong =1;
select * from `history`;