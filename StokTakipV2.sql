USE [master]
GO
/****** Object:  Database [OtelTakip]    Script Date: 19.03.2025 20:55:50 ******/
CREATE DATABASE [OtelTakip]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OtelTakip', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\OtelTakip.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OtelTakip_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\OtelTakip_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OtelTakip] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OtelTakip].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OtelTakip] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OtelTakip] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OtelTakip] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OtelTakip] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OtelTakip] SET ARITHABORT OFF 
GO
ALTER DATABASE [OtelTakip] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OtelTakip] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OtelTakip] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OtelTakip] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OtelTakip] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OtelTakip] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OtelTakip] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OtelTakip] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OtelTakip] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OtelTakip] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OtelTakip] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OtelTakip] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OtelTakip] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OtelTakip] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OtelTakip] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OtelTakip] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OtelTakip] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OtelTakip] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OtelTakip] SET  MULTI_USER 
GO
ALTER DATABASE [OtelTakip] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OtelTakip] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OtelTakip] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OtelTakip] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OtelTakip] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OtelTakip] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OtelTakip] SET QUERY_STORE = ON
GO
ALTER DATABASE [OtelTakip] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [OtelTakip]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 19.03.2025 20:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[kategori_id] [int] IDENTITY(1,1) NOT NULL,
	[kategori_adi] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[kategori_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menuler]    Script Date: 19.03.2025 20:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menuler](
	[menu_id] [int] IDENTITY(1,1) NOT NULL,
	[tarih] [datetime] NULL,
	[yemek_id] [int] NOT NULL,
	[ogun_turu] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 19.03.2025 20:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[urun_id] [int] IDENTITY(1,1) NOT NULL,
	[urun_adi] [varchar](100) NOT NULL,
	[kategori_id] [int] NOT NULL,
	[stok_miktari] [decimal](10, 2) NOT NULL,
	[birim] [varchar](20) NOT NULL,
	[son_kullanma_tarihi] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[urun_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yemek_Hazirlama]    Script Date: 19.03.2025 20:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yemek_Hazirlama](
	[hazirlama_id] [int] IDENTITY(1,1) NOT NULL,
	[yemek_id] [int] NOT NULL,
	[adet] [int] NOT NULL,
	[hazirlama_tarihi] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[hazirlama_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yemek_Malzemeleri]    Script Date: 19.03.2025 20:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yemek_Malzemeleri](
	[yemek_id] [int] NOT NULL,
	[urun_id] [int] NOT NULL,
	[miktar] [decimal](10, 2) NOT NULL,
	[birim] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[yemek_id] ASC,
	[urun_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yemekler]    Script Date: 19.03.2025 20:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yemekler](
	[yemek_id] [int] IDENTITY(1,1) NOT NULL,
	[yemek_adi] [varchar](100) NOT NULL,
	[ogun_turu] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[yemek_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Kategoriler] ON 

INSERT [dbo].[Kategoriler] ([kategori_id], [kategori_adi]) VALUES (1, N'Meyve')
INSERT [dbo].[Kategoriler] ([kategori_id], [kategori_adi]) VALUES (2, N'Sebze')
INSERT [dbo].[Kategoriler] ([kategori_id], [kategori_adi]) VALUES (3, N'Et ve Tavuk')
INSERT [dbo].[Kategoriler] ([kategori_id], [kategori_adi]) VALUES (4, N'Süt Ürünleri')
INSERT [dbo].[Kategoriler] ([kategori_id], [kategori_adi]) VALUES (5, N'Kuru Gıda')
INSERT [dbo].[Kategoriler] ([kategori_id], [kategori_adi]) VALUES (6, N'İçecekler')
INSERT [dbo].[Kategoriler] ([kategori_id], [kategori_adi]) VALUES (14, N'Ekmek ve Un Mamüller')
SET IDENTITY_INSERT [dbo].[Kategoriler] OFF
GO
SET IDENTITY_INSERT [dbo].[Menuler] ON 

INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (80, CAST(N'2025-03-20T00:00:00.000' AS DateTime), 1, N'Kahvaltı')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (81, CAST(N'2025-03-20T00:00:00.000' AS DateTime), 21, N'Öğle')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (82, CAST(N'2025-03-20T00:00:00.000' AS DateTime), 11, N'Akşam')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (83, CAST(N'2025-03-21T00:00:00.000' AS DateTime), 2, N'Kahvaltı')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (84, CAST(N'2025-03-21T00:00:00.000' AS DateTime), 22, N'Öğle')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (85, CAST(N'2025-03-21T00:00:00.000' AS DateTime), 12, N'Akşam')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (86, CAST(N'2025-03-22T00:00:00.000' AS DateTime), 3, N'Kahvaltı')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (87, CAST(N'2025-03-22T00:00:00.000' AS DateTime), 23, N'Öğle')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (88, CAST(N'2025-03-22T00:00:00.000' AS DateTime), 13, N'Akşam')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (89, CAST(N'2025-03-23T00:00:00.000' AS DateTime), 4, N'Kahvaltı')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (90, CAST(N'2025-03-23T00:00:00.000' AS DateTime), 24, N'Öğle')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (91, CAST(N'2025-03-23T00:00:00.000' AS DateTime), 14, N'Akşam')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (92, CAST(N'2025-03-24T00:00:00.000' AS DateTime), 5, N'Kahvaltı')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (93, CAST(N'2025-03-24T00:00:00.000' AS DateTime), 25, N'Öğle')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (94, CAST(N'2025-03-24T00:00:00.000' AS DateTime), 15, N'Akşam')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (95, CAST(N'2025-03-25T00:00:00.000' AS DateTime), 6, N'Kahvaltı')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (96, CAST(N'2025-03-25T00:00:00.000' AS DateTime), 26, N'Öğle')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (97, CAST(N'2025-03-25T00:00:00.000' AS DateTime), 16, N'Akşam')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (98, CAST(N'2025-03-26T00:00:00.000' AS DateTime), 7, N'Kahvaltı')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (99, CAST(N'2025-03-26T00:00:00.000' AS DateTime), 27, N'Öğle')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (100, CAST(N'2025-03-26T00:00:00.000' AS DateTime), 17, N'Akşam')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (101, CAST(N'2025-03-27T00:00:00.000' AS DateTime), 8, N'Kahvaltı')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (102, CAST(N'2025-03-27T00:00:00.000' AS DateTime), 28, N'Öğle')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (103, CAST(N'2025-03-27T00:00:00.000' AS DateTime), 18, N'Akşam')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (104, CAST(N'2025-03-28T00:00:00.000' AS DateTime), 9, N'Kahvaltı')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (105, CAST(N'2025-03-28T00:00:00.000' AS DateTime), 29, N'Öğle')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (106, CAST(N'2025-03-28T00:00:00.000' AS DateTime), 19, N'Akşam')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (107, CAST(N'2025-03-29T00:00:00.000' AS DateTime), 10, N'Kahvaltı')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (108, CAST(N'2025-03-29T00:00:00.000' AS DateTime), 30, N'Öğle')
INSERT [dbo].[Menuler] ([menu_id], [tarih], [yemek_id], [ogun_turu]) VALUES (109, CAST(N'2025-03-29T00:00:00.000' AS DateTime), 20, N'Akşam')
SET IDENTITY_INSERT [dbo].[Menuler] OFF
GO
SET IDENTITY_INSERT [dbo].[Urunler] ON 

INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (1, N'Dana Bonfile', 3, CAST(26.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-03-30' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (2, N'Somon Fileto', 3, CAST(15.70 AS Decimal(10, 2)), N'kg', CAST(N'2025-03-25' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (3, N'Tavuk Göğsü', 3, CAST(24.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-03-28' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (4, N'Kuzu Pirzola', 3, CAST(8.50 AS Decimal(10, 2)), N'kg', CAST(N'2025-04-01' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (5, N'Sucuk', 3, CAST(23.50 AS Decimal(10, 2)), N'kg', CAST(N'2025-03-15' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (6, N'Kaşar Peyniri', 4, CAST(47.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-04-10' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (7, N'Tam Yağlı Süt', 4, CAST(100.00 AS Decimal(10, 2)), N'Litre', CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (8, N'Beyaz Peynir', 4, CAST(40.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-03-30' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (9, N'Tulum Peyniri', 4, CAST(30.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-04-02' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (10, N'Yoğurt', 4, CAST(60.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-03-18' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (11, N'Krema', 4, CAST(15.00 AS Decimal(10, 2)), N'Litre', CAST(N'2025-04-05' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (12, N'Tereyağı', 4, CAST(25.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-03-22' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (13, N'Taze Marul', 2, CAST(40.00 AS Decimal(10, 2)), N'adet', CAST(N'2025-03-18' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (14, N'Domates', 2, CAST(100.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-03-18' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (15, N'Salatalık', 2, CAST(50.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-03-19' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (16, N'Havuç', 2, CAST(70.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-03-25' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (17, N'Elma', 2, CAST(150.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-03-25' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (18, N'Portakal', 2, CAST(100.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (19, N'Limon', 2, CAST(80.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-03-22' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (20, N'Ispanak', 2, CAST(30.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (21, N'Mantar', 2, CAST(20.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (22, N'Basmati Pirinç', 5, CAST(300.00 AS Decimal(10, 2)), N'kg', NULL)
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (23, N'Bulgur', 5, CAST(150.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-03-30' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (24, N'Mercimek', 5, CAST(120.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-03-15' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (25, N'Nohut', 5, CAST(180.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-04-01' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (26, N'Makarna', 5, CAST(200.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-04-05' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (27, N'Şeker', 5, CAST(100.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-04-10' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (28, N'Tuz', 5, CAST(50.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-04-01' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (29, N'Zeytinyağı', 5, CAST(120.00 AS Decimal(10, 2)), N'Litre', NULL)
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (30, N'Patates', 2, CAST(250.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-04-05' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (31, N'Un', 5, CAST(400.00 AS Decimal(10, 2)), N'kg', NULL)
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (32, N'Beyaz Ekmek', 6, CAST(300.00 AS Decimal(10, 2)), N'adet', CAST(N'2025-03-18' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (33, N'Tam Buğday Ekmek', 6, CAST(200.00 AS Decimal(10, 2)), N'adet', CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (34, N'Simit', 6, CAST(150.00 AS Decimal(10, 2)), N'adet', CAST(N'2025-03-18' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (35, N'Poğaça', 6, CAST(100.00 AS Decimal(10, 2)), N'adet', CAST(N'2025-03-25' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (36, N'Su', 6, CAST(500.00 AS Decimal(10, 2)), N'adet', CAST(N'2026-01-01' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (37, N'Coca Cola 1L', 6, CAST(200.00 AS Decimal(10, 2)), N'adet', CAST(N'2026-02-01' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (38, N'Meyve Suyu', 6, CAST(100.00 AS Decimal(10, 2)), N'adet', CAST(N'2025-12-01' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (39, N'Çay', 6, CAST(50.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-06-01' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (40, N'Kahve', 6, CAST(30.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-07-01' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (41, N'Ayran', 6, CAST(100.00 AS Decimal(10, 2)), N'adet', CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (42, N'Yumurta', 4, CAST(16.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-05-14' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (44, N'Soğan', 2, CAST(21.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-04-18' AS Date))
INSERT [dbo].[Urunler] ([urun_id], [urun_adi], [kategori_id], [stok_miktari], [birim], [son_kullanma_tarihi]) VALUES (46, N'Sarımsak', 2, CAST(50.00 AS Decimal(10, 2)), N'kg', CAST(N'2025-06-14' AS Date))
SET IDENTITY_INSERT [dbo].[Urunler] OFF
GO
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (1, 1, CAST(0.20 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (1, 2, CAST(0.10 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (1, 3, CAST(2.00 AS Decimal(10, 2)), N'adet')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (1, 4, CAST(0.50 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (1, 5, CAST(0.50 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (1, 6, CAST(1.00 AS Decimal(10, 2)), N'adet')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (2, 4, CAST(0.40 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (2, 7, CAST(4.00 AS Decimal(10, 2)), N'adet')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (3, 1, CAST(0.10 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (3, 2, CAST(0.10 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (3, 3, CAST(2.00 AS Decimal(10, 2)), N'dilim')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (3, 8, CAST(2.00 AS Decimal(10, 2)), N'dilim')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (4, 1, CAST(0.20 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (4, 2, CAST(0.20 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (4, 9, CAST(0.05 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (4, 10, CAST(0.10 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (5, 3, CAST(2.00 AS Decimal(10, 2)), N'dilim')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (5, 7, CAST(4.00 AS Decimal(10, 2)), N'adet')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (5, 11, CAST(0.10 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (6, 5, CAST(0.05 AS Decimal(10, 2)), N'Litre')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (6, 12, CAST(2.00 AS Decimal(10, 2)), N'dilim')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (7, 13, CAST(2.00 AS Decimal(10, 2)), N'adet')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (7, 14, CAST(2.00 AS Decimal(10, 2)), N'adet')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (7, 15, CAST(1.00 AS Decimal(10, 2)), N'adet')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (8, 13, CAST(1.00 AS Decimal(10, 2)), N'adet')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (8, 14, CAST(1.00 AS Decimal(10, 2)), N'adet')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (8, 15, CAST(1.00 AS Decimal(10, 2)), N'adet')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (8, 16, CAST(0.20 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (9, 5, CAST(0.05 AS Decimal(10, 2)), N'Litre')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (9, 17, CAST(0.50 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (10, 18, CAST(0.05 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (10, 19, CAST(2.00 AS Decimal(10, 2)), N'adet')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (11, 5, CAST(0.05 AS Decimal(10, 2)), N'Litre')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (11, 20, CAST(0.20 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (12, 5, CAST(0.05 AS Decimal(10, 2)), N'Litre')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (12, 21, CAST(0.20 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (13, 5, CAST(0.05 AS Decimal(10, 2)), N'Litre')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (13, 22, CAST(0.30 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (14, 5, CAST(0.05 AS Decimal(10, 2)), N'Litre')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (14, 23, CAST(0.20 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (15, 5, CAST(0.05 AS Decimal(10, 2)), N'Litre')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (15, 11, CAST(0.10 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (15, 17, CAST(0.50 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (16, 2, CAST(0.10 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (16, 9, CAST(0.05 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (16, 24, CAST(0.10 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (17, 4, CAST(0.30 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (17, 5, CAST(0.05 AS Decimal(10, 2)), N'Litre')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (17, 25, CAST(0.20 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (17, 26, CAST(0.20 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (18, 5, CAST(0.05 AS Decimal(10, 2)), N'Litre')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (18, 22, CAST(0.30 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (18, 27, CAST(0.20 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (19, 5, CAST(0.05 AS Decimal(10, 2)), N'Litre')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (19, 17, CAST(0.50 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (19, 20, CAST(0.20 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (20, 5, CAST(0.05 AS Decimal(10, 2)), N'Litre')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (20, 15, CAST(1.00 AS Decimal(10, 2)), N'adet')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (20, 22, CAST(0.30 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (21, 4, CAST(0.30 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (21, 5, CAST(0.05 AS Decimal(10, 2)), N'Litre')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (21, 17, CAST(0.50 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (21, 22, CAST(0.30 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (21, 26, CAST(0.20 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (22, 4, CAST(0.20 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (22, 6, CAST(1.00 AS Decimal(10, 2)), N'adet')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (22, 12, CAST(1.00 AS Decimal(10, 2)), N'adet')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (22, 20, CAST(0.20 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (23, 2, CAST(0.10 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (23, 9, CAST(0.05 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (23, 24, CAST(0.10 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (24, 5, CAST(0.05 AS Decimal(10, 2)), N'Litre')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (24, 17, CAST(0.50 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (25, 4, CAST(0.20 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (25, 5, CAST(0.05 AS Decimal(10, 2)), N'Litre')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (25, 6, CAST(1.00 AS Decimal(10, 2)), N'adet')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (25, 15, CAST(1.00 AS Decimal(10, 2)), N'adet')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (25, 28, CAST(0.20 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (26, 1, CAST(0.10 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (26, 4, CAST(0.20 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (26, 5, CAST(0.05 AS Decimal(10, 2)), N'Litre')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (26, 6, CAST(1.00 AS Decimal(10, 2)), N'adet')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (27, 5, CAST(0.05 AS Decimal(10, 2)), N'Litre')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (27, 23, CAST(0.20 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (28, 5, CAST(0.05 AS Decimal(10, 2)), N'Litre')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (28, 28, CAST(0.20 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (29, 5, CAST(0.05 AS Decimal(10, 2)), N'Litre')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (29, 24, CAST(0.10 AS Decimal(10, 2)), N'kg')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (30, 5, CAST(0.05 AS Decimal(10, 2)), N'Litre')
INSERT [dbo].[Yemek_Malzemeleri] ([yemek_id], [urun_id], [miktar], [birim]) VALUES (30, 20, CAST(0.20 AS Decimal(10, 2)), N'kg')
GO
SET IDENTITY_INSERT [dbo].[Yemekler] ON 

INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (1, N'Peynir Tabağı', N'Kahvaltı')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (2, N'Menemen', N'Kahvaltı')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (3, N'Kahvaltı Sandviçi', N'Kahvaltı')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (4, N'Peynirli Börek', N'Kahvaltı')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (5, N'Sucuklu Yumurta', N'Kahvaltı')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (6, N'Zeytinli Ekmek', N'Kahvaltı')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (7, N'Meyve Tabağı', N'Kahvaltı')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (8, N'Yoğurtlu Meyve Salatası', N'Kahvaltı')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (9, N'Patates Kızartması', N'Kahvaltı')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (10, N'Çay ve Simit', N'Kahvaltı')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (11, N'Dana Bonfile Izgara', N'Akşam')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (12, N'Somon Fileto Izgara', N'Akşam')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (13, N'Tavuk Göğsü Izgara', N'Akşam')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (14, N'Kuzu Pirzola Izgara', N'Akşam')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (15, N'Sucuklu Patates', N'Akşam')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (16, N'Kaşarlı Makarna', N'Akşam')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (17, N'Sebzeli Çorba', N'Akşam')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (18, N'Tavuklu Pilav', N'Akşam')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (19, N'Köfte ve Patates', N'Akşam')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (20, N'Limonlu Tavuk', N'Akşam')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (21, N'Fırın Tavuk ve Sebzeler', N'Öğle')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (22, N'Köfteli Ekmek Arası', N'Öğle')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (23, N'Peynirli Makarna', N'Öğle')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (24, N'Zeytinyağlı Patates', N'Öğle')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (25, N'Bulgurlu Kısır', N'Öğle')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (26, N'Beyaz Peynirli Salata', N'Öğle')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (27, N'Kuzu Kızartması', N'Öğle')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (28, N'Bulgur Pilavı', N'Öğle')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (29, N'Makarna', N'Öğle')
INSERT [dbo].[Yemekler] ([yemek_id], [yemek_adi], [ogun_turu]) VALUES (30, N'Şiş Kebabı', N'Öğle')
SET IDENTITY_INSERT [dbo].[Yemekler] OFF
GO
ALTER TABLE [dbo].[Urunler] ADD  DEFAULT ((0)) FOR [stok_miktari]
GO
ALTER TABLE [dbo].[Yemek_Hazirlama] ADD  DEFAULT (getdate()) FOR [hazirlama_tarihi]
GO
ALTER TABLE [dbo].[Menuler]  WITH CHECK ADD FOREIGN KEY([yemek_id])
REFERENCES [dbo].[Yemekler] ([yemek_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD FOREIGN KEY([kategori_id])
REFERENCES [dbo].[Kategoriler] ([kategori_id])
GO
ALTER TABLE [dbo].[Yemek_Hazirlama]  WITH CHECK ADD FOREIGN KEY([yemek_id])
REFERENCES [dbo].[Yemekler] ([yemek_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Yemek_Malzemeleri]  WITH CHECK ADD FOREIGN KEY([urun_id])
REFERENCES [dbo].[Urunler] ([urun_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Yemek_Malzemeleri]  WITH CHECK ADD FOREIGN KEY([yemek_id])
REFERENCES [dbo].[Yemekler] ([yemek_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Yemek_Hazirlama]  WITH CHECK ADD CHECK  (([adet]>(0)))
GO
/****** Object:  StoredProcedure [dbo].[StoktanDus]    Script Date: 19.03.2025 20:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StoktanDus] (
    @yemek_id INT
)
AS
BEGIN
    SET NOCOUNT ON;

    -- Yeterli stok olup olmadığını kontrol et
    IF EXISTS (
        SELECT 1
        FROM Yemek_Malzemeleri YM
        JOIN Urunler U ON YM.urun_id = U.urun_id
        WHERE YM.yemek_id = @yemek_id AND YM.miktar > U.stok_miktari
    )
    BEGIN
        PRINT 'Hata: Stokta yeterli malzeme yok!';
        RETURN;
    END

    -- Stoktan malzemeleri düş
    UPDATE U
    SET U.stok_miktari = U.stok_miktari - YM.miktar
    FROM Urunler U
    JOIN Yemek_Malzemeleri YM ON U.urun_id = YM.urun_id
    WHERE YM.yemek_id = @yemek_id;

    PRINT 'Stok başarıyla güncellendi.';
END;
GO
USE [master]
GO
ALTER DATABASE [OtelTakip] SET  READ_WRITE 
GO
