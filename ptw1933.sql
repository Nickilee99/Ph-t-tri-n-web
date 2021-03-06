USE [master]
GO
/****** Object:  Database [ptw1933]    Script Date: 01/07/2020 9:16:20 SA ******/
CREATE DATABASE [ptw1933]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ptw1933', FILENAME = N'c:\databases\ptw1933\ptw1933.mdf' , SIZE = 8192KB , MAXSIZE = 20971520KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'ptw1933_log', FILENAME = N'c:\databases\ptw1933\ptw1933_log.ldf' , SIZE = 8192KB , MAXSIZE = 1048576KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ptw1933] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ptw1933].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ptw1933] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ptw1933] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ptw1933] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ptw1933] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ptw1933] SET ARITHABORT OFF 
GO
ALTER DATABASE [ptw1933] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ptw1933] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ptw1933] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ptw1933] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ptw1933] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ptw1933] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ptw1933] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ptw1933] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ptw1933] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ptw1933] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ptw1933] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ptw1933] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ptw1933] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ptw1933] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ptw1933] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ptw1933] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ptw1933] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ptw1933] SET RECOVERY FULL 
GO
ALTER DATABASE [ptw1933] SET  MULTI_USER 
GO
ALTER DATABASE [ptw1933] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ptw1933] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ptw1933] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ptw1933] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ptw1933] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ptw1933', N'ON'
GO
ALTER DATABASE [ptw1933] SET QUERY_STORE = OFF
GO
USE [ptw1933]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 01/07/2020 9:16:31 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[IDAccount] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Quyen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Account_1] PRIMARY KEY CLUSTERED 
(
	[IDAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTDonHang]    Script Date: 01/07/2020 9:16:33 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDonHang](
	[IDDH] [int] NOT NULL,
	[IDSP] [int] NOT NULL,
	[Soluong] [int] NOT NULL,
	[GiaBan] [int] NOT NULL,
	[TenSanPham] [nvarchar](50) NULL,
	[TongTien] [nvarchar](50) NULL,
 CONSTRAINT [PK_CTDonHang_1] PRIMARY KEY CLUSTERED 
(
	[IDDH] ASC,
	[IDSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DMSP]    Script Date: 01/07/2020 9:16:33 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMSP](
	[IDDM] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DMSP] PRIMARY KEY CLUSTERED 
(
	[IDDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 01/07/2020 9:16:34 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[IDDH] [int] IDENTITY(1,1) NOT NULL,
	[IDAccount] [int] NOT NULL,
	[NgayLapDon] [date] NOT NULL,
	[TinhTrangDH] [int] NOT NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[DiaChiKhachHang] [nvarchar](50) NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[IDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 01/07/2020 9:16:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[IDSP] [int] IDENTITY(1,1) NOT NULL,
	[IDDM] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[Size] [nvarchar](50) NOT NULL,
	[ChatLieu] [nvarchar](50) NULL,
	[GiaGoc] [int] NOT NULL,
	[MoTa] [nvarchar](50) NULL,
	[Sale] [int] NOT NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[IDSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (1, N'camlananh12', N'123450', N'Lan Anh', N'Quan 6, TP HCM', N'0981237583', N'lananh@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (2, N'ccsolo123', N'123124', N'Trieu Huy', N'Quan 4, TP HCM', N'0981823994', N'trieuhuy@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (3, N'chaeyounggg', N'121262', N'Thai Anh', N'Quan 3, TP HCM', N'0912318271', N'thaianh@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (4, N'chixemkhongmua', N'123128', N'Tran My', N'Quan 5, TP HCM', N'0987878882', N'my@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (5, N'diamondphan11', N'123458', N'Kim Cuong', N'Huyen Hoc Mon, TP HCM', N'0987654321', N'cuong@gmail.com', N'admin')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (6, N'khongmuahang', N'123126', N'Khanh Duy', N'Quan 2, TP HCM', N'0912347182', N'duy@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (7, N'haibang22000', N'1231237', N'Hai Bang', N'Quan Go Vap, TP HCM', N'0987655678', N'bang@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (8, N'nguyenle2100', N'123456', N'Dinh Nguyen', N'Quan 12, TP HCM', N'0123142382', N'nguyen@gmail.com', N'admin')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (9, N'nhtkS2yuha', N'123125', N'Thinh Khang', N'Quan 1, TP HCM', N'0912381274', N'khangS2yuha@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (10, N'rachuonggamalum', N'123129', N'Kim Tri', N'Quan 7, TP HCM', N'0912123213', N'tri@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (11, N'thaomaitram', N'123457', N'Mai Tram', N'Quan Thu Duc, TP HCM', N'0917583922', N'tram@gmail.com', N'admin')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (12, N'wardarkkk', N'123123', N'Tuan Huy', N'Quan Tan Binh, TP HCM', N'0987472718', N'tuanhuy@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (13, N'yuha26alphabet', N'123459', N'Nhu Ngoc', N'Quan Binh Tan, TP HCM', N'0184736291', N'ngoc@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (14, N'ledinhnguyen', N'123456', N'Lê Đình Nguyên', N'nha', N'1234567890', N'nguyen.c.tre@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (15, N'nhathang', N'123456', N'Tô Hằng', N'nha', N'0939387652', N'hang.to@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (16, N'hihihaha', N'e10adc3949ba59abbe56e057f20f883e', N'huhuhuhu', N'hihihaha', N'0987888898', N'huhu.haha@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (17, N'Elisabath', N'149787a6b7986f31b3dcc0e4e857cd2a', N'Elisabath the cat', N'Home', N'0989090999', N'eli.cat@gmail.om', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (18, N'pcy123123', N'61c02d80cc5fc0f80650c69aae1369e1', N'Park Chaeyoung', N'North korea', N'0909090909', N'chaeyoung.p@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (19, N'nguyenle21111', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyên', N'Viet nam', N'0909083762', N'nguyen.le@gmai.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (20, N'222', N'333', NULL, NULL, NULL, N'rrrr@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (21, N'nonono', N'123456', N'apin', N'Korrean', N'0987978686', N'nonono@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (22, N'aaaaaaaaaa', N'zzzzz', N'Lê Ngu', N'Home', N'0987973386', N'nhdddddoc@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (23, N'P3H3oKut3', N'123123', N'Minh Hằng', N'hihihaha', N'1231231231', N'peheo@facebook.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (24, N'aaaasss', N'96e79218965eb72c92a549dd5a330112', N'aaasssaaa', N'Viet nam', N'0987978680', N'aaaaaaaaaaaa@aa.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (25, N'hihuhiha123', N'4297f44b13955235245b2497399d7a93', N'Lê Đình Nguyên', N'2222', N'0987978686', N'nhu4oc@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (26, N'hihuhiha', N'4297f44b13955235245b2497399d7a93', N'Lê Đình Nguyên', N'2222', N'0987978686', N'nhu4oc@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (27, N'huhuhihi', N'4297f44b13955235245b2497399d7a93', N'nguhh', N'123jjj', N'123123123', N'ddd', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (28, N'cuong.pnk5475@sinhvien.hoasen.edu.vn', N'bcbe3365e6ac95ea2c0343a2395834dd', N'Lê Đình Nguyên', N'North korea', N'0987978680', N'hihihi@d.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (29, N'333', N'bcbe3365e6ac95ea2c0343a2395834dd', N'333', N'33', N'33', N'rrr@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (30, N'22222', N'550a141f12de6341fba65b0ad0433500', N'Nguyên', N'Home', N'1231231231', N'nhungoc@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (31, N'nguyendinh', N'4297f44b13955235245b2497399d7a93', N'nguyedinhle', N'123', N'09090909', N'nguyendinhle@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (32, N'nguaa22n.ld5406@sinhvien.hoasen.edu.vn', N'698d51a19d8a121ce581499d7b701668', N'11qq2', N'2222', N'090908989894', N'nhu3344@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (33, N'hihihahahaaaaa', N'698d51a19d8a121ce581499d7b701668', N'123123', N'aaaaa', N'0909055555', N'addddmin@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (34, N'hihihahaaasss', N'4297f44b13955235245b2497399d7a93', N'huy.nt5150', N'hihihaha', N'090901444', N'nhungoooooc@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (35, N'aaaadx', N'202cb962ac59075b964b07152d234b70', N'Lê Đình Nguyên', N'Viet nam', N'0944455555', N'nhunsssssssssgoc@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (36, N'aa', N'202cb962ac59075b964b07152d234b70', N'fhhdh', N'dgdgdgdgdg', N'0987999999', N'nhungo1c@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (37, N'hihihahaa', N'4297f44b13955235245b2497399d7a93', N'Nguyêns', N'123', N'0909097654', N'nhunaasdzgoc@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (38, N'zxczxczxc', N'4297f44b13955235245b2497399d7a93', N'123123', N'123', N'0986879898', N'nhungaaazoc@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (39, N'123123', N'4297f44b13955235245b2497399d7a93', N'fadk', N'123dsa', N'0977687609', N'nguyenadas@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (40, N'123456', N'4297f44b13955235245b2497399d7a93', N'CƯơng', N'12312', N'0909090909', N'nguyenadas343@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (41, N'123qweasd', N'4297f44b13955235245b2497399d7a93', N'CƯơng', N'123123', N'0977687609', N'nguye43asds@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (42, N'nguyen123456', N'4297f44b13955235245b2497399d7a93', N'123123', N'123123', N'0989876789', N'nguyen123456@gmail.com', N'customer')
INSERT [dbo].[Account] ([IDAccount], [Username], [Password], [Name], [Address], [SDT], [Email], [Quyen]) VALUES (43, N'admin', N'4297f44b13955235245b2497399d7a93', N'qda', N'123123', N'0909090987', N'nguyenad123aas@gmail.com', N'customer')
SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (11, 1, 1, 300000, N'WOMEN Hoodie', NULL)
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (12, 1, 1, 300000, N'WOMEN Hoodie', NULL)
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (13, 2, 1, 250000, N'WOMEN SS T-Shirt', NULL)
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (15, 1, 1, 300000, N'WOMEN Hoodie', NULL)
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (15, 16, 1, 450000, N'WOMEN Mini Skirt', NULL)
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (16, 3, 1, 250000, N'MEN LS T-shirt', NULL)
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (16, 5, 1, 400000, N'MEN LS Flannel', NULL)
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (16, 25, 3, 200000, N'TODDLER LS T-Shirt ', NULL)
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (17, 1, 1, 300000, N'WOMEN Hoodie', NULL)
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (17, 24, 1, 250000, N'KIDS  Sl-Fit Pants', NULL)
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (18, 1, 1, 300000, N'WOMEN Hoodie', NULL)
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (19, 1, 1, 300000, N'WOMEN Hoodie', NULL)
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (20, 1, 1, 300000, N'WOMEN Hoodie', NULL)
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (21, 1, 1, 300000, N'WOMEN Hoodie', NULL)
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (22, 1, 1, 300000, N'WOMEN Hoodie', NULL)
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (23, 1, 1, 300000, N'WOMEN Hoodie', NULL)
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (24, 2, 1, 250000, N'WOMEN SS T-Shirt', NULL)
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (25, 7, 1, 350000, N'GIRLS A LS Blouse', N'350000')
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (26, 2, 1, 250000, N'WOMEN SS T-Shirt', N'250000')
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (27, 1, 3, 300000, N'WOMEN Hoodie', N'900000')
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (28, 1, 1, 300000, N'WOMEN Hoodie', N'300000')
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (29, 1, 2, 300000, N'WOMEN Hoodie', N'600000')
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (29, 22, 1, 500000, N'MEN Sl-Fit Pants', N'500000')
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (30, 1, 1, 300000, N'WOMEN Hoodie', N'300000')
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (30, 3, 1, 250000, N'MEN LS T-shirt', N'250000')
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (31, 1, 1, 300000, N'WOMEN Hoodie', N'300000')
INSERT [dbo].[CTDonHang] ([IDDH], [IDSP], [Soluong], [GiaBan], [TenSanPham], [TongTien]) VALUES (31, 7, 1, 350000, N'GIRLS A LS Blouse', N'350000')
SET IDENTITY_INSERT [dbo].[DMSP] ON 

INSERT [dbo].[DMSP] ([IDDM], [TenDanhMuc]) VALUES (1, N'Women Top ')
INSERT [dbo].[DMSP] ([IDDM], [TenDanhMuc]) VALUES (2, N'Men Top')
INSERT [dbo].[DMSP] ([IDDM], [TenDanhMuc]) VALUES (3, N'Kid Top')
INSERT [dbo].[DMSP] ([IDDM], [TenDanhMuc]) VALUES (4, N'Women Bottom')
INSERT [dbo].[DMSP] ([IDDM], [TenDanhMuc]) VALUES (5, N'Men Bottom')
INSERT [dbo].[DMSP] ([IDDM], [TenDanhMuc]) VALUES (6, N'Kid Bottom')
INSERT [dbo].[DMSP] ([IDDM], [TenDanhMuc]) VALUES (7, N'Baby')
INSERT [dbo].[DMSP] ([IDDM], [TenDanhMuc]) VALUES (8, N'New')
SET IDENTITY_INSERT [dbo].[DMSP] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (1, 1, CAST(N'2019-01-09' AS Date), 1, NULL, NULL)
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (2, 2, CAST(N'2019-01-08' AS Date), 3, NULL, NULL)
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (3, 13, CAST(N'2019-01-07' AS Date), 2, NULL, NULL)
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (4, 12, CAST(N'2019-01-07' AS Date), 3, NULL, NULL)
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (5, 9, CAST(N'2019-01-08' AS Date), 2, NULL, NULL)
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (6, 11, CAST(N'2019-01-09' AS Date), 1, NULL, NULL)
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (7, 5, CAST(N'2019-01-05' AS Date), 1, NULL, NULL)
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (8, 4, CAST(N'2019-01-05' AS Date), 1, NULL, NULL)
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (10, 0, CAST(N'2020-07-04' AS Date), 1, N'ngueyn', N'123')
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (11, 0, CAST(N'2020-07-04' AS Date), 1, N'12aaa', N'123sdc')
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (12, 0, CAST(N'2020-07-04' AS Date), 1, N'CƯơng', N'12 fa')
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (13, 0, CAST(N'2020-07-04' AS Date), 1, N'CƯơng', N'214dad')
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (14, 0, CAST(N'2020-06-27' AS Date), 1, N'ngueyn', N'123a')
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (15, 0, CAST(N'2020-06-27' AS Date), 1, N'ngueyn', N'12 fa')
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (16, 0, CAST(N'2020-06-27' AS Date), 1, N'CƯơng', N'123')
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (17, 0, CAST(N'2020-06-27' AS Date), 1, N'HUytuấn', N'chuồng gà')
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (18, 0, CAST(N'2020-06-28' AS Date), 1, N'CƯơng', N'123')
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (19, 0, CAST(N'2020-06-28' AS Date), 1, N'ngueyn', N'chuồng gà')
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (20, 0, CAST(N'2020-06-28' AS Date), 1, N'ngueyn', N'123sdc')
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (21, 0, CAST(N'2020-06-28' AS Date), 1, N'ngueyn', N'231')
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (22, 0, CAST(N'2020-06-28' AS Date), 1, N'3', N'chuồng gà')
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (23, 0, CAST(N'2020-06-28' AS Date), 1, N'HUy Tuaasn', N'123')
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (24, 0, CAST(N'2020-06-28' AS Date), 1, N'HUy Tuaasn', N'232')
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (25, 0, CAST(N'2020-06-29' AS Date), 1, N'Nguên', N'123')
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (26, 0, CAST(N'2020-06-29' AS Date), 1, N'213', N'123')
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (27, 0, CAST(N'2020-06-29' AS Date), 1, N'CUong', N'3423')
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (28, 0, CAST(N'2020-06-29' AS Date), 1, N'Hihi', N'123123')
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (29, 0, CAST(N'2020-06-29' AS Date), 1, N'fadk', N'123123')
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (30, 0, CAST(N'2020-06-29' AS Date), 1, N'123', N'123')
INSERT [dbo].[DonHang] ([IDDH], [IDAccount], [NgayLapDon], [TinhTrangDH], [TenKhachHang], [DiaChiKhachHang]) VALUES (31, 0, CAST(N'2020-06-29' AS Date), 1, N'hjhhh', N'ffghghgh')
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (1, 1, N'WOMEN Hoodie', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/421355/item/goods_11_421355.jpg?width=2000', N'XS M L XL', N'Cotton', 300000, N'Ao Hoodie cho nu', 0)
INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (2, 1, N'WOMEN SS T-Shirt', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/424873/item/goods_10_424873.jpg?width=2000', N'XXS XS S M L', N'Cotton', 250000, N'Ao thun thoang mat nhieu mau sac', 0)
INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (3, 2, N'MEN LS T-shirt', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/425213/item/goods_34_425213.jpg?width=2000', N'S M L', N'Cotton', 250000, N'Ao thun dai tay cho nam', 0)
INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (5, 2, N'MEN LS Flannel', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/419031/item/goods_19_419031.jpg?width=2000', N'M L XL XXL', N'Cotton', 400000, N'Ao somi dai tay cho Nam', 0)
INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (6, 2, N'MEN C LS Flannel', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/419032/item/goods_01_419032.jpg?width=2000', N'XL ', N'Cotton', 400000, N'Ao somi dai tay ke soc', 0)
INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (7, 3, N'GIRLS A LS Blouse', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/423728/item/goods_00_423728.jpg?width=2000', N'3-4 5-6 7-8', N'Cotton, Polyester', 350000, N'Dam cho be gai', 0)
INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (8, 3, N'KIDS LS Shirt', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/424489/item/goods_01_424489.jpg?width=2000', N'3-4 5-6 7-8 9-10', N'Cotton', 370000, N'Ao somi cho be trai', 0)
INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (9, 3, N'KIDS LS Flannel', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/422129/item/goods_69_422129.jpg?width=2000', N'3-4 5-6 7-8', N'Cotton', 500000, N'Ao Flannel cho be', 0)
INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (10, 4, N'WOMEN US Jeans', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/425500/item/goods_66_425500.jpg?width=2000', N'24inch 25inch 30inch', N'Cotton, Polyester, Spandex', 550000, N'Quan jean Skinny fit cho nu', 0)
INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (11, 4, N'WOMEN D US Jeans', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/419700/item/goods_64_419700.jpg?width=2000', N'30inch 32inch 35inch', N'Cotton, Polyester, Spandex', 570000, N'Quan Jean xanh, rach cho nu ', 0)
INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (12, 4, N'WOMEN UP Pants', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/424885/item/goods_09_424885.jpg?width=2000', N'S M L XL XXL XXXL', N'Cotton', 400000, N'Quan legging ke soc cho nu', 0)
INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (13, 4, N'WOMEN US Leggings', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/425345/item/goods_11_425345.jpg?width=734', N'XS S M', N'Cotton', 350000, N'Quan legging mau tron cho nu ', 0)
INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (14, 4, N'WOMEN P-L pants', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/418249/item/goods_06_418249.jpg?width=2000', N'M L XL XXL', N'Polyester, Cotton', 400000, N'Quan sweatpant cho nu', 0)
INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (15, 4, N'WOMEN Long Skirt', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/425374/item/goods_31_425374.jpg?width=2000', N'0 2 4 6 8 10', N'Cotton, Spandex', 500000, N'Vay tron ba mau', 1)
INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (16, 4, N'WOMEN Mini Skirt', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/425373/item/goods_64_425373.jpg?width=2000', N'4 8 10 12', N'Cotton', 450000, N'Vay jean mini', 0)
INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (19, 5, N'MEN US Sk-Fit Jeans', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/425297/item/goods_08_425297.jpg?width=2000', N'35inch 36inch 40inch', N'Cotton, Polyester, Spandex', 570000, N'Quan jean xam rach goi cho nam', 0)
INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (20, 5, N'MEN Sk-Fit Jeans', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/418914/item/goods_32_418914.jpg?width=2000', N'S M L XL XXL', N'Cotton, Rayon, Spandex', 470000, N'Quan Jean nhieu mau cho nam ', 1)
INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (21, 5, N'MEN AL Pants', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/419508/item/goods_07_419508.jpg?width=2000', N'M L XL XXL XXXL', N'Polyester', 450000, N'Quan dai mau toi cho nam ', 1)
INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (22, 5, N'MEN Sl-Fit Pants', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/422370/item/goods_47_422370.jpg?width=2000', N'37inch 38inch 40inch', N'Cotton, Spandex', 500000, N'Quan slimfit nhieu mau cho nam', 1)
INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (23, 6, N'GIRLS W-Fit Jeans', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/422469/item/goods_63_422469.jpg?width=2000', N'7-8 9-10 11-12', N'Cotton, Spandex', 200000, N'Quan jean rong cho be gai', 1)
INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (24, 6, N'KIDS  Sl-Fit Pants', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/419047/item/goods_09_419047.jpg?width=2000', N'9-10 11-12', N'Cotton, Spandex', 250000, N'Quan jean den cho be nam', 0)
INSERT [dbo].[SanPham] ([IDSP], [IDDM], [Name], [HinhAnh], [Size], [ChatLieu], [GiaGoc], [MoTa], [Sale]) VALUES (25, 7, N'TODDLER LS T-Shirt ', N'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/420033/item/goods_12_420033.jpg?width=2000', N'12-18M 18-24M', N'Cotton', 200000, N'Ao thun cho be gai', 0)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDonHang_DonHang] FOREIGN KEY([IDDH])
REFERENCES [dbo].[DonHang] ([IDDH])
GO
ALTER TABLE [dbo].[CTDonHang] CHECK CONSTRAINT [FK_CTDonHang_DonHang]
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDonHang_SanPham] FOREIGN KEY([IDSP])
REFERENCES [dbo].[SanPham] ([IDSP])
GO
ALTER TABLE [dbo].[CTDonHang] CHECK CONSTRAINT [FK_CTDonHang_SanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DMSP] FOREIGN KEY([IDDM])
REFERENCES [dbo].[DMSP] ([IDDM])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_DMSP]
GO
USE [master]
GO
ALTER DATABASE [ptw1933] SET  READ_WRITE 
GO
