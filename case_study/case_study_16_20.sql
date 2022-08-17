use case_study;
set sql_safe_updates = 0;
-- Câu 16 .	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
--  delete from nhan_vien where ma_nhan_vien in(
select ma_nhan_vien, ho_ten
 from nhan_vien
where ma_nhan_vien not in
(select ma_nhan_vien from hop_dong
where year(ngay_lam_hop_dong) between 2019 and 2021 group by ma_nhan_vien);
select * from nhan_vien;

-- Câu 17 .	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
set sql_safe_updates = 0;
update khach_hang 
set ma_loai_khach = 1
where ma_khach_hang in (select ma_khach_hang from v_ma_khach_hang);
 create  view v_ma_khach_hang as select kh.ma_khach_hang,
kh.ho_ten,
lk.ma_loai_khach,
lk.ten_loai_khach,
sum((ifnull(dv.chi_phi_thue,0) * datediff(hd.ngay_ket_thuc, hd.ngay_lam_hop_dong))
+ ifnull(hdct.so_luong,0)* ifnull(dvdk.gia,0)) as tong_tien
from khach_hang kh
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on  dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
 where lk.ma_loai_khach = 2
group by ma_khach_hang
having  tong_tien  > 1000000;

-- Câu 18 	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
-- delete
select kh.ma_khach_hang, kh.ho_ten
from khach_hang kh
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where  year(hd.ngay_lam_hop_dong) <2021;

-- Câu 19 .	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem 
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
where (hdct.so_luong >10)  and  year(hd.ngay_lam_hop_dong) = 2020;

-- Câu 20 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
--  thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select nv.ma_nhan_vien as id,  nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi from nhan_vien nv
 union 
select kh.ma_khach_hang as id,  kh.ho_ten, kh.email, kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi from khach_hang kh;

