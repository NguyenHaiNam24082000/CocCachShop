USE [master]
GO
/****** Object:  Database [QuanLiBanHang]    Script Date: 06/05/2021 9:06:18 SA ******/
CREATE DATABASE [QuanLiBanHang]
GO
ALTER DATABASE [QuanLiBanHang] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLiBanHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLiBanHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLiBanHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLiBanHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLiBanHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLiBanHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLiBanHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLiBanHang] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLiBanHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLiBanHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLiBanHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLiBanHang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLiBanHang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLiBanHang] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuanLiBanHang] SET QUERY_STORE = OFF
GO
USE [QuanLiBanHang]
GO
/****** Object:  Table [dbo].[tAnh]    Script Date: 06/05/2021 9:06:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tAnh](
	[MaAnh] [nvarchar](10) NOT NULL,
	[MaSP] [nvarchar](10) NOT NULL,
	[LinkAnh] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tAnh] PRIMARY KEY CLUSTERED 
(
	[MaAnh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tChatLieu]    Script Date: 06/05/2021 9:06:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tChatLieu](
	[MaCL] [nchar](10) NOT NULL,
	[TenCL] [nvarchar](50) NULL,
 CONSTRAINT [PK_tChatLieu] PRIMARY KEY CLUSTERED 
(
	[MaCL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tChiTietHDB]    Script Date: 06/05/2021 9:06:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tChiTietHDB](
	[MaDonHang] [nvarchar](50) NOT NULL,
	[MaSP] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NULL,
	[Gia] [int] NULL,
	[TongTien] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tChiTietMau]    Script Date: 06/05/2021 9:06:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tChiTietMau](
	[MaMau] [nchar](10) NOT NULL,
	[MaSP] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tDanhGia]    Script Date: 06/05/2021 9:06:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDanhGia](
	[MaSP] [nvarchar](50) NOT NULL,
	[IDKhach] [nvarchar](50) NOT NULL,
	[NoiDung] [nvarchar](300) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tDanhMucSP]    Script Date: 06/05/2021 9:06:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDanhMucSP](
	[MaSP] [nvarchar](50) NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[Gia] [int] NULL,
	[MaMau] [nvarchar](10) NULL,
	[KhuyenMai] [nvarchar](50) NULL,
	[LuotXem] [int] NULL,
	[SoLuong] [int] NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaCL] [nvarchar](10) NULL,
	[MaHangSX] [nvarchar](10) NULL,
	[MaLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_tDanhMucSP] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tDonHang]    Script Date: 06/05/2021 9:06:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDonHang](
	[MaDonHang] [nvarchar](50) NOT NULL,
	[IDKhach] [nvarchar](50) NOT NULL,
	[MaVanChuyen] [nchar](10) NOT NULL,
	[NgayBan] [nvarchar](20) NULL,
	[TongTien] [int] NULL,
	[MaNV] [nvarchar](50) NULL,
 CONSTRAINT [PK_tDonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tHangSX]    Script Date: 06/05/2021 9:06:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tHangSX](
	[MaHangSX] [nchar](10) NOT NULL,
	[TenHangSX] [nvarchar](50) NULL,
 CONSTRAINT [PK_tHangSX] PRIMARY KEY CLUSTERED 
(
	[MaHangSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tKhachHang]    Script Date: 06/05/2021 9:06:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tKhachHang](
	[IDKhach] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](300) NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_tKhachHang] PRIMARY KEY CLUSTERED 
(
	[IDKhach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tLoaiSP]    Script Date: 06/05/2021 9:06:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tLoaiSP](
	[MaLoai] [nchar](10) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_tLoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tMauSac]    Script Date: 06/05/2021 9:06:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tMauSac](
	[MaMau] [nchar](10) NOT NULL,
	[TenMau] [nvarchar](50) NULL,
 CONSTRAINT [PK_tMauSac] PRIMARY KEY CLUSTERED 
(
	[MaMau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tNhanVien]    Script Date: 06/05/2021 9:06:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNhanVien](
	[MaNV] [nchar](10) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[GioiTinh] [nchar](10) NULL,
	[SDT] [nchar](10) NULL,
	[QuyenAdmin] [int] NULL,
 CONSTRAINT [PK_tNhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tVanChuyen]    Script Date: 06/05/2021 9:06:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tVanChuyen](
	[MaVanChuyen] [nchar](10) NOT NULL,
	[DonViVanChuyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_tVanChuyen] PRIMARY KEY CLUSTERED 
(
	[MaVanChuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tVideo]    Script Date: 06/05/2021 9:06:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tVideo](
	[MaVideo] [nvarchar](50) NOT NULL,
	[LinkVideo] [nvarchar](max) NULL,
 CONSTRAINT [PK_tVideo] PRIMARY KEY CLUSTERED 
(
	[MaVideo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[tAnh] ([MaAnh], [MaSP], [LinkAnh]) VALUES (N'SP000010', N'SP00001', N'https://firebasestorage.googleapis.com/v0/b/coccachshop-25db4.appspot.com/o/Images%2F1620153088507-6aaf3e293eacfb50cfd054d69d6ec463_thumb.jpg?alt=media')
GO
INSERT [dbo].[tAnh] ([MaAnh], [MaSP], [LinkAnh]) VALUES (N'SP000011', N'SP00001', N'https://firebasestorage.googleapis.com/v0/b/coccachshop-25db4.appspot.com/o/Images%2F1620153093446-31cb8ca0a0bf76615f8ed654bd90027b_thumb.jpg?alt=media')
GO
INSERT [dbo].[tAnh] ([MaAnh], [MaSP], [LinkAnh]) VALUES (N'SP000012', N'SP00001', N'https://firebasestorage.googleapis.com/v0/b/coccachshop-25db4.appspot.com/o/Images%2F1620153098070-2844f3dabdf3acc6259723f9c9fc0db0.jpg?alt=media')
GO
INSERT [dbo].[tAnh] ([MaAnh], [MaSP], [LinkAnh]) VALUES (N'SP000020', N'SP00002', N'https://firebasestorage.googleapis.com/v0/b/coccachshop-25db4.appspot.com/o/Images%2F1620197702197-643f6f7036a41e9100cefbcf4b0392c2_thumb.jpg?alt=media')
GO
INSERT [dbo].[tAnh] ([MaAnh], [MaSP], [LinkAnh]) VALUES (N'SP000021', N'SP00002', N'https://firebasestorage.googleapis.com/v0/b/coccachshop-25db4.appspot.com/o/Images%2F1620197705311-a9d888ae3347a0c147239b109dbdc9b8_thumb.jpg?alt=media')
GO
INSERT [dbo].[tAnh] ([MaAnh], [MaSP], [LinkAnh]) VALUES (N'SP000030', N'SP00003', N'https://firebasestorage.googleapis.com/v0/b/coccachshop-25db4.appspot.com/o/Images%2F1620213248769-c1ca1172ba51bdd4b1536d5f55d91bde_thumb.jpg?alt=media')
GO
INSERT [dbo].[tAnh] ([MaAnh], [MaSP], [LinkAnh]) VALUES (N'SP000031', N'SP00003', N'https://firebasestorage.googleapis.com/v0/b/coccachshop-25db4.appspot.com/o/Images%2F1620213250429-bedda5aa9110206ed1c2ab5a09e3449a_thumb.jpg?alt=media')
GO
INSERT [dbo].[tAnh] ([MaAnh], [MaSP], [LinkAnh]) VALUES (N'SP000032', N'SP00003', N'https://firebasestorage.googleapis.com/v0/b/coccachshop-25db4.appspot.com/o/Images%2F1620213253053-cce1b75127b867d066d927054ec7e8bc.jpg?alt=media')
GO
INSERT [dbo].[tAnh] ([MaAnh], [MaSP], [LinkAnh]) VALUES (N'SP000040', N'SP00004', N'https://firebasestorage.googleapis.com/v0/b/coccachshop-25db4.appspot.com/o/Images%2F1620224773188-0f59f61bf67f56d9a8c078d4056c19f6_thumb.jpg?alt=media')
GO
INSERT [dbo].[tAnh] ([MaAnh], [MaSP], [LinkAnh]) VALUES (N'SP000041', N'SP00004', N'https://firebasestorage.googleapis.com/v0/b/coccachshop-25db4.appspot.com/o/Images%2F1620224776173-1a1b09335bb3456fdb7f94f0b8778b7e_thumb.jpg?alt=media')
GO
INSERT [dbo].[tAnh] ([MaAnh], [MaSP], [LinkAnh]) VALUES (N'SP000042', N'SP00004', N'https://firebasestorage.googleapis.com/v0/b/coccachshop-25db4.appspot.com/o/Images%2F1620224778524-2ccff24048ecc5593e8fbcdc7d42403e_thumb.jpg?alt=media')
GO
INSERT [dbo].[tAnh] ([MaAnh], [MaSP], [LinkAnh]) VALUES (N'SP000060', N'SP00006', N'https://firebasestorage.googleapis.com/v0/b/coccachshop-25db4.appspot.com/o/Images%2F1620264323825-4a3feb98_e906_46d2_9caa_393ac07e251f.jpeg?alt=media')
GO
INSERT [dbo].[tAnh] ([MaAnh], [MaSP], [LinkAnh]) VALUES (N'SP000061', N'SP00006', N'https://firebasestorage.googleapis.com/v0/b/coccachshop-25db4.appspot.com/o/Images%2F1620264325815-6aaf3e293eacfb50cfd054d69d6ec463_thumb.jpg?alt=media')
GO
INSERT [dbo].[tAnh] ([MaAnh], [MaSP], [LinkAnh]) VALUES (N'SP000501', N'SP00050', N'https://firebasestorage.googleapis.com/v0/b/coccachshop-25db4.appspot.com/o/Images%2F1620200113398-2844f3dabdf3acc6259723f9c9fc0db0.jpg?alt=media')
GO
INSERT [dbo].[tAnh] ([MaAnh], [MaSP], [LinkAnh]) VALUES (N'SP000511', N'SP00051', N'https://firebasestorage.googleapis.com/v0/b/coccachshop-25db4.appspot.com/o/Images%2F1620200340934-359d28d5e79f6c5a0bd0c1ae5fe0d930.jpg?alt=media')
GO
INSERT [dbo].[tAnh] ([MaAnh], [MaSP], [LinkAnh]) VALUES (N'SP000521', N'SP00052', N'https://firebasestorage.googleapis.com/v0/b/coccachshop-25db4.appspot.com/o/Images%2F1620200495481-643f6f7036a41e9100cefbcf4b0392c2_thumb.jpg?alt=media')
GO
INSERT [dbo].[tAnh] ([MaAnh], [MaSP], [LinkAnh]) VALUES (N'SP000560', N'SP00056', N'https://firebasestorage.googleapis.com/v0/b/coccachshop-25db4.appspot.com/o/Images%2F1620202894370-c1ca1172ba51bdd4b1536d5f55d91bde_thumb.jpg?alt=media')
GO
INSERT [dbo].[tAnh] ([MaAnh], [MaSP], [LinkAnh]) VALUES (N'SP000561', N'SP00056', N'https://firebasestorage.googleapis.com/v0/b/coccachshop-25db4.appspot.com/o/Images%2F1620202895858-bedda5aa9110206ed1c2ab5a09e3449a_thumb.jpg?alt=media')
GO
INSERT [dbo].[tAnh] ([MaAnh], [MaSP], [LinkAnh]) VALUES (N'SP000570', N'SP00057', N'https://firebasestorage.googleapis.com/v0/b/coccachshop-25db4.appspot.com/o/Images%2F1620202999308-c1ca1172ba51bdd4b1536d5f55d91bde_thumb.jpg?alt=media')
GO
INSERT [dbo].[tAnh] ([MaAnh], [MaSP], [LinkAnh]) VALUES (N'SP000571', N'SP00057', N'https://firebasestorage.googleapis.com/v0/b/coccachshop-25db4.appspot.com/o/Images%2F1620203001049-bedda5aa9110206ed1c2ab5a09e3449a_thumb.jpg?alt=media')
GO
INSERT [dbo].[tChatLieu] ([MaCL], [TenCL]) VALUES (N'CL01      ', N'Thun')
GO
INSERT [dbo].[tChatLieu] ([MaCL], [TenCL]) VALUES (N'CL02      ', N'Len')
GO
INSERT [dbo].[tChatLieu] ([MaCL], [TenCL]) VALUES (N'CL03      ', N'Da')
GO
INSERT [dbo].[tChatLieu] ([MaCL], [TenCL]) VALUES (N'CL04      ', N'Titan')
GO
INSERT [dbo].[tChatLieu] ([MaCL], [TenCL]) VALUES (N'CL05      ', N'Kaki')
GO
INSERT [dbo].[tChatLieu] ([MaCL], [TenCL]) VALUES (N'CL06      ', N'Mạ bạc')
GO
INSERT [dbo].[tChatLieu] ([MaCL], [TenCL]) VALUES (N'CL07      ', N'Vải')
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'001', N'SP00004', 34, 70000, 600000)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'001', N'SP00001', 34, 70000, 600000)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'002', N'SP00002', 12, 450000, 15234800)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'002', N'SP00004', 25, 450000, 45210000)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'003', N'SP00005', 24, 4500000, 13213213)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'004', N'SP00003', 24, 450000, 321321321)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'006', N'SP00007', 25, 654654, 654654654)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'005', N'SP00009', 45, 654654, 654654654)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'007', N'SP00010', 65, 321564, 654654654)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'008', N'SP00011', 54, 654897, 654897987)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'009', N'SP00013', 74, 654654, 987987987)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'010', N'SP00016', 75, 564654, 654654654)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'011', N'SP00019', 85, 564654, 987987987)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'012', N'SP00021', 87, 654654, 654654654)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'013', N'SP00023', 56, 654564, 897987654)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'014', N'SP00008', 30, 546576, 54756695)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'015', N'SP00004', 45, 345000, 43576878)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'016', N'SP00008', 34, 436576, 325436745)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'017', N'SP00012', 20, 346576, 46575645)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'018', N'SP00014', 12, 534654, 35436544)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'019', N'SP00015', 3, 346457, 36576876)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'020', N'SP00017', 21, 35436543, 23346534)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'021', N'SP00018', 34, 36546754, 2354364)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'022', N'SP00012', 41, 4645765, 5465467)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'023', N'SP00020', 12, 4354654, 3454364)
GO
INSERT [dbo].[tChiTietHDB] ([MaDonHang], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (N'024', N'SP00021', 34, 4365464, 3464565)
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00001', N'Áo phông cao cấp Sun Flower1', 290000, NULL, NULL, 0, 56, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00002', N'Áo phông cao cấp CARTOON CAT', 290000, N'M03', NULL, 0, 99, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00003', N'Áo phông cao cấp FACE', 260000, N'M06', NULL, 0, 21, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00004', N'Áo phông cao cấp MADE ZOWWY', 290000, N'M01', NULL, 0, 12, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00005', N'Áo phông cao cấp UNNERSE', 260000, N'M02', NULL, 0, 25, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00006', N'Áo phông cao cấp ZOWWY', 260000, N'M03', NULL, 0, 34, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00007', N'Áo phông cao cấp AWAY NEPRINGE', 260000, N'M07', NULL, 0, 2, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00008', N'Áo phông cao cấp Smile TSS21015', 290000, N'M01', NULL, 0, 3, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00009', N'Áo phông cao cấp TIDEEKU', 290000, N'M03', NULL, 0, 5, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00010', N'Áo sơ mi hoạ tiết SM5227', 290000, N'M04', NULL, 0, 4, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00011', N'Áo phông cao cấp Smile TSS6203', 290000, N'M06', NULL, 0, 7, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00012', N'Áo khoác cao cấp mũ lông', 290000, N'M01', NULL, 0, 9, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00013', N'Áo ni hoạ tiết yestoall', 290000, N'M06', NULL, 0, 1, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00014', N'Áo len gile cao cấp AL919', 290000, N'M02', NULL, 0, 0, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00015', N'Áo khoác cao cấp caro AK392', 290000, N'M04', NULL, 0, 3, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00016', N'Áo nỉ cat in the house', 290000, N'M05', NULL, 0, 4, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00020', N'Áo phông in cao cấp Load Manifest', 290000, N'M01', NULL, 0, 9, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00021', N'Áo phông Slipknot " you can "', 260000, N'M04', NULL, 0, 5, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00022', N'Áo phông hoạ tiết Panting', 450000, N'M01', NULL, 0, 1, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00023', N'Áo phông Provocation', 450000, N'M02', NULL, 0, 3, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00024', N'Áo phông in cao cấp Slipknot brown', 290000, N'M03', NULL, 0, 6, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00025', N'Áo phông in cao cấp Fire', 290000, N'M05', NULL, 0, 9, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00026', N'Quần vải cao cấp Q0522', 260000, N'M06', NULL, 0, 7, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00027', N'Quần shorts basic COCCACH QSCCS1', 260000, N'M06', NULL, 0, 5, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00028', N'Quần vải cao cấp basic Q0098', 450000, N'M06', NULL, 0, 2, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00029', N'Quần shorts cao cấp tua gấu QS8870', 290000, N'M05', NULL, 0, 0, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00030', N'Quần kaki cao cấp Q87146', 260000, N'M05', NULL, 0, 3, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00031', N'Quần jeans cao cấp basic Q14045', 290000, NULL, N'', 0, 4, NULL, N'CL01', NULL, N'L01')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00032', N'Quần short 2 sọc', 450000, N'M05', NULL, 0, 6, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00033', N'Quần jeans suông cao cấp Q102', 290000, N'M07', NULL, 0, 9, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00034', N'Quần jeans sọc trắng zip gấu QD628', 290000, N'M07', NULL, 0, 2, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00035', N'Quần jeans suông cao cấp Q108', 290000, N'M07', NULL, 0, 6, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00036', N'Quần nỉ 3 sọc', 450000, N'M02', NULL, 0, 3, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00037', N'Quần jeans zip gấu', 260000, N'M02', NULL, 0, 4, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00038', N'Quần shorts hoa', 390000, N'M02', NULL, 0, 9, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00039', N'Quần shots ống rộng', 290000, N'M02', NULL, 0, 6, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00040', N'Quần shorts ống suông', 290000, N'M02', NULL, 0, 9, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00041', N'Quần jeans rách gối', 260000, N'M02', NULL, 0, 1, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00042', N'Quần nỉ 2 sọc', 290000, N'M01', NULL, 0, 2, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00043', N'Quần nỉ 3 sọc', 450000, N'M01', NULL, 0, 3, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00044', N'Quần caro cao cấp', 290000, N'M01', NULL, 0, 9, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00045', N'Quần jeans biker', 260000, N'M01', NULL, 0, 7, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00046', N'Quần jeans rách đùi zip gấu', 290000, N'M05', NULL, 0, 8, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00047', N'Quần vải cao cấp QKZ626', 450000, N'M05', NULL, 0, 9, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00048', N'Quần đùi', 290000, N'M05', NULL, 0, 7, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00049', N'Quần vải', 260000, N'M05', NULL, 0, 5, NULL, N'CL01', NULL, N'L02')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00052', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [Gia], [MaMau], [KhuyenMai], [LuotXem], [SoLuong], [MoTa], [MaCL], [MaHangSX], [MaLoai]) VALUES (N'SP00057', NULL, NULL, NULL, NULL, 0, NULL, NULL, N'CL01', NULL, NULL)
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'001       ', N'kh01      ', N'MVC001    ', N'2019-01-01', 90000, N'NV001')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'002       ', N'kh02      ', N'MVC002    ', N'2019-02-01', 160000, N'NV002')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'003       ', N'IDK0002   ', N'MVC003    ', N'2019-03-02', 160000, N'NV002')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'004       ', N'IDK0003   ', N'MVC001    ', N'2019-04-03', 160000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'005       ', N'IDK0001   ', N'MVC001    ', N'2019-05-03', 320000, N'NV005')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'006       ', N'IDK0002   ', N'MVC001    ', N'2019-06-03', 400000, N'NV006')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'007       ', N'IDK0003   ', N'MVC001    ', N'2019-07-03', 670000, N'NV007')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'008       ', N'IDK0001   ', N'MVC002    ', N'2019-08-03', 680000, N'NV008')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'009       ', N'IDK0003   ', N'MVC001    ', N'2019-09-03', 660000, N'NV001')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'010       ', N'IDK0003   ', N'MVC001    ', N'2019-10-03', 520000, N'NV002')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'011       ', N'IDK0003   ', N'MVC001    ', N'2019-11-03', 840000, N'NV003')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'012       ', N'IDK0003   ', N'MVC001    ', N'2019-12-03', 720000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'013       ', N'IDK0003   ', N'MVC001    ', N'2020-01-03', 840000, N'NV005')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'014       ', N'IDK0003   ', N'MVC001    ', N'2020-02-03', 1080000, N'NV006')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'015       ', N'IDK0003   ', N'MVC001    ', N'2020-03-03', 1200000, N'NV007')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'016       ', N'IDK0003   ', N'MVC001    ', N'2020-04-03', 1500000, N'NV008')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'017       ', N'IDK0003   ', N'MVC001    ', N'2020-05-03', 840000, N'NV001')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'018       ', N'IDK0003   ', N'MVC001    ', N'2020-06-03', 960000, N'NV002')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'019       ', N'IDK0003   ', N'MVC001    ', N'2020-07-03', 720000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'020       ', N'IDK0003   ', N'MVC001    ', N'2020-08-03', 650000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'021       ', N'IDK0003   ', N'MVC001    ', N'2020-09-03', 1400000, N'NV005')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'022       ', N'IDK0003   ', N'MVC001    ', N'2020-10-03', 1600000, N'NV006')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'023       ', N'IDK0003   ', N'MVC001    ', N'2020-11-03', 720000, N'NV007')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'024       ', N'IDK0003   ', N'MVC001    ', N'2020-12-03', 1200000, N'NV006')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'025       ', N'IDK0003   ', N'MVC001    ', N'2021-04-03', 1240000, N'NV001')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'026       ', N'IDK0003   ', N'MVC001    ', N'2020-12-04', 660000, N'NV002')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'027       ', N'IDK0003   ', N'MVC001    ', N'2021-04-03', 760000, N'NV003')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'028', N'IDK0001', N'MVC003    ', N'2021-05-06', 10000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'029', N'IDK0001', N'MVC001    ', N'2021-05-06', 290000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'030', N'IDK0001', N'MVC001    ', N'2021-05-06', 290000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'031', N'IDK0001', N'MVC001    ', N'2021-05-06', 290000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'032', N'IDK0001', N'MVC001    ', N'2021-05-06', 290000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'033', N'IDK0001', N'MVC001    ', N'2021-05-06', 290000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'034', N'IDK0001', N'MVC001    ', N'2021-05-06', 290000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'035', N'IDK0001', N'MVC001    ', N'2021-05-06', 290000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'036', N'IDK0001', N'MVC001    ', N'2021-05-06', 290000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'037', N'IDK0001', N'MVC001    ', N'2021-05-06', 290000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'038', N'IDK0001', N'MVC001    ', N'2021-05-06', 290000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'039', N'IDK0001', N'MVC001    ', N'2021-05-06', 290000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'040', N'IDK0001', N'MVC001    ', N'2021-05-06', 290000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'041', N'IDK0001', N'MVC001    ', N'2021-05-06', 290000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'042', N'IDK0001', N'MVC001    ', N'2021-05-06', 290000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'043', N'IDK0001', N'MVC001    ', N'2021-05-06', 290000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'044', N'IDK0001', N'MVC001    ', N'2021-05-06', 290000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'045', N'IDK0001', N'MVC001    ', N'2021-05-06', 290000, N'NV004')
GO
INSERT [dbo].[tDonHang] ([MaDonHang], [IDKhach], [MaVanChuyen], [NgayBan], [TongTien], [MaNV]) VALUES (N'046', N'IDK0001', N'MVC001    ', N'2021-05-06', 290000, N'NV004')
GO
INSERT [dbo].[tKhachHang] ([IDKhach], [Username], [Password], [HoTen], [SDT], [DiaChi], [GioiTinh], [Email]) VALUES (N'IDK0001', N'Bong', N'202cb962ac59075b964b07152d234b70', N'Nguyễn Thị Bông', N'01236548', N'Số Nhà 23, Ngõ 1074, Láng Thượng,HN', N'Nam', N'nghainam2000123@gmail.com')
GO
INSERT [dbo].[tKhachHang] ([IDKhach], [Username], [Password], [HoTen], [SDT], [DiaChi], [GioiTinh], [Email]) VALUES (N'IDK0002', N'Phuong', N'123456', N'Phạm Nam', N'0965782125', N'Ngách 12, Ngõ 898, Đường Láng', N'Nam       ', NULL)
GO
INSERT [dbo].[tKhachHang] ([IDKhach], [Username], [Password], [HoTen], [SDT], [DiaChi], [GioiTinh], [Email]) VALUES (N'IDK0003', N'Nam', N'123456', N'Vũ Hà', N'0363125785', N'155 Cầu Giấy, Hà Nội', N'Nữ', NULL)
GO
INSERT [dbo].[tKhachHang] ([IDKhach], [Username], [Password], [HoTen], [SDT], [DiaChi], [GioiTinh], [Email]) VALUES (N'IDK0004', N'Nam', N'123456', N'Vũ Hà', N'0363125785', N'155 Cầu Giấy, Hà Nội', N'Nữ', NULL)
GO
INSERT [dbo].[tKhachHang] ([IDKhach], [Username], [Password], [HoTen], [SDT], [DiaChi], [GioiTinh], [Email]) VALUES (N'IDK0005 ', N'Nam', N'123456', N'Vũ Hà', N'01235456', N'155 Cầu Giấy, Hà Nội', N'Nữ', NULL)
GO
INSERT [dbo].[tKhachHang] ([IDKhach], [Username], [Password], [HoTen], [SDT], [DiaChi], [GioiTinh], [Email]) VALUES (N'IDK0006', N'Nam', N'123456', N'Vũ Hà', N'0363125785', N'155 Cầu Giấy, Hà Nội', N'Nữ        ', NULL)
GO
INSERT [dbo].[tKhachHang] ([IDKhach], [Username], [Password], [HoTen], [SDT], [DiaChi], [GioiTinh], [Email]) VALUES (N'IDK0007', N'Nam', N'123456', N'Vũ Hà', N'0363125785', N'155 Cầu Giấy, Hà Nội', N'Nữ', NULL)
GO
INSERT [dbo].[tKhachHang] ([IDKhach], [Username], [Password], [HoTen], [SDT], [DiaChi], [GioiTinh], [Email]) VALUES (N'IDK0008', N'hainam12345', N'202CB962AC59075B964B07152D234B70', N'Nguyễn Hải Nam', N'0132154658', N'hainam', N'null', N'nghainam200120@gmail.com')
GO
INSERT [dbo].[tLoaiSP] ([MaLoai], [TenLoai]) VALUES (N'L01       ', N'Áo')
GO
INSERT [dbo].[tLoaiSP] ([MaLoai], [TenLoai]) VALUES (N'L02       ', N'Quần')
GO
INSERT [dbo].[tLoaiSP] ([MaLoai], [TenLoai]) VALUES (N'L03       ', N'Phụ kiện unisex')
GO
INSERT [dbo].[tLoaiSP] ([MaLoai], [TenLoai]) VALUES (N'L04       ', N'Balo-Túi-Ví')
GO
INSERT [dbo].[tLoaiSP] ([MaLoai], [TenLoai]) VALUES (N'L05       ', N'MŨ CAP - MŨ BUCKET - MŨ LEN')
GO
INSERT [dbo].[tMauSac] ([MaMau], [TenMau]) VALUES (N'M01       ', N'Xanh')
GO
INSERT [dbo].[tMauSac] ([MaMau], [TenMau]) VALUES (N'M02       ', N'Đỏ')
GO
INSERT [dbo].[tMauSac] ([MaMau], [TenMau]) VALUES (N'M03       ', N'Tím')
GO
INSERT [dbo].[tMauSac] ([MaMau], [TenMau]) VALUES (N'M04       ', N'Vàng')
GO
INSERT [dbo].[tMauSac] ([MaMau], [TenMau]) VALUES (N'M05       ', N'Lam')
GO
INSERT [dbo].[tMauSac] ([MaMau], [TenMau]) VALUES (N'M06       ', N'Lục')
GO
INSERT [dbo].[tMauSac] ([MaMau], [TenMau]) VALUES (N'M07       ', N'Cam')
GO
INSERT [dbo].[tNhanVien] ([MaNV], [Password], [HoTen], [GioiTinh], [SDT], [QuyenAdmin]) VALUES (N'NV001     ', N'202cb962ac59075b964b07152d234b70', N'Lại Phương', N'Nữ        ', N'036951125 ', 1)
GO
INSERT [dbo].[tNhanVien] ([MaNV], [Password], [HoTen], [GioiTinh], [SDT], [QuyenAdmin]) VALUES (N'NV002     ', N'123456', N'Nguyễn Bông', N'Nữ        ', N'036951125 ', 1)
GO
INSERT [dbo].[tNhanVien] ([MaNV], [Password], [HoTen], [GioiTinh], [SDT], [QuyenAdmin]) VALUES (N'NV003     ', N'123456', N'Nguyễn Hải Nam', N'Nam       ', N'036951125 ', 1)
GO
INSERT [dbo].[tNhanVien] ([MaNV], [Password], [HoTen], [GioiTinh], [SDT], [QuyenAdmin]) VALUES (N'NV004     ', N'123456', N'Nguyễn Sỹ Thể', N'Nam       ', N'036951125 ', 0)
GO
INSERT [dbo].[tNhanVien] ([MaNV], [Password], [HoTen], [GioiTinh], [SDT], [QuyenAdmin]) VALUES (N'NV005     ', N'123456', N'Bùi Vân', N'Nữ        ', N'036951125 ', 0)
GO
INSERT [dbo].[tNhanVien] ([MaNV], [Password], [HoTen], [GioiTinh], [SDT], [QuyenAdmin]) VALUES (N'NV006     ', N'123456', N'Trần Vân', N'Nữ        ', N'036951125 ', 0)
GO
INSERT [dbo].[tNhanVien] ([MaNV], [Password], [HoTen], [GioiTinh], [SDT], [QuyenAdmin]) VALUES (N'NV007     ', N'123456', N'Lan Phương', N'Nữ        ', N'036951125 ', 0)
GO
INSERT [dbo].[tNhanVien] ([MaNV], [Password], [HoTen], [GioiTinh], [SDT], [QuyenAdmin]) VALUES (N'NV008     ', N'123456', N'Bùi Hậu', N'Nam       ', N'036951125 ', 0)
GO
INSERT [dbo].[tNhanVien] ([MaNV], [Password], [HoTen], [GioiTinh], [SDT], [QuyenAdmin]) VALUES (N'NV010     ', NULL, N'HaiNam', N'Nam       ', N'321654897 ', 1)
GO
INSERT [dbo].[tVanChuyen] ([MaVanChuyen], [DonViVanChuyen]) VALUES (N'MVC001    ', N'Best Express')
GO
INSERT [dbo].[tVanChuyen] ([MaVanChuyen], [DonViVanChuyen]) VALUES (N'MVC002    ', N'J&T Express')
GO
INSERT [dbo].[tVanChuyen] ([MaVanChuyen], [DonViVanChuyen]) VALUES (N'MVC003    ', N'Ninja Van')
GO
INSERT [dbo].[tVideo] ([MaVideo], [LinkVideo]) VALUES (N'Vid001', N'https://www.youtube.com/embed/6VwrguNBSQQ')
GO
INSERT [dbo].[tVideo] ([MaVideo], [LinkVideo]) VALUES (N'Vid002', N'https://www.youtube.com/embed/uxvKHb1gdCw')
GO
INSERT [dbo].[tVideo] ([MaVideo], [LinkVideo]) VALUES (N'Vid003', N'https://www.youtube.com/embed/sw54Qv6a8xs')
GO
INSERT [dbo].[tVideo] ([MaVideo], [LinkVideo]) VALUES (N'Vid004', N'https://www.youtube.com/embed/kOww4kGuS9o')
GO
INSERT [dbo].[tVideo] ([MaVideo], [LinkVideo]) VALUES (N'Vid005', N'https://www.youtube.com/embed/6JMy-PIho5I')
GO
INSERT [dbo].[tVideo] ([MaVideo], [LinkVideo]) VALUES (N'Vid006', N'https://www.youtube.com/embed/CmQAIXlcZIY')
GO
INSERT [dbo].[tVideo] ([MaVideo], [LinkVideo]) VALUES (N'Vid007', N'https://www.youtube.com/embed/aPhZ-eOXPRY')
GO
ALTER TABLE [dbo].[tDanhMucSP] ADD  CONSTRAINT [DF_tDanhMucSP_LuotXem]  DEFAULT ((0)) FOR [LuotXem]
GO
ALTER TABLE [dbo].[tChiTietHDB]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDB_tDonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[tDonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[tChiTietHDB] CHECK CONSTRAINT [FK_tChiTietHDB_tDonHang]
GO
ALTER TABLE [dbo].[tChiTietMau]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietMau_tDanhMucSP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[tDanhMucSP] ([MaSP])
GO
ALTER TABLE [dbo].[tChiTietMau] CHECK CONSTRAINT [FK_tChiTietMau_tDanhMucSP]
GO
ALTER TABLE [dbo].[tChiTietMau]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietMau_tMauSac] FOREIGN KEY([MaMau])
REFERENCES [dbo].[tMauSac] ([MaMau])
GO
ALTER TABLE [dbo].[tChiTietMau] CHECK CONSTRAINT [FK_tChiTietMau_tMauSac]
GO
ALTER TABLE [dbo].[tDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_tDanhGia_tDanhMucSP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[tDanhMucSP] ([MaSP])
GO
ALTER TABLE [dbo].[tDanhGia] CHECK CONSTRAINT [FK_tDanhGia_tDanhMucSP]
GO
ALTER TABLE [dbo].[tDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_tDanhGia_tKhachHang] FOREIGN KEY([IDKhach])
REFERENCES [dbo].[tKhachHang] ([IDKhach])
GO
ALTER TABLE [dbo].[tDanhGia] CHECK CONSTRAINT [FK_tDanhGia_tKhachHang]
GO
USE [master]
GO
ALTER DATABASE [QuanLiBanHang] SET  READ_WRITE 
GO
