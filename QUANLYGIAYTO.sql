--CREATE DATABASE QUANLYGIAYTO

--USE QUANLYGIAYTO

CREATE TABLE tblLoaiDon
(
	sMaLoaiDon VARCHAR(50) PRIMARY KEY NOT NULL,
	sTenLoaiDon NVARCHAR(255) NOT NULL
)

CREATE TABLE tblTrangThai
(
	sMaTT VARCHAR(50) PRIMARY KEY NOT NULL,
	sTenTT NVARCHAR(50) NOT NULL
)

CREATE TABLE tblQuyen
(
	sMaQuyen VARCHAR(50) PRIMARY KEY NOT NULL,
	sTenQuyen NVARCHAR(50) NOT NULL
)

CREATE TABLE tblNguoiNhan
(
	sMaNguoiNhan UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
	sEmail_NN VARCHAR(50) UNIQUE NOT NULL,
	sTenNguoiNhan NVARCHAR(50) NOT NULL,
	sChucVu NVARCHAR(50),
	sSdt VARCHAR(50)
)

ALTER TABLE tblNguoiNhan
ADD CONSTRAINT FK_Email_NN FOREIGN KEY(sEmail_NN) REFERENCES tblTaiKhoan(sEmail)

CREATE TABLE tblNguoiXuLy
(
	sMaNguoiXL UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
	sEmail_NXL VARCHAR(50) UNIQUE NOT NULL,
	sTenNguoiXL NVARCHAR(50) NOT NULL,
	sChucVu NVARCHAR(50),
	sSdt VARCHAR(50)
)
ALTER TABLE tblNguoiXuLy
ADD sSoDonDXL nvarchar(50)
--SELECT*from tblNguoiXuLy
ALTER TABLE tblNguoiXuLy
ADD CONSTRAINT FK_Email_XL FOREIGN KEY(sEmail_NXL) REFERENCES tblTaiKhoan(sEmail)

CREATE TABLE tblSinhVien
(
	sMaSV VARCHAR(50) PRIMARY KEY NOT NULL,
	sEmail_SV VARCHAR(50) UNIQUE NOT NULL,
	sTenSV NVARCHAR(50),
	sLopHC VARCHAR(50),
	sChucVu VARCHAR(50),
	sSdt VARCHAR(50)
)

ALTER TABLE tblSinhVien
ADD CONSTRAINT FK_Email_SV FOREIGN KEY(sEmail_SV) REFERENCES tblTaiKhoan(sEmail)

CREATE TABLE tblTaiKhoan
(
	sEmail VARCHAR(50) PRIMARY KEY NOT NULL,  
	sMatKhau VARCHAR(15) NOT NULL,
	sMaQuyen VARCHAR(50) NOT NULL
)

ALTER TABLE tblTaiKhoan
ADD CONSTRAINT FK_MaQuyen FOREIGN KEY(sMaQuyen) REFERENCES tblQuyen(sMaQuyen)

CREATE TABLE tblThongBao
(
	sMaTB UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
	sNoiDungTB VARCHAR(255) NOT NULL,
	sMaDon UNIQUEIDENTIFIER NOT NULL
)

ALTER TABLE tblThongBao
ADD CONSTRAINT FK_Don FOREIGN KEY(sMaDon) REFERENCES tblDon(sMaDon)

CREATE TABLE tblDon
(
	sMaDon UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
	sMaLoaiDon VARCHAR(50) NOT NULL,
	sEmail_SV VARCHAR(50) NOT NULL,
	sEmail_NN VARCHAR(50),
	sEmail_NXL VARCHAR(50), 
	sMaTT VARCHAR(50) NOT NULL,
	sNoiDung NVARCHAR(MAX) NOT NULL,
	sTepDinhKem VARCHAR(256) NOT NULL,
	dNgayNhan DATETIME NOT NULL,
	dNgayPhanCong DATETIME,
	dNgayxuly DATETIME
)

