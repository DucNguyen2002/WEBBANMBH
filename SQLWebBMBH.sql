CREATE TABLE tblNguoiDung (
    MaNguoiDung INT PRIMARY KEY IDENTITY(1,1),
    HoTen NVARCHAR(50),
    Email NVARCHAR(150),
    SoDienThoai NVARCHAR(20),
    DiaChi NVARCHAR(200),
    MatKhau NVARCHAR(32),
    MaVaiTro INT,
);

CREATE TABLE tblDanhMuc (
    MaDanhMuc INT PRIMARY KEY IDENTITY(1,1),
    Ten NVARCHAR(100)
);

CREATE TABLE tblSanPham (
    MaSanPham INT PRIMARY KEY IDENTITY(1,1),
    MaDanhMuc INT,
    Ten NVARCHAR(250),
    Gia INT,
	Anh NVARCHAR(MAX),
    GiamGia INT,
    MoTa NVARCHAR(MAX),
	SoLuong INT
    FOREIGN KEY (MaDanhMuc) REFERENCES tblDanhMuc(MaDanhMuc),
);

CREATE TABLE tblPhanHoi (
    MaPhanHoi INT PRIMARY KEY IDENTITY(1,1),
    HoTenDau NVARCHAR(30),
    HoTenCuoi NVARCHAR(30),
    Email NVARCHAR(250),
    SoDienThoai NVARCHAR(20),
    ChuDe NVARCHAR(350),
    GhiChu NVARCHAR(1000),
    TrangThai INT DEFAULT 0
);

CREATE TABLE tblDonHang (
    MaDonHang INT PRIMARY KEY IDENTITY(1,1),
    MaNguoiDung INT,
    HoTen NVARCHAR(50),
    Email NVARCHAR(150),
    SoDienThoai NVARCHAR(20),
    DiaChi NVARCHAR(200),
    GhiChu NVARCHAR(1000),
    NgayDatHang DATETIME,
    TrangThai INT,
    FOREIGN KEY (MaNguoiDung) REFERENCES tblNguoiDung(MaNguoiDung)
);

CREATE TABLE tblChiTietDonHang (
    MaChiTiet INT PRIMARY KEY IDENTITY(1,1),
    MaDonHang INT,
    MaSanPham INT,
    Gia INT,
    SoLuong INT,
    FOREIGN KEY (MaDonHang) REFERENCES tblDonHang(MaDonHang),
    FOREIGN KEY (MaSanPham) REFERENCES tblSanPham(MaSanPham)
);

CREATE TABLE tblChiTietGioHang (
    MaChiTietGH INT PRIMARY KEY IDENTITY(1,1),
    MaNguoiDung INT,
    MaSanPham INT,
    SoLuong INT,
    FOREIGN KEY (MaSanPham) REFERENCES tblSanPham(MaSanPham)
);

ALTER TABLE tblChiTietGioHang
add FOREIGN KEY (MaNguoiDung) REFERENCES tblNguoiDung(MaNguoiDung)


INSERT INTO tblNguoiDung (HoTen, Email, SoDienThoai, DiaChi, MatKhau, MaVaiTro)
VALUES 
  (N'Nguyễn Văn Đức', 'admin@gmail.com', '0335366596', N'Hà Nội', '123123', 1),
  (N'Cao Thị Diễm', 'khach@gmail.com', '0987654321', N'TP.Hồ Chí Minh', '123123', 2);

INSERT INTO tblDanhMuc (Ten)
VALUES 
  (N'Mũ bảo hiểm 1/2'),
  (N'Mũ bảo hiểm 3/4');

-- Tạo dữ liệu cho bảng sản phẩm
INSERT INTO tblSanPham (MaDanhMuc, Ten, Gia,Anh, GiamGia, MoTa,SoLuong)
VALUES 
  (1, N'Mũ bảo hiểm 1/2 Andes', 250000, 'mk5.jpg', 10, N'Mũ bảo hiểm 1/2 Andes có thiết kế đơn giản, nhẹ nhàng, phù hợp với nhiều loại xe máy. Mũ có nhiều màu sắc để bạn lựa chọn.',3),
  (2, N'Mũ bảo hiểm 3/4 Royal', 350000, 'mk5.jpg', 15, N'Mũ bảo hiểm 3/4 Royal có thiết kế sang trọng, chắc chắn, bảo vệ tốt cho đầu. Mũ có kính chắn gió, chống nắng, chống bụi.',4),
  (1, N'Mũ bảo hiểm 1/2 Casco', 300000, 'mk6.jpg', 20, N'Mũ bảo hiểm 1/2 Casco có thiết kế thời trang, năng động, phù hợp với giới trẻ. Mũ có lớp lót êm ái, thoáng khí, dễ vệ sinh.',5)

  select * from tblChiTietDonHang
  select * from tblDonHang

  select * from tblDanhMuc
  select * from tblNguoiDung
  select * from tblPhanHoi
  select * from tblSanPham
