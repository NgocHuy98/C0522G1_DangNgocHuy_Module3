select khach_hang.ma_khach_hang,khach_hang.ho_ten, count(hop_dong.ma_khach_hang) as so_lan_dat_hang
-- --as là do mình tạo ta một cột hiển thị;
from khach_hang join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
-- tạo khớp nối giữa hai bảng
where khach_hang.ma_loai_khach = 1
-- loại khách hàng pahir là Diamond
group by ho_ten
-- loại bỏ những tên trùng lặp
order by so_lan_dat_hang;
-- sắp xếp theo số lần đặt hàng