ALTER TABLE tblDon
ADD CONSTRAINT FK_MaLoaiDon FOREIGN KEY(sMaLoaiDon) REFERENCES tblLoaiDon(sMaLoaiDon),
	CONSTRAINT FK_MaSV FOREIGN KEY(sEmail_SV) REFERENCES tblSinhVien(sEmail_SV),
	CONSTRAINT FK_MaNguoiNhan FOREIGN KEY(sEmail_NN) REFERENCES tblNguoiNhan(sEmail_NN),
	CONSTRAINT FK_MaNguoiXL FOREIGN KEY(sEmail_NXL) REFERENCES tblNguoiXuLy(sEmail_NXL),
	CONSTRAINT FK_MaTT FOREIGN KEY(sMaTT) REFERENCES tblTrangThai(sMaTT)

--==========================STORE PROCEDURE===============================--

--==========================NGUOI XU LY===============================--
--dsNguoixuly
GO
 CREATE PROC dsNguoixuly(@stringg VARCHAR(50))
AS
BEGIN
	IF(@stringg = 'admin@admin.com')
	BEGIN
		SELECT * FROM tblNguoiXuLy, tblTaiKhoan, tblQuyen WHERE tblNguoiXuLy.sEmail_NXL = tblTaiKhoan.sEmail 
		AND tblQuyen.sMaQuyen = tblTaiKhoan.sMaQuyen AND tblQuyen.sMaQuyen = 'nguoixuly'
	END
	ELSE
	BEGIN
		SELECT * FROM tblNguoiXuLy, tblTaiKhoan, tblQuyen WHERE tblNguoiXuLy.sEmail_NXL = tblTaiKhoan.sEmail 
		AND tblQuyen.sMaQuyen = tblTaiKhoan.sMaQuyen AND tblQuyen.sMaQuyen = 'nguoixuly' AND sEmail_NXL = @stringg
	END
END
--Số đơn đã xử lý--------------
GO
 CREATE PROC soDonDXL(@stringg nVARCHAR(50))
AS
BEGIN	
	SELECT COUNT(*) AS SLDon_ChoXL_Thang
	FROM tblDon 
	WHERE sMaTT = 'choxuly' AND sEmail_NXL = @stringg
		--SELECT COUNT(*) AS soDonDXL
		--FROM tblDon ,tblNguoiXuLy,tblTrangThai
		--WHERE tblDon.sEmail_NXL=tblNguoiXuLy.sEmail_NXL AND tblTrangThai.sMaTT=tblDon.sMaTT AND sMaTT = 'daxuly' AND sEmail_NXL = @stringg 
END
--dsNguoixuly_ddl
GO
 CREATE PROC dsNguoixuly_ddl
AS
BEGIN
		SELECT * FROM tblNguoiXuLy, tblTaiKhoan, tblQuyen WHERE tblNguoiXuLy.sEmail_NXL = tblTaiKhoan.sEmail 
		AND tblQuyen.sMaQuyen = tblTaiKhoan.sMaQuyen AND tblQuyen.sMaQuyen = 'nguoixuly'
	
END

--detailNguoixuly
GO
 CREATE PROC detailNguoixuly(@stringg UNIQUEIDENTIFIER)
AS
BEGIN
		SELECT * FROM tblNguoiXuLy, tblTaiKhoan, tblQuyen WHERE tblNguoiXuLy.sEmail_NXL = tblTaiKhoan.sEmail 
		AND tblQuyen.sMaQuyen = tblTaiKhoan.sMaQuyen AND tblQuyen.sMaQuyen = 'nguoixuly' AND sMaNguoiXL = @stringg
END

--updateNguoixuly
GO
 CREATE PROC updateNguoixuly(@MaNXL UNIQUEIDENTIFIER,@TenNXL NVARCHAR(50),@Sdt VARCHAR(50))
AS
BEGIN
	UPDATE tblNguoiXuLy
	SET sTenNguoiXL = @TenNXL,sSdt = @Sdt
	WHERE sMaNguoiXL = @MaNXL
END

--So don cho xu ly trong ngay
GO
 CREATE PROC slDon_ChoXL_Ngay(@stringg VARCHAR(50))
