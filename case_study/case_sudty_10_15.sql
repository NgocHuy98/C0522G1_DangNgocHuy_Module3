use case_study;
-- Câu 11
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
from dich_vu_di_kem dvdk
 join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
 join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
 join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
 join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where 
((kh.dia_chi like '%Vinh' or kh.dia_chi like '%Quảng Ngãi')
and lk.ten_loai_khach = 'Diamond')
group by dvdk.ten_dich_vu_di_kem;

-- Câu 12
select nv.ma_nhan_vien,
 nv.ho_ten as ho_ten_nhan_vien, 
 kh.ho_ten as ho_ten_khach_hang,
 kh.so_dien_thoai, dv.ten_dich_vu, 
 dv.ma_dich_vu,
 sum(hdct.so_luong) as so_luong_dich_vu_di_kem,
 
hd.tien_dat_coc
from hop_dong hd
left join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
left join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
where year(hd.ngay_lam_hop_dong)=2020 
and month(hd.ngay_lam_hop_dong) between 10 and 12
and hd.ma_hop_dong not in (
select hd.ma_hop_dong 
from hop_dong hd
where year(hd.ngay_lam_hop_dong)=2021 
and month(hd.ngay_lam_hop_dong) between 1 and 6)
group by hd.ma_hop_dong;

-- Câu 14
select hop_dong.ma_hop_dong,dich_vu.ten_dich_vu, dich_vu_di_kem.ten_dich_vu_di_kem ,sum(hop_dong_chi_tiet.so_luong) as so_luong_su_dung
from hop_dong_chi_tiet
join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
join hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
group by hop_dong_chi_tiet.ma_dich_vu_di_kem
having so_luong_su_dung = 1;
