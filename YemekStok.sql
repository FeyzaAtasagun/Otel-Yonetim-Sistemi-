USE [master]
GO
/****** Object:  Database [OtelTakip]    Script Date: 14.03.2025 19:56:29 ******/
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
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 14.03.2025 19:56:29 ******/
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
/****** Object:  Table [dbo].[Menuler]    Script Date: 14.03.2025 19:56:29 ******/
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
/****** Object:  Table [dbo].[Urunler]    Script Date: 14.03.2025 19:56:29 ******/
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
/****** Object:  Table [dbo].[Yemek_Hazirlama]    Script Date: 14.03.2025 19:56:29 ******/
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
/****** Object:  Table [dbo].[Yemek_Malzemeleri]    Script Date: 14.03.2025 19:56:29 ******/
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
/****** Object:  Table [dbo].[Yemekler]    Script Date: 14.03.2025 19:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yemekler](
	[yemek_id] [int] IDENTITY(1,1) NOT NULL,
	[yemek_adi] [varchar](100) NOT NULL,
	[ogun_turu] [varchar](20) NOT NULL,
	[tarih] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[yemek_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
/****** Object:  StoredProcedure [dbo].[StoktanDus]    Script Date: 14.03.2025 19:56:29 ******/
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
