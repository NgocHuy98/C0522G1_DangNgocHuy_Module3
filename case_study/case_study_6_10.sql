use case_study;

-- Câu 6
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
left join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
left join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where hd.ma_dich_vu  not in (
select hd.ma_dich_vu
from hop_dong hd
where
 -- (year(hd.ngay_lam_hop_dong)=2021 )and 
-- (month(hd.ngay_lam_hop_dong) in (1,2,3)))
hd.ngay_lam_hop_dong >= '2021-01-01 00:00:00' and
hd.ngay_lam_hop_dong < '2021-04-01 00:00:00' )
group by hd.ma_dich_vu
order by dien_tich desc;

  
  -- Câu  7
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu	
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
left join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where (ngay_lam_hop_dong >= '2020-01-01 00:00:00' 
and ngay_lam_hop_dong < '2021-01-01 00:00:00') 
and hd.ma_dich_vu not in 
(select hd.ma_dich_vu 
from hop_dong hd
where (hd.ngay_lam_hop_dong >= '2021-01-01 00:00:00' ))
group by dv.ma_dich_vu;

-- Câu 8
select kh.ho_ten from khach_hang kh
where kh.ma_khach_hang = 1;
-- group by kh.ho_ten
-- select ho_ten from khach_hang
-- union 
-- select ho_ten from khach_hang

 


-- Câu 9
select month(ngay_lam_hop_dong) as thang, count(ma_khach_hang) as so_lan_dat
from hop_dong
where year(ngay_lam_hop_dong) =2021
group by thang
order by thang;

-- Câu 10
select hd.ma_hop_dong,
 hd.ngay_lam_hop_dong,
 hd.ngay_ket_thuc,
 hd.tien_dat_coc, 
ifnull(sum(hdct.so_luong),0) as so_luong_dich_vu_di_kem
from hop_dong hd
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
group by hd.ma_hop_dong;

