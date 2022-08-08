drop database if exists case_study; 
create database case_study;

use case_study;
create table vi_tri(
ma_vi_tri int,
ten_vi_tri varchar(45),
primary key (ma_vi_tri)
);
create table trinh_do(
ma_trinh_do int,
ten_trinh_do varchar(45),
primary key (ma_trinh_do)
);
create table bo_phan(
ma_bo_phan int,
ten_bo_phan varchar(45),
primary key (ma_bo_phan)
);
create table nhan_vien(
ma_nhan_vien int,
ho_ten varchar(45),
ngay_sinh date,
so_cmnd varchar(45),
luong double,
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int,
ma_trinh_do int,
ma_bo_phan int,
primary key (ma_nhan_vien)
);

create table loai_khach(
ma_loai_khach int,
ten_loai_khach varchar(45),
primary key (ma_loai_khach)
);
create table khach_hang(
ma_khach_hang int,
ma_loai_khach int,
ho_ten varchar(45),
ngay_sinh date,
gioi_tinh bit,
so_cmnd varchar(45),
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
primary key ( ma_khach_hang)
);

create table loai_dich_vu(
ma_loai_dich_vu int,
ten_loai_dich_vu varchar(45),
primary key (ma_loai_dich_vu)
);
create table kieu_thue(
ma_kieu_thue int,
ten_kieu_thue varchar(45),
primary key (ma_kieu_thue)
);

create table dich_vu(
ma_dich_vu int,
ten_dich_vu varchar(45),
dien_tich int,
chi_phi_thue double,
so_nguoi_toi_da int,
ma_kieu_thue int,
ma_loai_dich_vu int,
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int,
dich_vu_mien_phi_di_kem text,
primary key (ma_dich_vu)
);

create table dich_vu_di_kem(
ma_dich_vu_di_kem int,
ten_dich_vu_di_kem varchar(45),
gia double,
don_vi varchar(10),
trang_thai varchar(45),
primary key (ma_dich_vu_di_kem)
);
create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int,
ma_hop_dong int,
ma_dich_vu_di_kem int,
so_luong int,
primary key (ma_hop_dong_chi_tiet)
);
create table hop_dong(
ma_hop_dong int,
ngay_lam_hop_dong datetime,
ngay_ket_thuc datetime,
tien_dat_coc double,
ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int,
primary key (ma_hop_dong)
);

alter table nhan_vien add foreign key (ma_vi_tri) references vi_tri(ma_vi_tri);
alter table nhan_vien add foreign key (ma_trinh_do) references trinh_do(ma_trinh_do);
alter table nhan_vien add foreign key (ma_bo_phan) references bo_phan(ma_bo_phan);
alter table khach_hang add foreign key (ma_loai_khach) references loai_khach(ma_loai_khach);
alter table dich_vu add foreign key (ma_kieu_thue) references kieu_thue(ma_kieu_thue);
alter table dich_vu add foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu);
alter table hop_dong_chi_tiet add foreign key (ma_hop_dong) references hop_dong(ma_hop_dong);
alter table hop_dong_chi_tiet add foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem);
alter table hop_dong add foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien);
alter table hop_dong add foreign key (ma_khach_hang) references khach_hang(ma_khach_hang);
alter table hop_dong add foreign key (ma_dich_vu) references dich_vu(ma_dich_vu);

-- INSERT INTO `case_study`.`vi_tri` (`ma_vi_tri`, `ten_vi_tri`) VALUES ('1', 'Quản Lý');
-- INSERT INTO `case_study`.`vi_tri` (`ma_vi_tri`, `ten_vi_tri`) VALUES ('2', 'Nhân Viên');

insert into vitri(ma_vi_tri,ten_vi_tri) values 
('1', 'Quản Lý'),
('2', 'Nhân Viên');
insert into trinh_do(ma_trinh_do,ten_trinh_do) values
 ('1', 'Trung Cấp'),
 ('2', 'Cao Đẳng'),
 ('3', 'Đại Học'),
 ('4', 'Sau Đại Học');
 insert into bo_phan(ma_bo_phan,ten_bo_phan) values
