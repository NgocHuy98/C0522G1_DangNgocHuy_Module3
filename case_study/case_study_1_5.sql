use case_study;
-- Câu 4
select kh.ma_khach_hang,kh.ho_ten, count(hd.ma_khach_hang) as so_lan_dat_phong 
from khach_hang kh
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where kh.ma_loai_khach = 1
group by kh.ho_ten
order by so_lan_dat_phong;

-- Câu 5
select kh.ma_khach_hang,
       kh.ho_ten, 
	   lk.ten_loai_khach,
       hd.ma_hop_dong,
       dv.ten_dich_vu,
       hd.ngay_lam_hop_dong,
       hd.ngay_ket_thuc,
       (ifnull(dv.chi_phi_thue,0)
       + ifnull(hdct.so_luong,0)*ifnull(dvdk.gia,0)) as tong_tien
       from khach_hang kh
       join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
       left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
       left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
       left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
       left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
       left join kieu_thue kt on dv.ma_kieu_thue = kt.ma_kieu_thue
group by ma_hop_dong
order by ma_khach_hang;



