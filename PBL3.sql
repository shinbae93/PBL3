CREATE TABLE Khoa
(
	MaKhoa varchar(20) not null primary key,
	TenKhoa nvarchar(30) not null
)

CREATE TABLE Nganh
(
	MaNganh varchar(20) not null primary key,
	TenNganh nvarchar(30) not null,
	MaKhoa varchar(20) not null,
	constraint fk_nganh_makhoa
		foreign key(MaKhoa) references Khoa(MaKhoa)
)

CREATE TABLE Lop
(
	MaLop varchar(20) not null primary key,
	TenLop nvarchar(30) not null,
	MaNganh varchar(20) not null,
	constraint fk_lop_manganh
		foreign key(MaNganh) references Nganh(MaNganh)
)

CREATE TABLE QuyenHan
(
	ID_QuyenHan varchar(20) not null primary key,
	TenQuyenHan nvarchar(50) not null
)

CREATE TABLE DocGia
(
	MaDocGia varchar(20) not null primary key,
	CMND char(9) not null,
	HoTen nvarchar(40) not null,
	NgaySinh date,
	GioiTinh bit,
	MaLop varchar(20) not null,
	NgayDK date not null,
	constraint fk_docgia_malop
		foreign key(MaLop) references Lop(MaLop)
)

CREATE TABLE NguoiDung
(
	ID varchar(20) not null primary key,
	Username varchar(30) not null,
	Password varchar(20) not null,
	HoTen nvarchar(40) not null,
	NgaySinh date,
	GioiTinh bit,
	ChucDanh nvarchar(50),
	DienThoai char(10),
	Email varchar(100),
	ID_QuyenHan varchar(20) not null,
	constraint fk_nguoidung_idquyenhan
		foreign key(ID_QuyenHan) references QuyenHan(ID_QuyenHan)
)

CREATE TABLE PhieuMuon
(
	MaPhieuMuon int not null primary key,
	ID varchar(20) not null,
	MaDocGia varchar(20) not null,
	NgayMuon date not null,
	HanTra date not null,
	NgayTra date,
	ViPham nvarchar(30),
	constraint fk_phieumuon_id
		foreign key(ID) references NguoiDung(ID),
	constraint fk_phieumuon_madocia
		foreign key(MaDocGia) references DocGia(MaDocGia)
)

CREATE TABLE Tang
(
	MaTang varchar(20) not null primary key,
	SoTang int not null
)

CREATE TABLE KeSach
(
	MaKeSach varchar(20) not null primary key,
	TenKeSach nvarchar(50) not null,
	SoLuongSach int default(0),
	MaTang varchar(20) not null,
	constraint fk_kesach_matang
		foreign key(MaTang) references Tang(MaTang)
)

CREATE TABLE NgonNgu
(
	MaNgonNgu varchar(20) not null primary key,
	TenNgonNgu nvarchar(30) not null
)

CREATE TABLE TacGia
(
	MaTacGia varchar(20) not null primary key,
	TenTacGia nvarchar(50) not null
)

CREATE TABLE TaiLieu
(
	MaTL varchar(20) not null primary key,
	TenTL nvarchar(100) not null,
	MaKeSach varchar(20) not null,
	MaNgonNgu varchar(20) not null,
	MaTacGia varchar(20) not null,
	NamXuatBan date not null,
	NgayCN date not null,
	constraint fk_tl_makesach
		foreign key(MaKeSach) references KeSach(MaKeSach),
	constraint fk_tl_mangonngu
		foreign key(MaNgonNgu) references NgonNgu(MaNgonNgu),
	constraint fk_tl_matacgia
		foreign key(MaTacGia) references TacGia(MaTacGia)
)

CREATE TABLE CuonTaiLieu
(
	MaVach varchar(20) not null primary key,
	MaTL varchar(20) not null,
	constraint fk_cuontl_matl
		foreign key(MaTL) references TaiLieu(MaTL)
)

CREATE TABLE LoaiTaiLieu
(
	MaLTT varchar(20) not null primary key,
	MaTL varchar(20) not null,
	TenLoai nvarchar(30) not null,
	SoLuong int default(0),
	constraint fk_ltt_matl
		foreign key(MaTL) references TaiLieu(MaTL)
)

CREATE TABLE TaiLieuCT
(
	MaPhieuMuon int not null,
	MaTL varchar(20) not null,
	NgayCN date,
	TinhTrang nvarchar(50),
	constraint fk_tlct_mavach
		foreign key(MaTL) references TaiLieu(MaTL),
	constraint fk_tlct_maphieumuon
		foreign key(MaPhieuMuon) references PhieuMuon(MaPhieuMuon)
)