('1', 'Sale-Marketing'),
('2', 'Hành chính'),
('3', 'Phục vụ'),
('4', 'Quản lý');
insert into nhan_vien(ma_nhan_vien,ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email,	dia_chi,ma_vi_tri, ma_trinh_do,	ma_bo_phan) values
('1', 'Nguyễn Văn An', '1970-11-07', '456231786', '10000000', '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', '1', '3', '1'),
('2', 'Lê Văn Bình', '1997-04-09', '654231234', '7000000', '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', '1', '2', '2'),
('3', 'Hồ Thị Yến', '1995-12-12', '999231723', '14000000', '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', '1', '3', '2'),
('4', 'Võ Công Toản', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', '1', '4', '4'),
('5', 'Nguyễn Bỉnh Phát', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', '2', '1', '1'),
('6', 'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', '2', '2', '3'),
('7', 'Nguyễn Hữu Hà', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', '2', '3', '2'),
('8', 'Nguyễn Hà Đông', '1989-09-03', '234414123', '9000000', '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', '2', '4', '4'),
('9', 'Tòng Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', '2', '4', '4'),
('10', 'Nguyễn Công Đạo', '1994-01-08', '755434343', '8000000', '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', '2', '3', '2');
insert into loai_khach(ma_loai_khach, ten_loai_khach) values
('1', 'Diamond'),
('2', 'Platinium'),
('3', 'Gold'),
('4', 'Silver'),
('5', 'Member');
-- insert into khach_hang(ma_khach_hang, ho_ten, ngay_sinh, gioi_tinh,	so_cmnd, so_dien_thoai,	email, dia_chi,	ma_loai_khach) values 
-- (b'1', b'Nguyễn Thị Hào', b'1970-11-07',b '0', b'643431213', b'0945423362', b'thihao07@gmail.com', b'23 Nguyễn Hoàng, Đà Nẵng', b'5'),
-- (b'2', b'Phạm Xuân Diệu', b'1992-08-08', b'1', b'865342123', b'0954333333', b'xuandieu92@gmail.com', b'K77/22 Thái Phiên, Quảng Trị', b'3'),
-- (b'3', b'Trương Đình Nghệ', b'1990-02-27', b'1', b'488645199', b'0373213122', b'nghenhan2702@gmail.com', b'K323/12 Ông Ích Khiêm, Vinh', b'1'),
-- (b'4', b'Dương Văn Quan', b'1981-07-08', b'1', b'543432111', b'0490039241', b'duongquan@gmail.com', b'K453/12 Lê Lợi, Đà Nẵng', b'1'),
-- (b'5', b'Hoàng Trần Nhi Nhi', b'1995-12-09', b'0', b'795453345', b'0312345678', b'nhinhi123@gmail.com', b'224 Lý Thái Tổ, Gia Lai', b'4'),
-- (b'6', b'Tôn Nữ Mộc Châu', b'2005-12-06', b'0', b'732434215', b'0988888844', b'tonnuchau@gmail.com', b'37 Yên Thế, Đà Nẵng', b'4'),
-- (b'7', b'Nguyễn Mỹ Kim', b'1984-04-08', b'0', b'856453123', b'0912345698', b'kimcuong84@gmail.com', b'K123/45 Lê Lợi, Hồ Chí Minh', b'1'),
-- (b'8', b'Nguyễn Thị Hào', b'1999-04-08', b'0', b'965656433', b'0763212345', b'haohao99@gmail.com', b'55 Nguyễn Văn Linh, Kon Tum', b'3'),
-- (b'9', b'Trần Đại Danh', b'1994-07-01', b'1', b'432341235', b'0643343433', b'danhhai99@gmail.com', b'24 Lý Thường Kiệt, Quảng Ngãi', b'1'),
-- (b'10', b'Nguyễn Tâm Đắc', b'1989-07-01', b'1', b'344343432', b'0987654321', b'dactam@gmail.com', b'22 Ngô Quyền, Đà Nẵng', b'2');