AS
BEGIN
	SELECT COUNT(*) AS SLDon_ChoXL_Ngay 
	FROM tblDon 
	WHERE sMaTT = 'choxuly' AND sEmail_NXL = @stringg--'nguoixuly4@gmail.com' 
	AND MONTH(dNgayPhanCong) = MONTH(GETDATE()) AND DAY(dNgayPhanCong) = DAY(GETDATE()) AND YEAR(dNgayPhanCong) = YEAR(GETDATE())
END

--So don da xu ly trong ngay
GO
 CREATE PROC slDon_DaXL_Ngay(@stringg VARCHAR(50))
AS
BEGIN
	SELECT COUNT(*) AS SLDon_DaXL_Ngay 
	FROM tblDon 
	WHERE sMaTT = 'daxuly' AND sEmail_NXL = @stringg--'nguoixuly4@gmail.com' 
	AND MONTH(dNgayxuly) = MONTH(GETDATE()) AND DAY(dNgayxuly) = DAY(GETDATE()) AND YEAR(dNgayxuly) = YEAR(GETDATE())
END

--So don cho xu ly trong thang
GO
 CREATE PROC slDon_ChoXL_Thang(@stringg VARCHAR(50))
AS
BEGIN
	SELECT COUNT(*) AS SLDon_ChoXL_Thang
	FROM tblDon 
	WHERE sMaTT = 'choxuly' AND sEmail_NXL = @stringg--'nguoixuly4@gmail.com' 
	AND MONTH(dNgayPhanCong) = MONTH(GETDATE()) AND YEAR(dNgayPhanCong) = YEAR(GETDATE())
END

--So don da xu ly trong thang
GO
 CREATE PROC slDon_DaXL_Thang(@stringg VARCHAR(50))
AS
BEGIN
	SELECT COUNT(*) AS SLDon_DaXL_Thang
	FROM tblDon 
	WHERE sMaTT = 'daxuly' AND sEmail_NXL = @stringg--'nguoixuly4@gmail.com' 
	AND MONTH(dNgayxuly) = MONTH(GETDATE()) AND YEAR(dNgayxuly) = YEAR(GETDATE())
END

--addNguoiXL
GO
 CREATE PROC addNguoiXL(@Email_NXL VARCHAR(50),@TenNguoiXL NVARCHAR(50),@Sdt VARCHAR(50),@MatKhau VARCHAR(15))
AS
BEGIN
	INSERT INTO tblTaiKhoan(sEmail,sMatKhau,sMaQuyen)
	VALUES(@Email_NXL,@MatKhau,'nguoixuly')

	INSERT INTO tblNguoiXuLy(sMaNguoiXL,sEmail_NXL,sTenNguoiXL,sChucVu,sSdt)
	VALUES(NEWID(),@Email_NXL,@TenNguoiXL,N'Người xử lý',@Sdt)
END
--==========================END NGUOI XU LY===============================--


--==========================ADMIN===============================--

--So don cho xu ly trong ngay
GO
 CREATE PROC slDon_ChoXL_Ngay_Admin
AS
BEGIN
	SELECT COUNT(*) AS SLDon_ChoXL_Ngay 
	FROM tblDon 
	WHERE sMaTT = 'choxuly' 
	AND MONTH(dNgayNhan) = MONTH(GETDATE()) AND DAY(dNgayNhan) = DAY(GETDATE()) AND YEAR(dNgayNhan) = YEAR(GETDATE())
END

--So don da xu ly trong ngay
GO
 CREATE PROC slDon_DaXL_Ngay_Admin
AS
BEGIN
	SELECT COUNT(*) AS SLDon_DaXL_Ngay 
	FROM tblDon 
	WHERE sMaTT = 'choxuly'
	AND MONTH(dNgayPhanCong) = MONTH(GETDATE()) AND DAY(dNgayPhanCong) = DAY(GETDATE()) AND YEAR(dNgayPhanCong) = YEAR(GETDATE())
END

--So don cho xu ly trong thang
GO
 CREATE PROC slDon_ChoXL_Thang_Admin
