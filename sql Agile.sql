DROP DATABASE QLBH
GO
CREATE DATABASE QLBH

IF OBJECT_ID ('KHACHHANG') IS NOT NULL
DROP TABLE KHACHHANG
GO
CREATE TABLE KHACHHANG
(
IDKH VARCHAR(10) PRIMARY KEY,
HOTEN NVARCHAR(30) NOT NULL,
SDT INT NOT NULL,
DIACHI NVARCHAR(50) NOT NULL
)

IF OBJECT_ID ('SANPHAM') IS NOT NULL
DROP TABLE SANPHAM
GO
CREATE TABLE SANPHAM
(
IDSanPham VARCHAR(10) PRIMARY KEY,
TEN NVARCHAR(30) NOT NULL,
GIANHAP MONEY NOT NULL,
SLNHAP INT NOT NULL
)

IF OBJECT_ID ('PHIEUMUA') IS NOT NULL
DROP TABLE PHIEUMUA
GO
CREATE TABLE PHIEUMUA
(
IDPHIEUMUA VARCHAR(10) PRIMARY KEY,
IDKH VARCHAR(10) NOT NULL,
IDSanPham VARCHAR(10) NOT NULL,
NGAYMUA DATETIME NOT NULL,
TRANGTHAI NVARCHAR NOT NULL,
CONSTRAINT FK_PHIEUMUA_SANPHAM FOREIGN KEY(IDSanPham) REFERENCES SANPHAM,
CONSTRAINT FK_PHIEUMUA_KHACHHANG FOREIGN KEY(IDKH) REFERENCES KHACHHANG
)

IF OBJECT_ID ('CTPHIEUMUA') IS NOT NULL
DROP TABLE CTPHIEUMUA
GO
CREATE TABLE CTPHIEUMUA
(
IDPHIEUMUA VARCHAR(10) NOT NULL,
IDSanPham VARCHAR(10) NOT NULL,
SLMUA INT NOT NULL,
DONGIA MONEY NOT NULL,
CONSTRAINT FK_CTPHIEUMUA_PHIEUMUA FOREIGN KEY(IDPHIEUMUA) REFERENCES PHIEUMUA,
CONSTRAINT FK_CTPHIEUMUA_SANPHAM FOREIGN KEY(IDSanPham) REFERENCES SANPHAM,
CONSTRAINT PK_CTPHIEUMUA PRIMARY KEY(IDPHIEUMUA,IDSanPham)
)



