USE [master]
GO
/****** Object:  Database [OtelPersonelYonetimi]    Script Date: 15.03.2025 02:57:48 ******/
CREATE DATABASE [OtelPersonelYonetimi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OtelPersonelYonetimi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\OtelPersonelYonetimi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OtelPersonelYonetimi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\OtelPersonelYonetimi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OtelPersonelYonetimi] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OtelPersonelYonetimi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OtelPersonelYonetimi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET ARITHABORT OFF 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET  MULTI_USER 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OtelPersonelYonetimi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OtelPersonelYonetimi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OtelPersonelYonetimi] SET QUERY_STORE = ON
GO
ALTER DATABASE [OtelPersonelYonetimi] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [OtelPersonelYonetimi]
GO
/****** Object:  Table [dbo].[Departmanlar]    Script Date: 15.03.2025 02:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departmanlar](
	[DepartmanID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmanAdi] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EksikMesaiKayitlari]    Script Date: 15.03.2025 02:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EksikMesaiKayitlari](
	[EksikMesaiID] [int] IDENTITY(1,1) NOT NULL,
	[PersonelID] [int] NULL,
	[EksikMesaiTarihi] [date] NOT NULL,
	[EksikSure] [decimal](5, 2) NOT NULL,
	[KesilisTutari] [decimal](10, 2) NOT NULL,
	[Aciklama] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[EksikMesaiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IzinKayitlari]    Script Date: 15.03.2025 02:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IzinKayitlari](
	[IzinID] [int] IDENTITY(1,1) NOT NULL,
	[PersonelID] [int] NULL,
	[IzinTurID] [int] NULL,
	[BaslangicTarihi] [date] NOT NULL,
	[BitisTarihi] [date] NOT NULL,
	[IzinGunSayisi] [int] NOT NULL,
	[OnayDurumu] [nvarchar](20) NULL,
	[Aciklama] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[IzinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IzinTurleri]    Script Date: 15.03.2025 02:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IzinTurleri](
	[IzinTurID] [int] IDENTITY(1,1) NOT NULL,
	[IzinTurAdi] [nvarchar](50) NOT NULL,
	[UcretliMi] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IzinTurID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maaslar]    Script Date: 15.03.2025 02:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maaslar](
	[MaasID] [int] IDENTITY(1,1) NOT NULL,
	[PersonelID] [int] NULL,
	[BrutMaas] [decimal](10, 2) NOT NULL,
	[NetMaas] [decimal](10, 2) NOT NULL,
	[MaasAyi] [int] NOT NULL,
	[MaasYili] [int] NOT NULL,
	[OdemeTarihi] [date] NULL,
	[Aciklama] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaasID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Maas_Personel_AyYil] UNIQUE NONCLUSTERED 
(
	[PersonelID] ASC,
	[MaasAyi] ASC,
	[MaasYili] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MesaiKayitlari]    Script Date: 15.03.2025 02:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MesaiKayitlari](
	[MesaiID] [int] IDENTITY(1,1) NOT NULL,
	[PersonelID] [int] NULL,
	[MesaiTurID] [int] NULL,
	[MesaiTarihi] [date] NOT NULL,
	[BaslangicSaati] [time](7) NOT NULL,
	[BitisSaati] [time](7) NOT NULL,
	[MesaiSuresi] [decimal](5, 2) NOT NULL,
	[MesaiUcreti] [decimal](10, 2) NOT NULL,
	[Onaylandi] [bit] NULL,
	[Aciklama] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[MesaiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MesaiTurleri]    Script Date: 15.03.2025 02:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MesaiTurleri](
	[MesaiTurID] [int] IDENTITY(1,1) NOT NULL,
	[MesaiTurAdi] [nvarchar](50) NOT NULL,
	[CarpanKatsayi] [decimal](3, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MesaiTurID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personel]    Script Date: 15.03.2025 02:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel](
	[PersonelID] [int] IDENTITY(1,1) NOT NULL,
	[TCKimlikNo] [nvarchar](11) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Soyadi] [nvarchar](50) NOT NULL,
	[DogumTarihi] [date] NOT NULL,
	[Cinsiyet] [nvarchar](5) NULL,
	[Adres] [nvarchar](200) NULL,
	[Telefon] [nvarchar](15) NULL,
	[Email] [nvarchar](100) NULL,
	[IseBaslamaTarihi] [date] NOT NULL,
	[IstenAyrilmaTarihi] [date] NULL,
	[PozisyonID] [int] NULL,
	[AktifMi] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TCKimlikNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonelVardiyalari]    Script Date: 15.03.2025 02:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonelVardiyalari](
	[VardiyaID] [int] IDENTITY(1,1) NOT NULL,
	[PersonelID] [int] NULL,
	[VardiyaTurID] [int] NULL,
	[VardiyaTarihi] [date] NOT NULL,
	[DurumNotu] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[VardiyaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Personel_Vardiya_Tarih] UNIQUE NONCLUSTERED 
(
	[PersonelID] ASC,
	[VardiyaTarihi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pozisyonlar]    Script Date: 15.03.2025 02:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pozisyonlar](
	[PozisyonID] [int] IDENTITY(1,1) NOT NULL,
	[PozisyonAdi] [nvarchar](50) NOT NULL,
	[DepartmanID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PozisyonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SigortaBilgileri]    Script Date: 15.03.2025 02:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SigortaBilgileri](
	[SigortaID] [int] IDENTITY(1,1) NOT NULL,
	[PersonelID] [int] NULL,
	[SigortaNo] [nvarchar](20) NOT NULL,
	[BaslangicTarihi] [date] NOT NULL,
	[BitisTarihi] [date] NULL,
	[SigortaTuru] [nvarchar](50) NULL,
	[AylikPrim] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SigortaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VardiyaTurleri]    Script Date: 15.03.2025 02:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VardiyaTurleri](
	[VardiyaTurID] [int] IDENTITY(1,1) NOT NULL,
	[VardiyaAdi] [nvarchar](50) NOT NULL,
	[BaslangicSaati] [time](7) NOT NULL,
	[BitisSaati] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VardiyaTurID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IzinKayitlari] ADD  DEFAULT ('Beklemede') FOR [OnayDurumu]
GO
ALTER TABLE [dbo].[IzinTurleri] ADD  DEFAULT ((1)) FOR [UcretliMi]
GO
ALTER TABLE [dbo].[MesaiKayitlari] ADD  DEFAULT ((0)) FOR [Onaylandi]
GO
ALTER TABLE [dbo].[MesaiTurleri] ADD  DEFAULT ((1.5)) FOR [CarpanKatsayi]
GO
ALTER TABLE [dbo].[Personel] ADD  DEFAULT ((1)) FOR [AktifMi]
GO
ALTER TABLE [dbo].[SigortaBilgileri] ADD  DEFAULT ('SGK') FOR [SigortaTuru]
GO
ALTER TABLE [dbo].[EksikMesaiKayitlari]  WITH CHECK ADD FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personel] ([PersonelID])
GO
ALTER TABLE [dbo].[IzinKayitlari]  WITH CHECK ADD FOREIGN KEY([IzinTurID])
REFERENCES [dbo].[IzinTurleri] ([IzinTurID])
GO
ALTER TABLE [dbo].[IzinKayitlari]  WITH CHECK ADD FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personel] ([PersonelID])
GO
ALTER TABLE [dbo].[Maaslar]  WITH CHECK ADD FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personel] ([PersonelID])
GO
ALTER TABLE [dbo].[MesaiKayitlari]  WITH CHECK ADD FOREIGN KEY([MesaiTurID])
REFERENCES [dbo].[MesaiTurleri] ([MesaiTurID])
GO
ALTER TABLE [dbo].[MesaiKayitlari]  WITH CHECK ADD FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personel] ([PersonelID])
GO
ALTER TABLE [dbo].[Personel]  WITH CHECK ADD FOREIGN KEY([PozisyonID])
REFERENCES [dbo].[Pozisyonlar] ([PozisyonID])
GO
ALTER TABLE [dbo].[PersonelVardiyalari]  WITH CHECK ADD FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personel] ([PersonelID])
GO
ALTER TABLE [dbo].[PersonelVardiyalari]  WITH CHECK ADD FOREIGN KEY([VardiyaTurID])
REFERENCES [dbo].[VardiyaTurleri] ([VardiyaTurID])
GO
ALTER TABLE [dbo].[Pozisyonlar]  WITH CHECK ADD FOREIGN KEY([DepartmanID])
REFERENCES [dbo].[Departmanlar] ([DepartmanID])
GO
ALTER TABLE [dbo].[SigortaBilgileri]  WITH CHECK ADD FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personel] ([PersonelID])
GO
ALTER TABLE [dbo].[Maaslar]  WITH CHECK ADD CHECK  (([MaasAyi]>=(1) AND [MaasAyi]<=(12)))
GO
ALTER TABLE [dbo].[Personel]  WITH CHECK ADD CHECK  (([Cinsiyet]='Kadın' OR [Cinsiyet]='Erkek'))
GO
USE [master]
GO
ALTER DATABASE [OtelPersonelYonetimi] SET  READ_WRITE 
GO
