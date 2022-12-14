USE [master]
GO
/****** Object:  Database [QUANLYGIAYTO]    Script Date: 30/03/2022 15:52:50 ******/
CREATE DATABASE [QUANLYGIAYTO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QUANLYGIAYTO', FILENAME = N'C:\Users\DELL\OneDrive\Documents\SQL Server Management Studio\QUANLYGIAYTO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QUANLYGIAYTO_log', FILENAME = N'C:\Users\DELL\OneDrive\Documents\SQL Server Management Studio\QUANLYGIAYTO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
-- WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QUANLYGIAYTO] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QUANLYGIAYTO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QUANLYGIAYTO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QUANLYGIAYTO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QUANLYGIAYTO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QUANLYGIAYTO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QUANLYGIAYTO] SET ARITHABORT OFF 
GO
ALTER DATABASE [QUANLYGIAYTO] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QUANLYGIAYTO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QUANLYGIAYTO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QUANLYGIAYTO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QUANLYGIAYTO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QUANLYGIAYTO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QUANLYGIAYTO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QUANLYGIAYTO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QUANLYGIAYTO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QUANLYGIAYTO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QUANLYGIAYTO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QUANLYGIAYTO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QUANLYGIAYTO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QUANLYGIAYTO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QUANLYGIAYTO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QUANLYGIAYTO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QUANLYGIAYTO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QUANLYGIAYTO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QUANLYGIAYTO] SET  MULTI_USER 
GO
ALTER DATABASE [QUANLYGIAYTO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QUANLYGIAYTO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QUANLYGIAYTO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QUANLYGIAYTO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QUANLYGIAYTO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QUANLYGIAYTO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QUANLYGIAYTO] SET QUERY_STORE = OFF
GO
USE [QUANLYGIAYTO]
GO
/****** Object:  Table [dbo].[tblDon]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDon](
	[sMaDon] [uniqueidentifier] NOT NULL,
	[sMaLoaiDon] [varchar](50) NOT NULL,
	[sEmail_SV] [varchar](50) NOT NULL,
	[sEmail_NN] [varchar](50) NULL,
	[sEmail_NXL] [varchar](50) NULL,
	[sMaTT] [varchar](50) NOT NULL,
	[sNoiDung] [nvarchar](max) NOT NULL,
	[sTepDinhKem] [varchar](256) NOT NULL,
	[dNgayNhan] [datetime] NOT NULL,
	[dNgayPhanCong] [datetime] NULL,
	[dNgayxuly] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLoaiDon]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLoaiDon](
	[sMaLoaiDon] [varchar](50) NOT NULL,
	[sTenLoaiDon] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaLoaiDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNguoiNhan]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNguoiNhan](
	[sMaNguoiNhan] [uniqueidentifier] NOT NULL,
	[sEmail_NN] [varchar](50) NOT NULL,
	[sTenNguoiNhan] [nvarchar](50) NOT NULL,
	[sChucVu] [nvarchar](50) NULL,
	[sSdt] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaNguoiNhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNguoiXuLy]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNguoiXuLy](
	[sMaNguoiXL] [uniqueidentifier] NOT NULL,
	[sEmail_NXL] [varchar](50) NOT NULL,
	[sTenNguoiXL] [nvarchar](50) NOT NULL,
	[sChucVu] [nvarchar](50) NULL,
	[sSdt] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaNguoiXL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuyen]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuyen](
	[sMaQuyen] [varchar](50) NOT NULL,
	[sTenQuyen] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSinhVien]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSinhVien](
	[sMaSV] [varchar](50) NOT NULL,
	[sEmail_SV] [varchar](50) NOT NULL,
	[sTenSV] [nvarchar](50) NULL,
	[sLopHC] [varchar](50) NULL,
	[sChucVu] [varchar](50) NULL,
	[sSdt] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTaiKhoan]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTaiKhoan](
	[sEmail] [varchar](50) NOT NULL,
	[sMatKhau] [varchar](15) NOT NULL,
	[sMaQuyen] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblThongBao]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblThongBao](
	[sMaTB] [uniqueidentifier] NOT NULL,
	[sNoiDungTB] [varchar](255) NOT NULL,
	[sMaDon] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaTB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTrangThai]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrangThai](
	[sMaTT] [varchar](50) NOT NULL,
	[sTenTT] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblDon] ([sMaDon], [sMaLoaiDon], [sEmail_SV], [sEmail_NN], [sEmail_NXL], [sMaTT], [sNoiDung], [sTepDinhKem], [dNgayNhan], [dNgayPhanCong], [dNgayxuly]) VALUES (N'c5e61b65-fc1d-4863-98bd-426659953bdc', N'xacnhannvqs', N'19A10013123@students.hou.edu.vn', N'nguoinhan1@gmail.com', N'nguoixuly2@gmail.com', N'daxuly', N'Khong co noi dung', N'DamBaoChatLuongPhanMem_Bai2_BaiTap1.pdf', CAST(N'2022-03-29T21:57:22.780' AS DateTime), CAST(N'2022-03-29T22:06:02.190' AS DateTime), CAST(N'2022-03-29T22:08:26.613' AS DateTime))
INSERT [dbo].[tblDon] ([sMaDon], [sMaLoaiDon], [sEmail_SV], [sEmail_NN], [sEmail_NXL], [sMaTT], [sNoiDung], [sTepDinhKem], [dNgayNhan], [dNgayPhanCong], [dNgayxuly]) VALUES (N'baf7966b-d651-43fc-a1f3-7882f284c8a4', N'dieuchinhdangkytinchi', N'19A10013123@students.hou.edu.vn', N'nguoinhan1@gmail.com', N'nguoixuly4@gmail.com', N'choxuly', N'Khong co noi dung', N'ViDuCongThucTinhChiTieuChatLuong.pdf', CAST(N'2022-03-29T11:15:55.263' AS DateTime), CAST(N'2022-03-29T22:01:50.910' AS DateTime), NULL)
INSERT [dbo].[tblDon] ([sMaDon], [sMaLoaiDon], [sEmail_SV], [sEmail_NN], [sEmail_NXL], [sMaTT], [sNoiDung], [sTepDinhKem], [dNgayNhan], [dNgayPhanCong], [dNgayxuly]) VALUES (N'ee7e652a-c21a-450f-b023-b643395760c7', N'dieuchinhdangkytinchi', N'19A10013123@students.hou.edu.vn', N'nguoinhan5@gmail.com', NULL, N'choxuly', N'Khong co noi dung', N'C#-Quanlysachtrongthuvien.pdf', CAST(N'2022-03-22T09:33:16.547' AS DateTime), NULL, NULL)
INSERT [dbo].[tblDon] ([sMaDon], [sMaLoaiDon], [sEmail_SV], [sEmail_NN], [sEmail_NXL], [sMaTT], [sNoiDung], [sTepDinhKem], [dNgayNhan], [dNgayPhanCong], [dNgayxuly]) VALUES (N'7731a9df-d50b-467d-a738-e86bab7f1471', N'dieuchinhdangkytinchi', N'21A10015415@students.hou.edu.vn', N'nguoinhan5@gmail.com', N'nguoixuly2@gmail.com', N'choxuly', N'Khong co noi dung', N'LHD.SoftwareEngineering-Bai00.pdf', CAST(N'2022-03-25T09:16:24.377' AS DateTime), CAST(N'2022-03-29T09:16:24.377' AS DateTime), NULL)
INSERT [dbo].[tblDon] ([sMaDon], [sMaLoaiDon], [sEmail_SV], [sEmail_NN], [sEmail_NXL], [sMaTT], [sNoiDung], [sTepDinhKem], [dNgayNhan], [dNgayPhanCong], [dNgayxuly]) VALUES (N'28ceb938-4008-44f3-a1b9-eec123213213', N'dieuchinhdangkytinchi', N'21A10015415@students.hou.edu.vn', N'nguoinhan3@gmail.com', N'nguoixuly4@gmail.com', N'choxuly', N'Nội dung thêm sau', N'LHD.SoftwareEngineering-Bai00.pdf', CAST(N'2022-02-28T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblDon] ([sMaDon], [sMaLoaiDon], [sEmail_SV], [sEmail_NN], [sEmail_NXL], [sMaTT], [sNoiDung], [sTepDinhKem], [dNgayNhan], [dNgayPhanCong], [dNgayxuly]) VALUES (N'28ceb938-4008-44f3-a1b9-eec131312354', N'xacnhannvqs', N'19A10013123@students.hou.edu.vn', N'nguoinhan1@gmail.com', N'nguoixuly4@gmail.com', N'daxuly', N'Nội dung thêm sau', N'ViDuCongThucTinhChiTieuChatLuong.pdf', CAST(N'2022-03-03T00:00:00.000' AS DateTime), CAST(N'2022-03-05T22:16:50.777' AS DateTime), CAST(N'2022-03-08T22:16:50.777' AS DateTime))
INSERT [dbo].[tblDon] ([sMaDon], [sMaLoaiDon], [sEmail_SV], [sEmail_NN], [sEmail_NXL], [sMaTT], [sNoiDung], [sTepDinhKem], [dNgayNhan], [dNgayPhanCong], [dNgayxuly]) VALUES (N'28ceb938-4008-44f3-a1b9-eec560023478', N'dieuchinhdangkytinchi', N'17A10015415@students.hou.edu.vn', N'nguoinhan7@gmail.com', N'nguoixuly2@gmail.com', N'daxuly', N'Nội dung thêm sau', N'DamBaoChatLuongPhanMem_Bai3_HoatDongRaSoat.pdf', CAST(N'2022-03-10T00:00:00.000' AS DateTime), CAST(N'2022-03-12T09:16:24.377' AS DateTime), CAST(N'2022-03-20T09:16:24.377' AS DateTime))
INSERT [dbo].[tblDon] ([sMaDon], [sMaLoaiDon], [sEmail_SV], [sEmail_NN], [sEmail_NXL], [sMaTT], [sNoiDung], [sTepDinhKem], [dNgayNhan], [dNgayPhanCong], [dNgayxuly]) VALUES (N'ed45f531-bd22-480c-910a-ef6fd4f04a36', N'dieuchinhdangkytinchi', N'19A10013123@students.hou.edu.vn', N'nguoinhan7@gmail.com', N'nguoixuly6@gmail.com', N'daxuly', N'Khong co noi dung', N'BTL_SQLServer_Nhom_2.pdf', CAST(N'2022-03-18T16:42:11.830' AS DateTime), CAST(N'2022-03-28T22:35:54.007' AS DateTime), CAST(N'2022-03-28T22:37:49.997' AS DateTime))
GO
INSERT [dbo].[tblLoaiDon] ([sMaLoaiDon], [sTenLoaiDon]) VALUES (N'dieuchinhdangkytinchi', N'Điều chỉnh đăng ký tín chỉ')
INSERT [dbo].[tblLoaiDon] ([sMaLoaiDon], [sTenLoaiDon]) VALUES (N'donphuckhaodiem', N'Đơn xin phúc khảo điểm bài thi học kỳ')
INSERT [dbo].[tblLoaiDon] ([sMaLoaiDon], [sTenLoaiDon]) VALUES (N'xacnhannvqs', N'Xác nhận nghĩa vụ quân sự')
GO
INSERT [dbo].[tblNguoiNhan] ([sMaNguoiNhan], [sEmail_NN], [sTenNguoiNhan], [sChucVu], [sSdt]) VALUES (N'28ceb938-4008-44f3-a1b9-123123123213', N'nguoinhan7@gmail.com', N'Nguyễn Thị Bích Ngọc', N'Người nhận', N'0972347324')
INSERT [dbo].[tblNguoiNhan] ([sMaNguoiNhan], [sEmail_NN], [sTenNguoiNhan], [sChucVu], [sSdt]) VALUES (N'81984e23-1dc1-435f-a031-1f54d8ea03bb', N'nguoinhan123@gmail.com', N'Lưu Thị Phương Anh', N'Người nhận', N'0965258416')
INSERT [dbo].[tblNguoiNhan] ([sMaNguoiNhan], [sEmail_NN], [sTenNguoiNhan], [sChucVu], [sSdt]) VALUES (N'c0d0fa9c-8bf4-4012-a2eb-855b3dd6680b', N'nguoinhan456@gmail.com', N'Nguyễn Huy Hoàng', N'Người nhận', N'0965125468')
INSERT [dbo].[tblNguoiNhan] ([sMaNguoiNhan], [sEmail_NN], [sTenNguoiNhan], [sChucVu], [sSdt]) VALUES (N'28ceb938-4008-44f3-a1b9-eec560071233', N'nguoinhan5@gmail.com', N'Phạm Xuân Phương', N'Người nhận', N'0932743244')
INSERT [dbo].[tblNguoiNhan] ([sMaNguoiNhan], [sEmail_NN], [sTenNguoiNhan], [sChucVu], [sSdt]) VALUES (N'28ceb938-4008-44f3-a1b9-eec560079412', N'nguoinhan3@gmail.com', N'Trần Minh Hiền', N'Người nhận', N'0982374832')
INSERT [dbo].[tblNguoiNhan] ([sMaNguoiNhan], [sEmail_NN], [sTenNguoiNhan], [sChucVu], [sSdt]) VALUES (N'28ceb938-4008-44f3-a1b9-eec5600794f2', N'nguoinhan1@gmail.com', N'Lê Quang Huy', N'Người nhận', N'0987123345')

GO
INSERT [dbo].[tblNguoiXuLy] ([sMaNguoiXL], [sEmail_NXL], [sTenNguoiXL], [sChucVu], [sSdt]) VALUES (N'28ceb938-4008-44f3-a1b9-eec560023444', N'nguoixuly6@gmail.com', N'Người xử lý 6', N'Người xử lý', N'0924342323')
INSERT [dbo].[tblNguoiXuLy] ([sMaNguoiXL], [sEmail_NXL], [sTenNguoiXL], [sChucVu], [sSdt]) VALUES (N'28ceb938-4008-44f3-a1b9-eec560023572', N'nguoixuly2@gmail.com', N'Hoàng Đình Hải', N'Người xử lý', N'0923243123')
INSERT [dbo].[tblNguoiXuLy] ([sMaNguoiXL], [sEmail_NXL], [sTenNguoiXL], [sChucVu], [sSdt]) VALUES (N'28ceb938-4008-44f3-a1b9-eec560045345', N'nguoixuly4@gmail.com', N'Nguyễn Thị Thanh Thùy', N'Người xử lý', N'0923483284')
INSERT [dbo].[tblNguoiXuLy] ([sMaNguoiXL], [sEmail_NXL], [sTenNguoiXL], [sChucVu], [sSdt]) VALUES (N'8d167290-a30e-404f-b3e4-fdf0bc83160f', N'nguoixuly0977@gmail.com', N'Nguyễn Hoàng Đức', N'Người xử lý', N'0965481254')
GO
INSERT [dbo].[tblQuyen] ([sMaQuyen], [sTenQuyen]) VALUES (N'admin', N'ADMIN')
INSERT [dbo].[tblQuyen] ([sMaQuyen], [sTenQuyen]) VALUES (N'nguoinhan', N'Người nhận')
INSERT [dbo].[tblQuyen] ([sMaQuyen], [sTenQuyen]) VALUES (N'nguoixuly', N'Người xử lý')
INSERT [dbo].[tblQuyen] ([sMaQuyen], [sTenQuyen]) VALUES (N'sinhvien', N'Sinh viên')
GO
INSERT [dbo].[tblSinhVien] ([sMaSV], [sEmail_SV], [sTenSV], [sLopHC], [sChucVu], [sSdt]) VALUES (N'17A10015415', N'17A10015415@students.hou.edu.vn', N'Nguyễn Hoàng Long', N'1710A02', N'Sinh viên', N'0973123435')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sEmail_SV], [sTenSV], [sLopHC], [sChucVu], [sSdt]) VALUES (N'19A10013123', N'19A10013123@students.hou.edu.vn', N'Nguyễn Thị Hà', N'1910A03', N'Sinh viên', N'0932483248')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sEmail_SV], [sTenSV], [sLopHC], [sChucVu], [sSdt]) VALUES (N'21A10010315', N'21A10010315@students.hou.edu.vn', N'Đặng Minh Tùng', N'2110A01', N'Sinh viên', NULL)
INSERT [dbo].[tblSinhVien] ([sMaSV], [sEmail_SV], [sTenSV], [sLopHC], [sChucVu], [sSdt]) VALUES (N'21A10015415', N'21A10015415@students.hou.edu.vn', N'Lê Minh Đức', N'2110A03', N'Sinh viên', N'0932743274')
GO
INSERT [dbo].[tblTaiKhoan] ([sEmail], [sMatKhau], [sMaQuyen]) VALUES (N'17A10015415@students.hou.edu.vn', N'1234', N'sinhvien')
INSERT [dbo].[tblTaiKhoan] ([sEmail], [sMatKhau], [sMaQuyen]) VALUES (N'19A10013123@students.hou.edu.vn', N'1234', N'sinhvien')
INSERT [dbo].[tblTaiKhoan] ([sEmail], [sMatKhau], [sMaQuyen]) VALUES (N'21A10010315@students.hou.edu.vn', N'1234', N'sinhvien')
INSERT [dbo].[tblTaiKhoan] ([sEmail], [sMatKhau], [sMaQuyen]) VALUES (N'21A10015415@students.hou.edu.vn', N'1234', N'sinhvien')
INSERT [dbo].[tblTaiKhoan] ([sEmail], [sMatKhau], [sMaQuyen]) VALUES (N'admin@admin.com', N'123', N'admin')
INSERT [dbo].[tblTaiKhoan] ([sEmail], [sMatKhau], [sMaQuyen]) VALUES (N'nguoinhan1@gmail.com', N'123', N'nguoinhan')
INSERT [dbo].[tblTaiKhoan] ([sEmail], [sMatKhau], [sMaQuyen]) VALUES (N'nguoinhan123@gmail.com', N'123', N'nguoinhan')
INSERT [dbo].[tblTaiKhoan] ([sEmail], [sMatKhau], [sMaQuyen]) VALUES (N'nguoinhan3@gmail.com', N'123', N'nguoinhan')
INSERT [dbo].[tblTaiKhoan] ([sEmail], [sMatKhau], [sMaQuyen]) VALUES (N'nguoinhan456@gmail.com', N'123', N'nguoinhan')
INSERT [dbo].[tblTaiKhoan] ([sEmail], [sMatKhau], [sMaQuyen]) VALUES (N'nguoinhan5@gmail.com', N'123', N'nguoinhan')
INSERT [dbo].[tblTaiKhoan] ([sEmail], [sMatKhau], [sMaQuyen]) VALUES (N'nguoinhan7@gmail.com', N'123', N'nguoinhan')
INSERT [dbo].[tblTaiKhoan] ([sEmail], [sMatKhau], [sMaQuyen]) VALUES (N'nguoixuly0977@gmail.com', N'12', N'nguoixuly')
INSERT [dbo].[tblTaiKhoan] ([sEmail], [sMatKhau], [sMaQuyen]) VALUES (N'nguoixuly2@gmail.com', N'12', N'nguoixuly')
INSERT [dbo].[tblTaiKhoan] ([sEmail], [sMatKhau], [sMaQuyen]) VALUES (N'nguoixuly4@gmail.com', N'12', N'nguoixuly')
INSERT [dbo].[tblTaiKhoan] ([sEmail], [sMatKhau], [sMaQuyen]) VALUES (N'nguoixuly6@gmail.com', N'12', N'nguoixuly')
GO
INSERT [dbo].[tblTrangThai] ([sMaTT], [sTenTT]) VALUES (N'choxuly', N'Chờ xử lý')
INSERT [dbo].[tblTrangThai] ([sMaTT], [sTenTT]) VALUES (N'daxuly', N'Đã xử lý')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblNguoi__0CDBD6E3BFE7D45B]    Script Date: 30/03/2022 15:52:50 ******/
ALTER TABLE [dbo].[tblNguoiNhan] ADD UNIQUE NONCLUSTERED 
(
	[sEmail_NN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblNguoi__71B2ED4ADECE1291]    Script Date: 30/03/2022 15:52:50 ******/
ALTER TABLE [dbo].[tblNguoiXuLy] ADD UNIQUE NONCLUSTERED 
(
	[sEmail_NXL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblSinhV__0CDBFF4F70FFA253]    Script Date: 30/03/2022 15:52:50 ******/
ALTER TABLE [dbo].[tblSinhVien] ADD UNIQUE NONCLUSTERED 
(
	[sEmail_SV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDon]  WITH CHECK ADD  CONSTRAINT [FK_MaLoaiDon] FOREIGN KEY([sMaLoaiDon])
REFERENCES [dbo].[tblLoaiDon] ([sMaLoaiDon])
GO
ALTER TABLE [dbo].[tblDon] CHECK CONSTRAINT [FK_MaLoaiDon]
GO
ALTER TABLE [dbo].[tblDon]  WITH CHECK ADD  CONSTRAINT [FK_MaNguoiNhan] FOREIGN KEY([sEmail_NN])
REFERENCES [dbo].[tblNguoiNhan] ([sEmail_NN])
GO
ALTER TABLE [dbo].[tblDon] CHECK CONSTRAINT [FK_MaNguoiNhan]
GO
ALTER TABLE [dbo].[tblDon]  WITH CHECK ADD  CONSTRAINT [FK_MaNguoiXL] FOREIGN KEY([sEmail_NXL])
REFERENCES [dbo].[tblNguoiXuLy] ([sEmail_NXL])
GO
ALTER TABLE [dbo].[tblDon] CHECK CONSTRAINT [FK_MaNguoiXL]
GO
ALTER TABLE [dbo].[tblDon]  WITH CHECK ADD  CONSTRAINT [FK_MaSV] FOREIGN KEY([sEmail_SV])
REFERENCES [dbo].[tblSinhVien] ([sEmail_SV])
GO
ALTER TABLE [dbo].[tblDon] CHECK CONSTRAINT [FK_MaSV]
GO
ALTER TABLE [dbo].[tblDon]  WITH CHECK ADD  CONSTRAINT [FK_MaTT] FOREIGN KEY([sMaTT])
REFERENCES [dbo].[tblTrangThai] ([sMaTT])
GO
ALTER TABLE [dbo].[tblDon] CHECK CONSTRAINT [FK_MaTT]
GO
ALTER TABLE [dbo].[tblNguoiNhan]  WITH CHECK ADD  CONSTRAINT [FK_Email_NN] FOREIGN KEY([sEmail_NN])
REFERENCES [dbo].[tblTaiKhoan] ([sEmail])
GO
ALTER TABLE [dbo].[tblNguoiNhan] CHECK CONSTRAINT [FK_Email_NN]
GO
ALTER TABLE [dbo].[tblNguoiXuLy]  WITH CHECK ADD  CONSTRAINT [FK_Email_XL] FOREIGN KEY([sEmail_NXL])
REFERENCES [dbo].[tblTaiKhoan] ([sEmail])
GO
ALTER TABLE [dbo].[tblNguoiXuLy] CHECK CONSTRAINT [FK_Email_XL]
GO
ALTER TABLE [dbo].[tblSinhVien]  WITH CHECK ADD  CONSTRAINT [FK_Email_SV] FOREIGN KEY([sEmail_SV])
REFERENCES [dbo].[tblTaiKhoan] ([sEmail])
GO
ALTER TABLE [dbo].[tblSinhVien] CHECK CONSTRAINT [FK_Email_SV]
GO
ALTER TABLE [dbo].[tblTaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_MaQuyen] FOREIGN KEY([sMaQuyen])
REFERENCES [dbo].[tblQuyen] ([sMaQuyen])
GO
ALTER TABLE [dbo].[tblTaiKhoan] CHECK CONSTRAINT [FK_MaQuyen]
GO
ALTER TABLE [dbo].[tblThongBao]  WITH CHECK ADD  CONSTRAINT [FK_Don] FOREIGN KEY([sMaDon])
REFERENCES [dbo].[tblDon] ([sMaDon])
GO
ALTER TABLE [dbo].[tblThongBao] CHECK CONSTRAINT [FK_Don]
GO
/****** Object:  StoredProcedure [dbo].[addDon]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[addDon](@MaLoaiDon VARCHAR(50),@Email_SV VARCHAR(50),@Email_NN VARCHAR(50),
@NoiDung NVARCHAR(MAX),@TepDinhKem VARCHAR(256))
AS
BEGIN
	INSERT INTO tblDon(sMaDon,sMaLoaiDon,sEmail_SV,sEmail_NN,sMaTT,sNoiDung,sTepDinhKem,dNgayNhan)
	VALUES(NEWID(),@MaLoaiDon,@Email_SV,@Email_NN,'choxuly',@NoiDung,@TepDinhKem,GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[addLoaiDon]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--addLoaiDon
CREATE PROC [dbo].[addLoaiDon](@MaLoaiDon VARCHAR(50),@TenLoaiDon NVARCHAR(255))
AS
BEGIN
	INSERT INTO tblLoaiDon
	VALUES(@MaLoaiDon,@TenLoaiDon)
END
GO
/****** Object:  StoredProcedure [dbo].[addNguoitiepnhan]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[addNguoitiepnhan](@Email VARCHAR(50),@TenNN NVARCHAR(50),@Sdt VARCHAR(50),@MatKhau VARCHAR(15))
AS
BEGIN
	INSERT INTO tblTaiKhoan(sEmail,sMatKhau,sMaQuyen)
	VALUES(@Email,@MatKhau,'nguoinhan')

	INSERT INTO tblNguoiNhan(sMaNguoiNhan,sEmail_NN,sTenNguoiNhan,sChucVu,sSdt)
	VALUES(NEWID(),@Email,@TenNN,N'Người nhận',@Sdt)
END
GO
/****** Object:  StoredProcedure [dbo].[addNguoiXL]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[addNguoiXL](@Email_NXL VARCHAR(50),@TenNguoiXL NVARCHAR(50),@Sdt VARCHAR(50),@MatKhau VARCHAR(15))
AS
BEGIN
	INSERT INTO tblTaiKhoan(sEmail,sMatKhau,sMaQuyen)
	VALUES(@Email_NXL,@MatKhau,'nguoixuly')

	INSERT INTO tblNguoiXuLy(sMaNguoiXL,sEmail_NXL,sTenNguoiXL,sChucVu,sSdt)
	VALUES(NEWID(),@Email_NXL,@TenNguoiXL,N'Người xử lý',@Sdt)
END
GO
/****** Object:  StoredProcedure [dbo].[addSinhVien]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--addSinhVien
CREATE PROC [dbo].[addSinhVien](@MaSV VARCHAR(50),@Email_SV VARCHAR(50),@TenSV NVARCHAR(50),@LopHC VARCHAR(50))
AS
BEGIN
	INSERT INTO tblTaiKhoan(sEmail,sMatKhau,sMaQuyen)
	VALUES(@Email_SV,'1234','sinhvien')

	INSERT INTO tblSinhVien(sMaSV,sEmail_SV,sTenSV,sLopHC,sChucVu,sSdt)
	VALUES(@MaSV,@Email_SV,@TenSV,@LopHC,N'Sinh viên',NULL)
END
GO
/****** Object:  StoredProcedure [dbo].[detailDon_ChoXL]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[detailDon_ChoXL](@stringg UNIQUEIDENTIFIER)
AS
BEGIN
	SELECT * 
	FROM tblDon, tblLoaiDon, tblNguoiNhan, tblSinhVien, tblTrangThai
	WHERE tblDon.sMaLoaiDon = tblLoaiDon.sMaLoaiDon AND tblDon.sMaTT = tblTrangThai.sMaTT 
	AND tblDon.sEmail_NN = tblNguoiNhan.sEmail_NN AND tblDon.sEmail_SV = tblSinhVien.sEmail_SV
	AND tblTrangThai.sMaTT = 'choxuly' AND sMaDon = @stringg
	ORDER BY dNgayNhan DESC
END
GO
/****** Object:  StoredProcedure [dbo].[detailDon_ChuaXL]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[detailDon_ChuaXL](@stringg UNIQUEIDENTIFIER)
AS
BEGIN
	SELECT * 
	FROM tblDon, tblLoaiDon, tblNguoiNhan, tblSinhVien, tblTrangThai
	WHERE tblDon.sMaLoaiDon = tblLoaiDon.sMaLoaiDon AND tblDon.sMaTT = tblTrangThai.sMaTT 
	AND tblDon.sEmail_NN = tblNguoiNhan.sEmail_NN AND tblDon.sEmail_SV = tblSinhVien.sEmail_SV
	AND tblTrangThai.sMaTT = 'choxuly' AND sMaDon = @stringg
	ORDER BY dNgayNhan DESC
END
GO
/****** Object:  StoredProcedure [dbo].[detailDon_DaXL]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--detailDon_DaXL for admin
CREATE PROC [dbo].[detailDon_DaXL](@stringg UNIQUEIDENTIFIER)
AS
BEGIN
	SELECT * 
	FROM tblDon, tblLoaiDon, tblNguoiXuLy, tblNguoiNhan, tblSinhVien, tblTrangThai
	WHERE tblDon.sMaLoaiDon = tblLoaiDon.sMaLoaiDon AND tblDon.sMaTT = tblTrangThai.sMaTT 
	AND tblDon.sEmail_NN = tblNguoiNhan.sEmail_NN AND tblDon.sEmail_SV = tblSinhVien.sEmail_SV
	AND tblDon.sEmail_NXL = tblNguoiXuLy.sEmail_NXL AND tblTrangThai.sMaTT = 'daxuly' AND sMaDon = @stringg
END
GO
/****** Object:  StoredProcedure [dbo].[detailDon_ID]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[detailDon_ID](@stringg UNIQUEIDENTIFIER)
AS
BEGIN
	SELECT * 
	FROM tblNguoiXuLy,tblDon,tblSinhVien,tblNguoiNhan,tblLoaiDon,tblTrangThai
	WHERE tblNguoiXuLy.sEmail_NXL = tblDon.sEmail_NXL AND tblDon.sEmail_NN = tblNguoiNhan.sEmail_NN 
	AND tblDon.sEmail_SV = tblSinhVien.sEmail_SV AND tblLoaiDon.sMaLoaiDon = tblDon.sMaLoaiDon AND tblDon.sMaTT = tblTrangThai.sMaTT
	AND tblDon.sMaDon = @stringg
END
GO
/****** Object:  StoredProcedure [dbo].[detailLoaiDon]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--detailLoaiDon
CREATE PROC [dbo].[detailLoaiDon](@stringg VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblLoaiDon WHERE sMaLoaiDon = @stringg
END
GO
/****** Object:  StoredProcedure [dbo].[detailNguoinhan]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[detailNguoinhan](@stringg VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblNguoiNhan, tblTaiKhoan, tblQuyen WHERE tblNguoiNhan.sEmail_NN = tblTaiKhoan.sEmail
	AND tblQuyen.sMaQuyen = tblTaiKhoan.sMaQuyen AND tblQuyen.sMaQuyen = 'nguoinhan' AND sMaNguoiNhan = @stringg
END
GO
/****** Object:  StoredProcedure [dbo].[detailNguoinhan_Email]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--detailNguoitiepnhan
CREATE PROC [dbo].[detailNguoinhan_Email](@stringg VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblNguoiNhan, tblTaiKhoan, tblQuyen WHERE tblNguoiNhan.sEmail_NN = tblTaiKhoan.sEmail
	AND tblQuyen.sMaQuyen = tblTaiKhoan.sMaQuyen AND tblQuyen.sMaQuyen = 'nguoinhan' AND tblNguoiNhan.sEmail_NN = @stringg
END
GO
/****** Object:  StoredProcedure [dbo].[detailNguoixuly]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[detailNguoixuly](@stringg UNIQUEIDENTIFIER)
AS
BEGIN
		SELECT * FROM tblNguoiXuLy, tblTaiKhoan, tblQuyen WHERE tblNguoiXuLy.sEmail_NXL = tblTaiKhoan.sEmail 
		AND tblQuyen.sMaQuyen = tblTaiKhoan.sMaQuyen AND tblQuyen.sMaQuyen = 'nguoixuly' AND sMaNguoiXL = @stringg
END
GO
/****** Object:  StoredProcedure [dbo].[detailNguoixuly_Email]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[detailNguoixuly_Email](@stringg VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblNguoiXuLy, tblTaiKhoan, tblQuyen WHERE tblNguoiXuLy.sEmail_NXL = tblTaiKhoan.sEmail
	AND tblQuyen.sMaQuyen = tblTaiKhoan.sMaQuyen AND tblQuyen.sMaQuyen = 'nguoixuly' AND tblNguoiXuLy.sEmail_NXL = @stringg
END
GO
/****** Object:  StoredProcedure [dbo].[detailSinhvien]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[detailSinhvien](@stringg VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblSinhVien, tblTaiKhoan, tblQuyen WHERE tblSinhVien.sEmail_SV= tblTaiKhoan.sEmail 
	AND tblQuyen.sMaQuyen = tblTaiKhoan.sMaQuyen AND tblQuyen.sMaQuyen = 'sinhvien' AND sMaSV = @stringg
END
GO
/****** Object:  StoredProcedure [dbo].[dsDon]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsDon]
AS
BEGIN
	SELECT * 
	FROM tblDon, tblLoaiDon, tblNguoiXuLy, tblNguoiNhan, tblSinhVien, tblTrangThai
	WHERE tblDon.sMaLoaiDon = tblLoaiDon.sMaLoaiDon AND tblDon.sMaTT = tblTrangThai.sMaTT 
	AND tblDon.sEmail_NN = tblNguoiNhan.sEmail_NN AND tblDon.sEmail_SV = tblSinhVien.sEmail_SV
	AND tblDon.sEmail_NXL = tblNguoiXuLy.sEmail_NXL
END
GO
/****** Object:  StoredProcedure [dbo].[dsDon_ChuaXL]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsDon_ChuaXL]
AS
BEGIN
	SELECT * 
	FROM tblDon, tblLoaiDon, tblNguoiNhan, tblSinhVien, tblTrangThai
	WHERE tblDon.sMaLoaiDon = tblLoaiDon.sMaLoaiDon AND tblDon.sMaTT = tblTrangThai.sMaTT 
	AND tblDon.sEmail_NN = tblNguoiNhan.sEmail_NN AND tblDon.sEmail_SV = tblSinhVien.sEmail_SV
	AND tblTrangThai.sMaTT = 'choxuly'
	ORDER BY dNgayNhan DESC
END
GO
/****** Object:  StoredProcedure [dbo].[dsDon_DaXL]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsDon_DaXL]
AS
BEGIN
	SELECT * 
	FROM tblDon, tblLoaiDon, tblNguoiXuLy, tblNguoiNhan, tblSinhVien, tblTrangThai
	WHERE tblDon.sMaLoaiDon = tblLoaiDon.sMaLoaiDon AND tblDon.sMaTT = tblTrangThai.sMaTT 
	AND tblDon.sEmail_NN = tblNguoiNhan.sEmail_NN AND tblDon.sEmail_SV = tblSinhVien.sEmail_SV
	AND tblDon.sEmail_NXL = tblNguoiXuLy.sEmail_NXL AND tblTrangThai.sMaTT = 'daxuly'
END
GO
/****** Object:  StoredProcedure [dbo].[dsDon_Nguoinhan_ChoXL]    Script Date: 30/03/2022 15:52:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsDon_Nguoinhan_ChoXL](@stringg VARCHAR(50), @type VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblNguoiNhan,tblTaiKhoan,tblDon,tblSinhVien,tblLoaiDon,tblTrangThai
	WHERE tblNguoiNhan.sEmail_NN = tblTaiKhoan.sEmail AND tblDon.sMaLoaiDon = tblLoaiDon.sMaLoaiDon
	AND tblTrangThai.sMaTT = tblDon.sMaTT AND tblNguoiNhan.sEmail_NN = tblDon.sEmail_NN AND tblSinhVien.sEmail_SV = tblDon.sEmail_SV 
	AND tblTaiKhoan.sMaQuyen = 'nguoinhan' AND tblNguoiNhan.sEmail_NN = @stringg AND tblTrangThai.sMaTT = @type
END
GO
/****** Object:  StoredProcedure [dbo].[dsDon_Nguoinhan_DaXL]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsDon_Nguoinhan_DaXL](@stringg VARCHAR(50), @type VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblNguoiNhan,tblTaiKhoan,tblDon,tblSinhVien,tblLoaiDon,tblTrangThai
	WHERE tblNguoiNhan.sEmail_NN = tblTaiKhoan.sEmail AND tblDon.sMaLoaiDon = tblLoaiDon.sMaLoaiDon
	AND tblNguoiNhan.sEmail_NN = tblDon.sEmail_NN AND tblSinhVien.sEmail_SV = tblDon.sEmail_SV 
	AND tblTrangThai.sMaTT = tblDon.sMaTT AND tblTaiKhoan.sMaQuyen = 'nguoinhan' 
	AND tblNguoiNhan.sEmail_NN = @stringg AND tblTrangThai.sMaTT = @type
END
GO
/****** Object:  StoredProcedure [dbo].[dsDon_NguoiXl]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsDon_NguoiXl](@stringg VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblDon WHERE sEmail_NXL = @stringg
END
GO
/****** Object:  StoredProcedure [dbo].[dsDon_NguoiXl_ChoXL]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsDon_NguoiXl_ChoXL](@stringg VARCHAR(50), @type VARCHAR(50))
AS
BEGIN
	--SELECT * FROM tblDon,tblLoaiDon,tblSinhVien,tblNguoiNhan, tblTrangThai,tblNguoiXuLy
	--WHERE tblNguoiNhan.sEmail_NN = tblDon.sEmail_NN AND tblTrangThai.sMaTT = tblTrangThai.sMaTT AND tblNguoiXuLy.sEmail_NXL = tblDon.sEmail_NXL
	--AND tblSinhVien.sEmail_SV = tblSinhVien.sEmail_SV AND tblDon.sMaLoaiDon = tblLoaiDon.sMaLoaiDon 
	--AND tblTrangThai.sMaTT = '@type' AND tblDon.sEmail_NXL = @stringg 

	
	SELECT * 
	FROM tblNguoiXuLy,tblDon,tblSinhVien,tblNguoiNhan,tblLoaiDon,tblTrangThai
	WHERE tblNguoiXuLy.sEmail_NXL = tblDon.sEmail_NXL AND tblDon.sEmail_NN = tblNguoiNhan.sEmail_NN 
	AND tblDon.sEmail_SV = tblSinhVien.sEmail_SV AND tblLoaiDon.sMaLoaiDon = tblDon.sMaLoaiDon AND tblDon.sMaTT = tblTrangThai.sMaTT
	AND tblNguoiXuLy.sEmail_NXL = @stringg AND tblTrangThai.sMaTT = @type
END
GO
/****** Object:  StoredProcedure [dbo].[dsDon_NguoiXl_DaXL]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsDon_NguoiXl_DaXL](@stringg VARCHAR(50), @type VARCHAR(50))
AS
BEGIN
	SELECT * 
	FROM tblNguoiXuLy,tblDon,tblSinhVien,tblNguoiNhan,tblLoaiDon,tblTrangThai
	WHERE tblNguoiXuLy.sEmail_NXL = tblDon.sEmail_NXL AND tblDon.sEmail_NN = tblNguoiNhan.sEmail_NN 
	AND tblDon.sEmail_SV = tblSinhVien.sEmail_SV AND tblLoaiDon.sMaLoaiDon = tblDon.sMaLoaiDon AND tblDon.sMaTT = tblTrangThai.sMaTT
	AND tblNguoiXuLy.sEmail_NXL = @stringg AND tblTrangThai.sMaTT = @type
END
GO
/****** Object:  StoredProcedure [dbo].[dsDon_Thang]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--dsDon_Thang
CREATE PROC [dbo].[dsDon_Thang](@stringg VARCHAR(50))
AS
BEGIN
	SELECT * 
	FROM tblDon, tblLoaiDon, tblNguoiNhan, tblSinhVien, tblTrangThai
	WHERE tblDon.sMaLoaiDon = tblLoaiDon.sMaLoaiDon AND tblDon.sMaTT = tblTrangThai.sMaTT 
	AND tblDon.sEmail_NN = tblNguoiNhan.sEmail_NN AND tblDon.sEmail_SV = tblSinhVien.sEmail_SV
	AND tblTrangThai.sMaTT = 'choxuly' AND YEAR(dNgayNhan) = YEAR(GETDATE()) AND MONTH(dNgayNhan) = @stringg
	ORDER BY dNgayNhan DESC
END
GO
/****** Object:  StoredProcedure [dbo].[dsDonDaXL_Thang]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsDonDaXL_Thang](@stringg VARCHAR(50))
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
GO
/****** Object:  StoredProcedure [dbo].[dsLoaiDon]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsLoaiDon]
AS
BEGIN
	SELECT * FROM tblLoaiDon
END
GO
/****** Object:  StoredProcedure [dbo].[dsNguoitiepnhan]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsNguoitiepnhan](@stringg VARCHAR(50))
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
GO
/****** Object:  StoredProcedure [dbo].[dsNguoixuly]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsNguoixuly](@stringg VARCHAR(50))
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
GO
/****** Object:  StoredProcedure [dbo].[dsNguoixuly_ddl]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsNguoixuly_ddl]
AS
BEGIN
		SELECT * FROM tblNguoiXuLy, tblTaiKhoan, tblQuyen WHERE tblNguoiXuLy.sEmail_NXL = tblTaiKhoan.sEmail 
		AND tblQuyen.sMaQuyen = tblTaiKhoan.sMaQuyen AND tblQuyen.sMaQuyen = 'nguoixuly'
	
END
GO
/****** Object:  StoredProcedure [dbo].[dsQuyen]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsQuyen]
AS
BEGIN
	SELECT * FROM tblQuyen
END
GO
/****** Object:  StoredProcedure [dbo].[dsSinhvien]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsSinhvien]
AS
BEGIN
	SELECT * FROM tblSinhVien, tblTaiKhoan, tblQuyen WHERE tblSinhVien.sEmail_SV= tblTaiKhoan.sEmail 
	AND tblQuyen.sMaQuyen = tblTaiKhoan.sMaQuyen AND tblQuyen.sMaQuyen = 'sinhvien'
END
GO
/****** Object:  StoredProcedure [dbo].[dsSinhVien_Email]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--dsSinhVien_Email
CREATE PROC [dbo].[dsSinhVien_Email](@Email_SV NVARCHAR(50))
AS
BEGIN
	SELECT * FROM tblSinhVien WHERE sEmail_SV = @Email_SV
END
GO
/****** Object:  StoredProcedure [dbo].[loginUser]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[loginUser](@TaiKhoan VARCHAR(50), @MatKhau VARCHAR(15))
AS
BEGIN
	SELECT * FROM tblTaiKhoan, tblQuyen WHERE tblTaiKhoan.sMaQuyen = tblQuyen.sMaQuyen AND sEmail = @TaiKhoan AND sMatKhau = @MatKhau
END
GO
/****** Object:  StoredProcedure [dbo].[searchSinhVien]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[searchSinhVien](@TenSV NVARCHAR(50))
AS
BEGIN
	SELECT * FROM tblSinhVien WHERE sTenSV LIKE N'%' + @TenSV + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[slDon_ChoXL_Ngay]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[slDon_ChoXL_Ngay](@stringg VARCHAR(50))
AS
BEGIN
	SELECT COUNT(*) AS SLDon_ChoXL_Ngay 
	FROM tblDon 
	WHERE sMaTT = 'choxuly' AND sEmail_NXL = @stringg--'nguoixuly4@gmail.com' 
	AND MONTH(dNgayPhanCong) = MONTH(GETDATE()) AND DAY(dNgayPhanCong) = DAY(GETDATE()) AND YEAR(dNgayPhanCong) = YEAR(GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[slDon_ChoXL_Ngay_Admin]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[slDon_ChoXL_Ngay_Admin]
AS
BEGIN
	SELECT COUNT(*) AS SLDon_ChoXL_Ngay 
	FROM tblDon 
	WHERE sMaTT = 'choxuly' 
	AND MONTH(dNgayNhan) = MONTH(GETDATE()) AND DAY(dNgayNhan) = DAY(GETDATE()) AND YEAR(dNgayNhan) = YEAR(GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[slDon_ChoXL_Thang]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[slDon_ChoXL_Thang](@stringg VARCHAR(50))
AS
BEGIN
	SELECT COUNT(*) AS SLDon_ChoXL_Thang
	FROM tblDon 
	WHERE sMaTT = 'choxuly' AND sEmail_NXL = @stringg--'nguoixuly4@gmail.com' 
	AND MONTH(dNgayPhanCong) = MONTH(GETDATE()) AND YEAR(dNgayPhanCong) = YEAR(GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[slDon_ChoXL_Thang_Admin]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[slDon_ChoXL_Thang_Admin]
AS
BEGIN
	SELECT COUNT(*) AS SLDon_ChoXL_Thang
	FROM tblDon 
	WHERE sMaTT = 'choxuly'
	AND MONTH(dNgayNhan) = MONTH(GETDATE()) AND YEAR(dNgayNhan) = YEAR(GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[slDon_DaNhan_Ngay]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[slDon_DaNhan_Ngay](@stringg VARCHAR(50))
AS
BEGIN
	SELECT COUNT(*) AS SLDon_DaNhan_Ngay
	FROM tblDon 
	WHERE sEmail_NN = @stringg--'nguoinhan1@gmail.com'
	AND MONTH(dNgayNhan) = MONTH(GETDATE()) AND DAY(dNgayNhan) = DAY(GETDATE()) AND YEAR(dNgayNhan) = YEAR(GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[slDon_DaNhan_Thang]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[slDon_DaNhan_Thang](@stringg VARCHAR(50))
AS
BEGIN
	SELECT COUNT(*) AS SLDon_DaNhan_Thang
	FROM tblDon 
	WHERE sEmail_NN = @stringg--'nguoinhan1@gmail.com'
	AND MONTH(dNgayNhan) = MONTH(GETDATE()) AND YEAR(dNgayNhan) = YEAR(GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[slDon_DaXL_Ngay]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[slDon_DaXL_Ngay](@stringg VARCHAR(50))
AS
BEGIN
	SELECT COUNT(*) AS SLDon_DaXL_Ngay 
	FROM tblDon 
	WHERE sMaTT = 'daxuly' AND sEmail_NXL = @stringg--'nguoixuly4@gmail.com' 
	AND MONTH(dNgayxuly) = MONTH(GETDATE()) AND DAY(dNgayxuly) = DAY(GETDATE()) AND YEAR(dNgayxuly) = YEAR(GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[slDon_DaXL_Ngay_Admin]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[slDon_DaXL_Ngay_Admin]
AS
BEGIN
	SELECT COUNT(*) AS SLDon_DaXL_Ngay 
	FROM tblDon 
	WHERE sMaTT = 'daxuly'
	AND MONTH(dNgayPhanCong) = MONTH(GETDATE()) AND DAY(dNgayPhanCong) = DAY(GETDATE()) AND YEAR(dNgayPhanCong) = YEAR(GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[slDon_DaXL_Thang]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[slDon_DaXL_Thang](@stringg VARCHAR(50))
AS
BEGIN
	SELECT COUNT(*) AS SLDon_DaXL_Thang
	FROM tblDon 
	WHERE sMaTT = 'daxuly' AND sEmail_NXL = @stringg--'nguoixuly4@gmail.com' 
	AND MONTH(dNgayxuly) = MONTH(GETDATE()) AND YEAR(dNgayxuly) = YEAR(GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[slDon_DaXL_Thang_Admin]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[slDon_DaXL_Thang_Admin]
AS
BEGIN
	SELECT COUNT(*) AS SLDon_DaXL_Thang
	FROM tblDon 
	WHERE sMaTT = 'daxuly'
	AND MONTH(dNgayxuly) = MONTH(GETDATE()) AND YEAR(dNgayxuly) = YEAR(GETDATE())
END
--===
GO
/****** Object:  StoredProcedure [dbo].[TEST]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TEST](@sEmail VARCHAR(50), @sEmail2 VARCHAR(50))
AS
BEGIN
	UPDATE tblNguoiNhan SET sEmail_NN= @sEmail WHERE sEmail_NN = @sEmail2

	UPDATE tblTaiKhoan SET sEmail = @sEmail WHERE sEmail = @sEmail2
END
GO
/****** Object:  StoredProcedure [dbo].[updateDon]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[updateDon](@MaDon UNIQUEIDENTIFIER, @Email_NXL VARCHAR(50))
AS
BEGIN
	UPDATE tblDon
	SET sEmail_NXL = @Email_NXL, dNgayPhanCong = GETDATE()
	WHERE sMaDon = @MaDon
END
GO
/****** Object:  StoredProcedure [dbo].[updateLoaiDon]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--updateLoaiDon
CREATE PROC [dbo].[updateLoaiDon](@MaLoaiDon VARCHAR(50),@TenLoaiDon NVARCHAR(255))
AS
BEGIN
	UPDATE tblLoaiDon
	SET sTenLoaiDon = @TenLoaiDon
	WHERE sMaLoaiDon = @MaLoaiDon
END
GO
/****** Object:  StoredProcedure [dbo].[updateNguoitiepnhan]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[updateNguoitiepnhan](@MaNN UNIQUEIDENTIFIER,@TenNN NVARCHAR(50),@Sdt VARCHAR(50))
AS
BEGIN
	UPDATE tblNguoiNhan
	SET sTenNguoiNhan = @TenNN, sSdt = @Sdt
	WHERE sMaNguoiNhan = @MaNN
END
GO
/****** Object:  StoredProcedure [dbo].[updateNguoixuly]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[updateNguoixuly](@MaNXL UNIQUEIDENTIFIER,@TenNXL NVARCHAR(50),@Sdt VARCHAR(50))
AS
BEGIN
	UPDATE tblNguoiXuLy
	SET sTenNguoiXL = @TenNXL,sSdt = @Sdt
	WHERE sMaNguoiXL = @MaNXL
END
GO
/****** Object:  StoredProcedure [dbo].[updateSinhVien]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--updateSinhVien
CREATE PROC [dbo].[updateSinhVien](@MaSV VARCHAR(50),@TenSV NVARCHAR(50),@LopHC VARCHAR(50))
AS
BEGIN
	UPDATE tblSinhVien
	SET sTenSV = @TenSV,sLopHC = @LopHC
	WHERE sMaSV = @MaSV
END
GO
/****** Object:  StoredProcedure [dbo].[xacnhanDon]    Script Date: 30/03/2022 15:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--xacnhanDon
CREATE PROC [dbo].[xacnhanDon](@MaDon UNIQUEIDENTIFIER)
AS
BEGIN
	UPDATE tblDon
	SET sMaTT = 'daxuly', dNgayXuLy = GETDATE()
	WHERE sMaDon = @MaDon
END
GO
USE [master]
GO
ALTER DATABASE [QUANLYGIAYTO] SET  READ_WRITE 
GO
