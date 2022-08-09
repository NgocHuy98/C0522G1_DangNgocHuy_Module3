drop database if exists chuyen_doi_erd;
create database chuyen_doi_erd;

use chuyen_doi_erd;

create table nha_cc(
ma_ncc int primary key,
ten_ncc varchar (50) not null,
dia_chi varchar(50)
);

create table chi_tiet_sdt(
sdt varchar(10),
primary key(sdt),
ma_ncc int,
foreign key(ma_ncc) references nha_cc(ma_ncc)
);


create table don_dh(
so_dh int primary key,
ngay_dh date,
ma_ncc int,
foreign key(ma_ncc) references nha_cc(ma_ncc)
);

create table vat_tu(
ma_vtu int primary key,
ten_vtu varchar(50) not null
);

create table chi_tiet_don_dat_hang(
so_dh int,
ma_vtu int,
primary key(so_dh,ma_vtu),
foreign key(so_dh) references don_dh(so_dh),
foreign key(ma_vtu) references vat_tu(ma_vtu)
);

create table phieu_xuat(
so_px int primary key,
ngay_xuat date
);

create table chi_tiet_xuat(
dg_xuat double,
sl_xuat int,
so_px int,
ma_vtu int,
primary key(so_px,ma_vtu),
foreign key(so_px) references phieu_xuat(so_px),
foreign key(ma_vtu) references vat_tu(ma_vtu)
);

create table phieu_nhap(
so_pn int primary key,
ngay_nhap date
);

create table chi_tiet_nhap(
so_pn int,
ma_vtu int,
dg_nhap double,
sl_nhap int,
primary key (so_pn, ma_vtu),
foreign key(so_pn) references phieu_nhap(so_pn),
foreign key(ma_vtu) references vat_tu(ma_vtu)
);