AS
BEGIN
	SELECT COUNT(*) AS SLDon_ChoXL_Thang
	FROM tblDon 
	WHERE sMaTT = 'choxuly'
	AND MONTH(dNgayNhan) = MONTH(GETDATE()) AND YEAR(dNgayNhan) = YEAR(GETDATE())
END

--So don da xu ly trong thang
GO
 CREATE PROC slDon_DaXL_Thang_Admin
AS
BEGIN
	SELECT COUNT(*) AS SLDon_DaXL_Thang
	FROM tblDon 
	WHERE sMaTT = 'daxuly'
	AND MONTH(dNgayxuly) = MONTH(GETDATE()) AND YEAR(dNgayxuly) = YEAR(GETDATE())
END
--==========================END ADMIN===============================--


--==========================NGUOI TIEP NHAN===============================--
--dsNguoitiepnhan
GO
 CREATE PROC dsNguoitiepnhan(@stringg VARCHAR(50))
AS
BEGIN
	IF(@stringg = 'admin@admin.com')
	BEGIN
		SELECT * FROM tblNguoiNhan, tblTaiKhoan, tblQuyen WHERE tblNguoiNhan.sEmail_NN = tblTaiKhoan.sEmail
		AND tblQuyen.sMaQuyen = tblTaiKhoan.sMaQuyen AND tblQuyen.sMaQuyen = 'nguoinhan'
	END
	ELSE
	BEGIN
		SELECT * FROM tblNguoiNhan, tblTaiKhoan, tblQuyen WHERE tblNguoiNhan.sEmail_NN = tblTaiKhoan.sEmail
		AND tblQuyen.sMaQuyen = tblTaiKhoan.sMaQuyen AND tblQuyen.sMaQuyen = 'nguoinhan' AND sEmail_NN = @stringg
	END
END

--detailNguoitiepnhan
GO
 CREATE PROC detailNguoinhan(@stringg VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblNguoiNhan, tblTaiKhoan, tblQuyen WHERE tblNguoiNhan.sEmail_NN = tblTaiKhoan.sEmail
	AND tblQuyen.sMaQuyen = tblTaiKhoan.sMaQuyen AND tblQuyen.sMaQuyen = 'nguoinhan' AND sEmail_NN = @stringg

END

DROP PROC detailNguoinhan
--updateNguoitiepnhan
GO
 CREATE PROC updateNguoitiepnhan(@MaNN UNIQUEIDENTIFIER,@TenNN NVARCHAR(50),@Sdt VARCHAR(50))
AS
BEGIN
	UPDATE tblNguoiNhan
	SET sTenNguoiNhan = @TenNN, sSdt = @Sdt
	WHERE sMaNguoiNhan = @MaNN
END

--addNguoitiepnhan
GO
 CREATE PROC addNguoitiepnhan(@Email VARCHAR(50),@TenNN NVARCHAR(50),@Sdt VARCHAR(50),@MatKhau VARCHAR(15))
AS
BEGIN
	INSERT INTO tblTaiKhoan(sEmail,sMatKhau,sMaQuyen)
	VALUES(@Email,@MatKhau,'nguoinhan')

	INSERT INTO tblNguoiNhan(sMaNguoiNhan,sEmail_NN,sTenNguoiNhan,sChucVu,sSdt)
	VALUES(NEWID(),@Email,@TenNN,N'Người nhận',@Sdt)
END

--So don cho xu ly trong ngay
GO
 CREATE PROC slDon_DaNhan_Ngay(@stringg VARCHAR(50))
AS
BEGIN
	SELECT COUNT(*) AS SLDon_DaNhan_Ngay
	FROM tblDon 
	WHERE sEmail_NN = @stringg--'nguoinhan1@gmail.com'
	AND MONTH(dNgayNhan) = MONTH(GETDATE()) AND DAY(dNgayNhan) = DAY(GETDATE()) AND YEAR(dNgayNhan) = YEAR(GETDATE())
END

--So don cho xu ly trong thang
GO
 CREATE PROC slDon_DaNhan_Thang(@stringg VARCHAR(50))
AS
BEGIN
	SELECT COUNT(*) AS SLDon_DaNhan_Thang
	FROM tblDon 
	WHERE sEmail_NN = @stringg--'nguoinhan1@gmail.com'
	AND MONTH(dNgayNhan) = MONTH(GETDATE()) AND YEAR(dNgayNhan) = YEAR(GETDATE())
END

--==========================END NGUOI TIEP NHAN===============================--

--==========================SINH VIEN===============================--
--dsSinhvien
GO
 CREATE PROC dsSinhvien
AS
BEGIN
	SELECT * FROM tblSinhVien, tblTaiKhoan, tblQuyen WHERE tblSinhVien.sEmail_SV= tblTaiKhoan.sEmail 
	AND tblQuyen.sMaQuyen = tblTaiKhoan.sMaQuyen AND tblQuyen.sMaQuyen = 'sinhvien'
END

--detailSinhvien
GO
 CREATE PROC detailSinhvien(@stringg VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblSinhVien, tblTaiKhoan, tblQuyen WHERE tblSinhVien.sEmail_SV= tblTaiKhoan.sEmail 
	AND tblQuyen.sMaQuyen = tblTaiKhoan.sMaQuyen AND tblQuyen.sMaQuyen = 'sinhvien' AND sMaSV = @stringg
END

--updateSinhVien
GO
 CREATE PROC updateSinhVien(@MaSV VARCHAR(50),@TenSV NVARCHAR(50),@LopHC VARCHAR(50))
AS
BEGIN
	UPDATE tblSinhVien
	SET sTenSV = @TenSV,sLopHC = @LopHC
	WHERE sMaSV = @MaSV
END

--addSinhVien
GO
 CREATE PROC addSinhVien(@MaSV VARCHAR(50),@Email_SV VARCHAR(50),@TenSV NVARCHAR(50),@LopHC VARCHAR(50))
AS
BEGIN
	INSERT INTO tblTaiKhoan(sEmail,sMatKhau,sMaQuyen)
	VALUES(@Email_SV,'1234','sinhvien')

	INSERT INTO tblSinhVien(sMaSV,sEmail_SV,sTenSV,sLopHC,sChucVu,sSdt)
	VALUES(@MaSV,@Email_SV,@TenSV,@LopHC,N'Sinh viên',NULL)
END

--searchSinhVien
GO
 CREATE PROC searchSinhVien(@TenSV NVARCHAR(50))
AS
BEGIN
	SELECT * FROM tblSinhVien WHERE sTenSV LIKE N'%' + @TenSV + '%'
END

--dsSinhVien_Email
GO
 CREATE PROC dsSinhVien_Email(@Email_SV NVARCHAR(50))
AS
BEGIN
	SELECT * FROM tblSinhVien WHERE sEmail_SV = @Email_SV
END

--==========================END SINH VIEN===============================--

--==========================QUYEN===============================--
--dsQuyen
GO
 CREATE PROC dsQuyen
AS
BEGIN
	SELECT * FROM tblQuyen
END

--==========================END QUYEN===============================--

--==========================DON===============================--
--addDon
GO
 CREATE PROC addDon(@MaLoaiDon VARCHAR(50),@Email_SV VARCHAR(50),@Email_NN VARCHAR(50),
@NoiDung NVARCHAR(MAX),@TepDinhKem VARCHAR(256))
AS
BEGIN
	INSERT INTO tblDon(sMaDon,sMaLoaiDon,sEmail_SV,sEmail_NN,sMaTT,sNoiDung,sTepDinhKem,dNgayNhan)
	VALUES(NEWID(),@MaLoaiDon,@Email_SV,@Email_NN,'choxuly',@NoiDung,@TepDinhKem,GETDATE())
END

--dsDon_DaXL for admin
GO
 CREATE PROC dsDon_DaXL
AS
BEGIN
	SELECT * 
	FROM tblDon, tblLoaiDon, tblNguoiXuLy, tblNguoiNhan, tblSinhVien, tblTrangThai
	WHERE tblDon.sMaLoaiDon = tblLoaiDon.sMaLoaiDon AND tblDon.sMaTT = tblTrangThai.sMaTT 
	AND tblDon.sEmail_NN = tblNguoiNhan.sEmail_NN AND tblDon.sEmail_SV = tblSinhVien.sEmail_SV
	AND tblDon.sEmail_NXL = tblNguoiXuLy.sEmail_NXL AND tblTrangThai.sMaTT = 'daxuly'
END

--detailDon_DaXL for admin
GO
 CREATE PROC detailDon_DaXL(@stringg UNIQUEIDENTIFIER)
AS
BEGIN
	SELECT * 
	FROM tblDon, tblLoaiDon, tblNguoiXuLy, tblNguoiNhan, tblSinhVien, tblTrangThai
	WHERE tblDon.sMaLoaiDon = tblLoaiDon.sMaLoaiDon AND tblDon.sMaTT = tblTrangThai.sMaTT 
	AND tblDon.sEmail_NN = tblNguoiNhan.sEmail_NN AND tblDon.sEmail_SV = tblSinhVien.sEmail_SV
	AND tblDon.sEmail_NXL = tblNguoiXuLy.sEmail_NXL AND tblTrangThai.sMaTT = 'daxuly' AND sMaDon = @stringg
END

--dsDon_ChuaXL for admin
GO
 CREATE PROC dsDon_ChuaXL
AS
BEGIN
	SELECT * 
	FROM tblDon, tblLoaiDon, tblNguoiNhan, tblSinhVien, tblTrangThai
	WHERE tblDon.sMaLoaiDon = tblLoaiDon.sMaLoaiDon AND tblDon.sMaTT = tblTrangThai.sMaTT 
	AND tblDon.sEmail_NN = tblNguoiNhan.sEmail_NN AND tblDon.sEmail_SV = tblSinhVien.sEmail_SV
	AND tblTrangThai.sMaTT = 'choxuly' 
	ORDER BY dNgayNhan DESC
END

--detailDon_ChoXL for admin
GO
 CREATE PROC detailDon_ChoXL(@stringg UNIQUEIDENTIFIER)
AS
BEGIN
	SELECT * 
	FROM tblDon, tblLoaiDon, tblNguoiNhan, tblSinhVien, tblTrangThai
	WHERE tblDon.sMaLoaiDon = tblLoaiDon.sMaLoaiDon AND tblDon.sMaTT = tblTrangThai.sMaTT 
	AND tblDon.sEmail_NN = tblNguoiNhan.sEmail_NN AND tblDon.sEmail_SV = tblSinhVien.sEmail_SV
	AND tblTrangThai.sMaTT = 'choxuly' AND sMaDon = @stringg
	ORDER BY dNgayNhan DESC
END

--dsDon_NguoiXl_ChoXL
GO
 CREATE PROC dsDon_NguoiXl_ChoXL(@stringg VARCHAR(50), @type VARCHAR(50))
AS
BEGIN
	SELECT * 
	FROM tblNguoiXuLy,tblDon,tblSinhVien,tblNguoiNhan,tblLoaiDon,tblTrangThai
	WHERE tblNguoiXuLy.sEmail_NXL = tblDon.sEmail_NXL AND tblDon.sEmail_NN = tblNguoiNhan.sEmail_NN 
	AND tblDon.sEmail_SV = tblSinhVien.sEmail_SV AND tblLoaiDon.sMaLoaiDon = tblDon.sMaLoaiDon AND tblDon.sMaTT = tblTrangThai.sMaTT
	AND tblNguoiXuLy.sEmail_NXL = @stringg AND tblTrangThai.sMaTT = @type
END

--updateDon
GO
 CREATE PROC updateDon(@MaDon UNIQUEIDENTIFIER, @Email_NXL VARCHAR(50))
AS
BEGIN
	UPDATE tblDon
	SET sEmail_NXL = @Email_NXL, dNgayPhanCong = GETDATE()
	WHERE sMaDon = @MaDon
END

--xacnhanDon
GO
 CREATE PROC xacnhanDon(@MaDon UNIQUEIDENTIFIER)
AS
BEGIN
	UPDATE tblDon
	SET sMaTT = 'daxuly', dNgayXuLy = GETDATE()
	WHERE sMaDon = @MaDon
END

--dsDon_NguoiXl_DaXL
GO
 CREATE PROC dsDon_NguoiXl_DaXL(@stringg VARCHAR(50), @type VARCHAR(50))
AS
BEGIN
	SELECT * 
	FROM tblNguoiXuLy,tblDon,tblSinhVien,tblNguoiNhan,tblLoaiDon,tblTrangThai
	WHERE tblNguoiXuLy.sEmail_NXL = tblDon.sEmail_NXL AND tblDon.sEmail_NN = tblNguoiNhan.sEmail_NN 
	AND tblDon.sEmail_SV = tblSinhVien.sEmail_SV AND tblLoaiDon.sMaLoaiDon = tblDon.sMaLoaiDon AND tblDon.sMaTT = tblTrangThai.sMaTT
	AND tblNguoiXuLy.sEmail_NXL = @stringg AND tblTrangThai.sMaTT = @type
END

--dsDon_Nguoinhan_DaXL
GO
 CREATE PROC dsDon_Nguoinhan_DaXL(@stringg VARCHAR(50), @type VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblNguoiNhan,tblTaiKhoan,tblDon,tblSinhVien,tblLoaiDon,tblTrangThai
	WHERE tblNguoiNhan.sEmail_NN = tblTaiKhoan.sEmail AND tblDon.sMaLoaiDon = tblLoaiDon.sMaLoaiDon
	AND tblNguoiNhan.sEmail_NN = tblDon.sEmail_NN AND tblSinhVien.sEmail_SV = tblDon.sEmail_SV 
	AND tblTrangThai.sMaTT = tblDon.sMaTT AND tblTaiKhoan.sMaQuyen = 'nguoinhan' 
	AND tblNguoiNhan.sEmail_NN = @stringg AND tblTrangThai.sMaTT = @type
END

--dsDon_Nguoinhan_ChoXL
GO
 CREATE PROC dsDon_Nguoinhan_ChoXL(@stringg VARCHAR(50), @type VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblNguoiNhan,tblTaiKhoan,tblDon,tblSinhVien,tblLoaiDon,tblTrangThai
	WHERE tblNguoiNhan.sEmail_NN = tblTaiKhoan.sEmail AND tblDon.sMaLoaiDon = tblLoaiDon.sMaLoaiDon
	AND tblTrangThai.sMaTT = tblDon.sMaTT AND tblNguoiNhan.sEmail_NN = tblDon.sEmail_NN AND tblSinhVien.sEmail_SV = tblDon.sEmail_SV 
	AND tblTaiKhoan.sMaQuyen = 'nguoinhan' AND tblNguoiNhan.sEmail_NN = @stringg AND tblTrangThai.sMaTT = @type
END

--detailDon_ID_Type
GO
 CREATE PROC detailDon_ID(@stringg UNIQUEIDENTIFIER)
AS
BEGIN
	SELECT * 
	FROM tblNguoiXuLy,tblDon,tblSinhVien,tblNguoiNhan,tblLoaiDon,tblTrangThai
	WHERE tblNguoiXuLy.sEmail_NXL = tblDon.sEmail_NXL AND tblDon.sEmail_NN = tblNguoiNhan.sEmail_NN 
	AND tblDon.sEmail_SV = tblSinhVien.sEmail_SV AND tblLoaiDon.sMaLoaiDon = tblDon.sMaLoaiDon AND tblDon.sMaTT = tblTrangThai.sMaTT
	AND tblDon.sMaDon = @stringg
END

--==========================END DON===============================--


--==========================LOAI DON===============================--
--dsLoaiDon
GO 
CREATE PROC dsLoaiDon
AS
BEGIN
	SELECT * FROM tblLoaiDon
END

--detailLoaiDon
GO 
CREATE PROC detailLoaiDon(@stringg VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblLoaiDon WHERE sMaLoaiDon = @stringg
END

--updateLoaiDon
GO 
CREATE PROC updateLoaiDon(@MaLoaiDon VARCHAR(50),@TenLoaiDon NVARCHAR(255))
AS
BEGIN
	UPDATE tblLoaiDon
	SET sTenLoaiDon = @TenLoaiDon
	WHERE sMaLoaiDon = @MaLoaiDon
END

--addLoaiDon
GO 
CREATE PROC addLoaiDon(@MaLoaiDon VARCHAR(50),@TenLoaiDon NVARCHAR(255))
AS
BEGIN
	INSERT INTO tblLoaiDon
	VALUES(@MaLoaiDon,@TenLoaiDon)
END

--==========================END LOAI DON===============================--

--==========================TAI KHOAN===============================--
--loginUser
GO
 CREATE PROC loginUser(@TaiKhoan VARCHAR(50), @MatKhau VARCHAR(15))
AS
BEGIN
	SELECT * FROM tblTaiKhoan, tblQuyen WHERE tblTaiKhoan.sMaQuyen = tblQuyen.sMaQuyen AND sEmail = @TaiKhoan AND sMatKhau = @MatKhau
END

--loginUser_Backup
GO
 CREATE PROC loginUser(@TaiKhoan VARCHAR(50), @MatKhau VARCHAR(15))
AS
BEGIN
	SELECT * FROM tblTaiKhoan,tblQuyen,tblSinhVien,tblNguoiNhan,tblNguoiXuLy 
	WHERE tblTaiKhoan.sMaQuyen = tblQuyen.sMaQuyen AND tblTaiKhoan.sEmail = tblSinhVien.sEmail_SV 
		AND tblTaiKhoan.sEmail = tblNguoiNhan.sEmail_NN AND tblTaiKhoan.sEmail = tblNguoiXuLy.sEmail_NXL
		AND sMatKhau = @MatKhau AND sEmail = @TaiKhoan 
END

--==========================END TAI KHOAN===============================--


--==========================BAO CAO THONG KE===============================--
--dsDon_Thang
GO 
CREATE PROC dsDon_Thang(@stringg VARCHAR(50))
AS
BEGIN
	SELECT * 
	FROM tblDon, tblLoaiDon, tblNguoiNhan, tblSinhVien, tblTrangThai
	WHERE tblDon.sMaLoaiDon = tblLoaiDon.sMaLoaiDon AND tblDon.sMaTT = tblTrangThai.sMaTT 
	AND tblDon.sEmail_NN = tblNguoiNhan.sEmail_NN AND tblDon.sEmail_SV = tblSinhVien.sEmail_SV
	AND tblTrangThai.sMaTT = 'choxuly' AND YEAR(dNgayNhan) = YEAR(GETDATE()) AND MONTH(dNgayNhan) = @stringg
	ORDER BY dNgayNhan DESC
END

--dsDonDaXL_Thang for admin
GO
 CREATE PROC dsDonDaXL_Thang(@stringg VARCHAR(50))
AS
BEGIN
	SELECT * 
	FROM tblDon, tblLoaiDon, tblNguoiXuLy, tblNguoiNhan, tblSinhVien, tblTrangThai
	WHERE tblDon.sMaLoaiDon = tblLoaiDon.sMaLoaiDon AND tblDon.sMaTT = tblTrangThai.sMaTT 
	AND tblDon.sEmail_NN = tblNguoiNhan.sEmail_NN AND tblDon.sEmail_SV = tblSinhVien.sEmail_SV
	AND tblDon.sEmail_NXL = tblNguoiXuLy.sEmail_NXL AND tblTrangThai.sMaTT = 'daxuly' 
	AND YEAR(dNgayNhan) = YEAR(GETDATE()) AND MONTH(dNgayNhan) = @stringg
	ORDER BY dNgayNhan DESC
END

--==========================END BAO CAO THONG KE===============================--

--==========================END STORE PROCEDURE===============================--

