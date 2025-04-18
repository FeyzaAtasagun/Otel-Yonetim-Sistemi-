USE [OtelYonetimSistemi]
GO
/****** Object:  Table [dbo].[Departmanlar]    Script Date: 7.04.2025 22:17:54 ******/
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
/****** Object:  Table [dbo].[EksikMesaiKayitlari]    Script Date: 7.04.2025 22:17:54 ******/
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
/****** Object:  Table [dbo].[IzinKayitlari]    Script Date: 7.04.2025 22:17:54 ******/
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
/****** Object:  Table [dbo].[IzinTurleri]    Script Date: 7.04.2025 22:17:54 ******/
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
/****** Object:  Table [dbo].[Maaslar]    Script Date: 7.04.2025 22:17:54 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MesaiKayitlari]    Script Date: 7.04.2025 22:17:54 ******/
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
/****** Object:  Table [dbo].[MesaiTurleri]    Script Date: 7.04.2025 22:17:54 ******/
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
/****** Object:  Table [dbo].[Personel]    Script Date: 7.04.2025 22:17:54 ******/
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
	[DepartmanID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonelVardiyalari]    Script Date: 7.04.2025 22:17:54 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pozisyonlar]    Script Date: 7.04.2025 22:17:54 ******/
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
/****** Object:  Table [dbo].[SigortaBilgileri]    Script Date: 7.04.2025 22:17:54 ******/
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
/****** Object:  Table [dbo].[VardiyaTurleri]    Script Date: 7.04.2025 22:17:54 ******/
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
SET IDENTITY_INSERT [dbo].[Departmanlar] ON 

INSERT [dbo].[Departmanlar] ([DepartmanID], [DepartmanAdi]) VALUES (1, N'Ön Büro')
INSERT [dbo].[Departmanlar] ([DepartmanID], [DepartmanAdi]) VALUES (2, N'Kat Hizmetleri')
INSERT [dbo].[Departmanlar] ([DepartmanID], [DepartmanAdi]) VALUES (3, N'Yiyecek & İçecek')
INSERT [dbo].[Departmanlar] ([DepartmanID], [DepartmanAdi]) VALUES (4, N'Muhasebe')
INSERT [dbo].[Departmanlar] ([DepartmanID], [DepartmanAdi]) VALUES (5, N'İnsan Kaynakları')
SET IDENTITY_INSERT [dbo].[Departmanlar] OFF
GO
SET IDENTITY_INSERT [dbo].[EksikMesaiKayitlari] ON 

INSERT [dbo].[EksikMesaiKayitlari] ([EksikMesaiID], [PersonelID], [EksikMesaiTarihi], [EksikSure], [KesilisTutari], [Aciklama]) VALUES (1, 2, CAST(N'2025-03-07' AS Date), CAST(1.00 AS Decimal(5, 2)), CAST(62.50 AS Decimal(10, 2)), N'Geç gelme')
INSERT [dbo].[EksikMesaiKayitlari] ([EksikMesaiID], [PersonelID], [EksikMesaiTarihi], [EksikSure], [KesilisTutari], [Aciklama]) VALUES (2, 4, CAST(N'2025-03-08' AS Date), CAST(0.50 AS Decimal(5, 2)), CAST(42.19 AS Decimal(10, 2)), N'Erken çıkış')
INSERT [dbo].[EksikMesaiKayitlari] ([EksikMesaiID], [PersonelID], [EksikMesaiTarihi], [EksikSure], [KesilisTutari], [Aciklama]) VALUES (3, 1, CAST(N'2025-03-09' AS Date), CAST(0.75 AS Decimal(5, 2)), CAST(56.25 AS Decimal(10, 2)), N'Öğle molası uzatma')
INSERT [dbo].[EksikMesaiKayitlari] ([EksikMesaiID], [PersonelID], [EksikMesaiTarihi], [EksikSure], [KesilisTutari], [Aciklama]) VALUES (4, 7, CAST(N'2025-03-08' AS Date), CAST(0.50 AS Decimal(5, 2)), CAST(30.63 AS Decimal(10, 2)), N'Geç gelme')
INSERT [dbo].[EksikMesaiKayitlari] ([EksikMesaiID], [PersonelID], [EksikMesaiTarihi], [EksikSure], [KesilisTutari], [Aciklama]) VALUES (5, 9, CAST(N'2025-03-09' AS Date), CAST(1.00 AS Decimal(5, 2)), CAST(75.00 AS Decimal(10, 2)), N'İzinsiz erken çıkış')
INSERT [dbo].[EksikMesaiKayitlari] ([EksikMesaiID], [PersonelID], [EksikMesaiTarihi], [EksikSure], [KesilisTutari], [Aciklama]) VALUES (6, 10, CAST(N'2025-03-10' AS Date), CAST(0.25 AS Decimal(5, 2)), CAST(16.41 AS Decimal(10, 2)), N'Öğle molasından geç dönüş')
SET IDENTITY_INSERT [dbo].[EksikMesaiKayitlari] OFF
GO
SET IDENTITY_INSERT [dbo].[IzinKayitlari] ON 

INSERT [dbo].[IzinKayitlari] ([IzinID], [PersonelID], [IzinTurID], [BaslangicTarihi], [BitisTarihi], [IzinGunSayisi], [OnayDurumu], [Aciklama]) VALUES (1, 3, 1, CAST(N'2025-03-20' AS Date), CAST(N'2025-03-27' AS Date), 5, N'Onaylandı', N'Yıllık izin')
INSERT [dbo].[IzinKayitlari] ([IzinID], [PersonelID], [IzinTurID], [BaslangicTarihi], [BitisTarihi], [IzinGunSayisi], [OnayDurumu], [Aciklama]) VALUES (2, 5, 2, CAST(N'2025-02-15' AS Date), CAST(N'2025-02-17' AS Date), 3, N'Onaylandı', N'Hastalık izni')
INSERT [dbo].[IzinKayitlari] ([IzinID], [PersonelID], [IzinTurID], [BaslangicTarihi], [BitisTarihi], [IzinGunSayisi], [OnayDurumu], [Aciklama]) VALUES (3, 2, 4, CAST(N'2025-03-13' AS Date), CAST(N'2025-03-13' AS Date), 1, N'Beklemede', N'Aile ziyareti')
INSERT [dbo].[IzinKayitlari] ([IzinID], [PersonelID], [IzinTurID], [BaslangicTarihi], [BitisTarihi], [IzinGunSayisi], [OnayDurumu], [Aciklama]) VALUES (4, 6, 2, CAST(N'2025-03-25' AS Date), CAST(N'2025-03-27' AS Date), 3, N'Onaylandı', N'Sağlık raporu')
INSERT [dbo].[IzinKayitlari] ([IzinID], [PersonelID], [IzinTurID], [BaslangicTarihi], [BitisTarihi], [IzinGunSayisi], [OnayDurumu], [Aciklama]) VALUES (5, 8, 1, CAST(N'2025-04-10' AS Date), CAST(N'2025-04-17' AS Date), 5, N'Beklemede', N'Yıllık izin talebi')
INSERT [dbo].[IzinKayitlari] ([IzinID], [PersonelID], [IzinTurID], [BaslangicTarihi], [BitisTarihi], [IzinGunSayisi], [OnayDurumu], [Aciklama]) VALUES (6, 9, 4, CAST(N'2025-03-18' AS Date), CAST(N'2025-03-18' AS Date), 1, N'Onaylandı', N'Acil aile durumu')
SET IDENTITY_INSERT [dbo].[IzinKayitlari] OFF
GO
SET IDENTITY_INSERT [dbo].[IzinTurleri] ON 

INSERT [dbo].[IzinTurleri] ([IzinTurID], [IzinTurAdi], [UcretliMi]) VALUES (1, N'Yıllık İzin', 1)
INSERT [dbo].[IzinTurleri] ([IzinTurID], [IzinTurAdi], [UcretliMi]) VALUES (2, N'Hastalık İzni', 1)
INSERT [dbo].[IzinTurleri] ([IzinTurID], [IzinTurAdi], [UcretliMi]) VALUES (3, N'Ücretsiz İzin', 0)
INSERT [dbo].[IzinTurleri] ([IzinTurID], [IzinTurAdi], [UcretliMi]) VALUES (4, N'Mazeret İzni', 1)
SET IDENTITY_INSERT [dbo].[IzinTurleri] OFF
GO
SET IDENTITY_INSERT [dbo].[Maaslar] ON 

INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [BrutMaas], [NetMaas], [MaasAyi], [MaasYili], [OdemeTarihi], [Aciklama]) VALUES (1, 1, CAST(12000.00 AS Decimal(10, 2)), CAST(9600.00 AS Decimal(10, 2)), 1, 2025, CAST(N'2025-01-05' AS Date), NULL)
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [BrutMaas], [NetMaas], [MaasAyi], [MaasYili], [OdemeTarihi], [Aciklama]) VALUES (2, 2, CAST(10000.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)), 1, 2025, CAST(N'2025-01-05' AS Date), NULL)
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [BrutMaas], [NetMaas], [MaasAyi], [MaasYili], [OdemeTarihi], [Aciklama]) VALUES (3, 3, CAST(15000.00 AS Decimal(10, 2)), CAST(12000.00 AS Decimal(10, 2)), 1, 2025, CAST(N'2025-01-05' AS Date), NULL)
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [BrutMaas], [NetMaas], [MaasAyi], [MaasYili], [OdemeTarihi], [Aciklama]) VALUES (4, 4, CAST(13500.00 AS Decimal(10, 2)), CAST(10800.00 AS Decimal(10, 2)), 1, 2025, CAST(N'2025-01-05' AS Date), NULL)
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [BrutMaas], [NetMaas], [MaasAyi], [MaasYili], [OdemeTarihi], [Aciklama]) VALUES (5, 5, CAST(16000.00 AS Decimal(10, 2)), CAST(12800.00 AS Decimal(10, 2)), 1, 2025, CAST(N'2025-01-05' AS Date), NULL)
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [BrutMaas], [NetMaas], [MaasAyi], [MaasYili], [OdemeTarihi], [Aciklama]) VALUES (6, 1, CAST(12000.00 AS Decimal(10, 2)), CAST(9600.00 AS Decimal(10, 2)), 2, 2025, CAST(N'2025-02-05' AS Date), NULL)
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [BrutMaas], [NetMaas], [MaasAyi], [MaasYili], [OdemeTarihi], [Aciklama]) VALUES (7, 2, CAST(10000.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)), 2, 2025, CAST(N'2025-02-05' AS Date), NULL)
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [BrutMaas], [NetMaas], [MaasAyi], [MaasYili], [OdemeTarihi], [Aciklama]) VALUES (8, 3, CAST(15000.00 AS Decimal(10, 2)), CAST(12000.00 AS Decimal(10, 2)), 2, 2025, CAST(N'2025-02-05' AS Date), NULL)
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [BrutMaas], [NetMaas], [MaasAyi], [MaasYili], [OdemeTarihi], [Aciklama]) VALUES (9, 4, CAST(13500.00 AS Decimal(10, 2)), CAST(10800.00 AS Decimal(10, 2)), 2, 2025, CAST(N'2025-02-05' AS Date), NULL)
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [BrutMaas], [NetMaas], [MaasAyi], [MaasYili], [OdemeTarihi], [Aciklama]) VALUES (10, 5, CAST(16000.00 AS Decimal(10, 2)), CAST(12800.00 AS Decimal(10, 2)), 2, 2025, CAST(N'2025-02-05' AS Date), NULL)
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [BrutMaas], [NetMaas], [MaasAyi], [MaasYili], [OdemeTarihi], [Aciklama]) VALUES (11, 6, CAST(11500.00 AS Decimal(10, 2)), CAST(9200.00 AS Decimal(10, 2)), 1, 2025, CAST(N'2025-01-05' AS Date), NULL)
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [BrutMaas], [NetMaas], [MaasAyi], [MaasYili], [OdemeTarihi], [Aciklama]) VALUES (12, 7, CAST(9800.00 AS Decimal(10, 2)), CAST(7840.00 AS Decimal(10, 2)), 1, 2025, CAST(N'2025-01-05' AS Date), NULL)
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [BrutMaas], [NetMaas], [MaasAyi], [MaasYili], [OdemeTarihi], [Aciklama]) VALUES (13, 8, CAST(14000.00 AS Decimal(10, 2)), CAST(11200.00 AS Decimal(10, 2)), 1, 2025, CAST(N'2025-01-05' AS Date), NULL)
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [BrutMaas], [NetMaas], [MaasAyi], [MaasYili], [OdemeTarihi], [Aciklama]) VALUES (14, 9, CAST(15000.00 AS Decimal(10, 2)), CAST(12000.00 AS Decimal(10, 2)), 1, 2025, CAST(N'2025-01-05' AS Date), NULL)
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [BrutMaas], [NetMaas], [MaasAyi], [MaasYili], [OdemeTarihi], [Aciklama]) VALUES (15, 10, CAST(10500.00 AS Decimal(10, 2)), CAST(8400.00 AS Decimal(10, 2)), 1, 2025, CAST(N'2025-01-05' AS Date), NULL)
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [BrutMaas], [NetMaas], [MaasAyi], [MaasYili], [OdemeTarihi], [Aciklama]) VALUES (16, 6, CAST(11500.00 AS Decimal(10, 2)), CAST(9200.00 AS Decimal(10, 2)), 2, 2025, CAST(N'2025-02-05' AS Date), NULL)
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [BrutMaas], [NetMaas], [MaasAyi], [MaasYili], [OdemeTarihi], [Aciklama]) VALUES (17, 7, CAST(9800.00 AS Decimal(10, 2)), CAST(7840.00 AS Decimal(10, 2)), 2, 2025, CAST(N'2025-02-05' AS Date), NULL)
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [BrutMaas], [NetMaas], [MaasAyi], [MaasYili], [OdemeTarihi], [Aciklama]) VALUES (18, 8, CAST(14000.00 AS Decimal(10, 2)), CAST(11200.00 AS Decimal(10, 2)), 2, 2025, CAST(N'2025-02-05' AS Date), NULL)
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [BrutMaas], [NetMaas], [MaasAyi], [MaasYili], [OdemeTarihi], [Aciklama]) VALUES (19, 9, CAST(15000.00 AS Decimal(10, 2)), CAST(12000.00 AS Decimal(10, 2)), 2, 2025, CAST(N'2025-02-05' AS Date), NULL)
INSERT [dbo].[Maaslar] ([MaasID], [PersonelID], [BrutMaas], [NetMaas], [MaasAyi], [MaasYili], [OdemeTarihi], [Aciklama]) VALUES (20, 10, CAST(10500.00 AS Decimal(10, 2)), CAST(8400.00 AS Decimal(10, 2)), 2, 2025, CAST(N'2025-02-05' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Maaslar] OFF
GO
SET IDENTITY_INSERT [dbo].[MesaiKayitlari] ON 

INSERT [dbo].[MesaiKayitlari] ([MesaiID], [PersonelID], [MesaiTurID], [MesaiTarihi], [BaslangicSaati], [BitisSaati], [MesaiSuresi], [MesaiUcreti], [Onaylandi], [Aciklama]) VALUES (1, 1, 1, CAST(N'2025-03-08' AS Date), CAST(N'16:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(2.00 AS Decimal(5, 2)), CAST(150.00 AS Decimal(10, 2)), 1, NULL)
INSERT [dbo].[MesaiKayitlari] ([MesaiID], [PersonelID], [MesaiTurID], [MesaiTarihi], [BaslangicSaati], [BitisSaati], [MesaiSuresi], [MesaiUcreti], [Onaylandi], [Aciklama]) VALUES (2, 3, 1, CAST(N'2025-03-08' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(2.00 AS Decimal(5, 2)), CAST(180.00 AS Decimal(10, 2)), 1, NULL)
INSERT [dbo].[MesaiKayitlari] ([MesaiID], [PersonelID], [MesaiTurID], [MesaiTarihi], [BaslangicSaati], [BitisSaati], [MesaiSuresi], [MesaiUcreti], [Onaylandi], [Aciklama]) VALUES (3, 2, 2, CAST(N'2025-03-09' AS Date), CAST(N'16:00:00' AS Time), CAST(N'19:00:00' AS Time), CAST(3.00 AS Decimal(5, 2)), CAST(300.00 AS Decimal(10, 2)), 1, NULL)
INSERT [dbo].[MesaiKayitlari] ([MesaiID], [PersonelID], [MesaiTurID], [MesaiTarihi], [BaslangicSaati], [BitisSaati], [MesaiSuresi], [MesaiUcreti], [Onaylandi], [Aciklama]) VALUES (4, 4, 1, CAST(N'2025-03-10' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:30:00' AS Time), CAST(1.50 AS Decimal(5, 2)), CAST(135.00 AS Decimal(10, 2)), 0, NULL)
INSERT [dbo].[MesaiKayitlari] ([MesaiID], [PersonelID], [MesaiTurID], [MesaiTarihi], [BaslangicSaati], [BitisSaati], [MesaiSuresi], [MesaiUcreti], [Onaylandi], [Aciklama]) VALUES (5, 5, 1, CAST(N'2025-03-10' AS Date), CAST(N'00:00:00' AS Time), CAST(N'02:00:00' AS Time), CAST(2.00 AS Decimal(5, 2)), CAST(200.00 AS Decimal(10, 2)), 0, NULL)
INSERT [dbo].[MesaiKayitlari] ([MesaiID], [PersonelID], [MesaiTurID], [MesaiTarihi], [BaslangicSaati], [BitisSaati], [MesaiSuresi], [MesaiUcreti], [Onaylandi], [Aciklama]) VALUES (6, 6, 1, CAST(N'2025-03-09' AS Date), CAST(N'00:00:00' AS Time), CAST(N'02:00:00' AS Time), CAST(2.00 AS Decimal(5, 2)), CAST(172.50 AS Decimal(10, 2)), 1, NULL)
INSERT [dbo].[MesaiKayitlari] ([MesaiID], [PersonelID], [MesaiTurID], [MesaiTarihi], [BaslangicSaati], [BitisSaati], [MesaiSuresi], [MesaiUcreti], [Onaylandi], [Aciklama]) VALUES (7, 7, 2, CAST(N'2025-03-09' AS Date), CAST(N'16:00:00' AS Time), CAST(N'18:30:00' AS Time), CAST(2.50 AS Decimal(5, 2)), CAST(245.00 AS Decimal(10, 2)), 1, NULL)
INSERT [dbo].[MesaiKayitlari] ([MesaiID], [PersonelID], [MesaiTurID], [MesaiTarihi], [BaslangicSaati], [BitisSaati], [MesaiSuresi], [MesaiUcreti], [Onaylandi], [Aciklama]) VALUES (8, 8, 1, CAST(N'2025-03-10' AS Date), CAST(N'16:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(2.00 AS Decimal(5, 2)), CAST(175.00 AS Decimal(10, 2)), 0, NULL)
INSERT [dbo].[MesaiKayitlari] ([MesaiID], [PersonelID], [MesaiTurID], [MesaiTarihi], [BaslangicSaati], [BitisSaati], [MesaiSuresi], [MesaiUcreti], [Onaylandi], [Aciklama]) VALUES (9, 9, 3, CAST(N'2025-03-08' AS Date), CAST(N'08:00:00' AS Time), CAST(N'11:00:00' AS Time), CAST(3.00 AS Decimal(5, 2)), CAST(375.00 AS Decimal(10, 2)), 1, NULL)
INSERT [dbo].[MesaiKayitlari] ([MesaiID], [PersonelID], [MesaiTurID], [MesaiTarihi], [BaslangicSaati], [BitisSaati], [MesaiSuresi], [MesaiUcreti], [Onaylandi], [Aciklama]) VALUES (10, 10, 1, CAST(N'2025-03-10' AS Date), CAST(N'16:00:00' AS Time), CAST(N'17:30:00' AS Time), CAST(1.50 AS Decimal(5, 2)), CAST(131.25 AS Decimal(10, 2)), 0, NULL)
SET IDENTITY_INSERT [dbo].[MesaiKayitlari] OFF
GO
SET IDENTITY_INSERT [dbo].[MesaiTurleri] ON 

INSERT [dbo].[MesaiTurleri] ([MesaiTurID], [MesaiTurAdi], [CarpanKatsayi]) VALUES (1, N'Normal Mesai', CAST(1.50 AS Decimal(3, 2)))
INSERT [dbo].[MesaiTurleri] ([MesaiTurID], [MesaiTurAdi], [CarpanKatsayi]) VALUES (2, N'Hafta Sonu Mesai', CAST(2.00 AS Decimal(3, 2)))
INSERT [dbo].[MesaiTurleri] ([MesaiTurID], [MesaiTurAdi], [CarpanKatsayi]) VALUES (3, N'Tatil Günü Mesai', CAST(2.50 AS Decimal(3, 2)))
SET IDENTITY_INSERT [dbo].[MesaiTurleri] OFF
GO
SET IDENTITY_INSERT [dbo].[Personel] ON 

INSERT [dbo].[Personel] ([PersonelID], [TCKimlikNo], [Adi], [Soyadi], [DogumTarihi], [Cinsiyet], [Adres], [Telefon], [Email], [IseBaslamaTarihi], [IstenAyrilmaTarihi], [PozisyonID], [AktifMi], [DepartmanID]) VALUES (1, N'12345678901', N'Ahmet', N'Yılmaz', CAST(N'1985-05-10' AS Date), N'Erkek', N'Ankara Cad. No:123 İstanbul', N'5551234567', N'ahmet.yilmaz@email.com', CAST(N'2020-03-15' AS Date), NULL, 1, 1, NULL)
INSERT [dbo].[Personel] ([PersonelID], [TCKimlikNo], [Adi], [Soyadi], [DogumTarihi], [Cinsiyet], [Adres], [Telefon], [Email], [IseBaslamaTarihi], [IstenAyrilmaTarihi], [PozisyonID], [AktifMi], [DepartmanID]) VALUES (2, N'23456789012', N'Ayşe', N'Demir', CAST(N'1990-08-22' AS Date), N'Kadın', N'İzmir Sok. No:45 İstanbul', N'5552345678', N'ayse.demir@email.com', CAST(N'2019-06-10' AS Date), NULL, 3, 1, NULL)
INSERT [dbo].[Personel] ([PersonelID], [TCKimlikNo], [Adi], [Soyadi], [DogumTarihi], [Cinsiyet], [Adres], [Telefon], [Email], [IseBaslamaTarihi], [IstenAyrilmaTarihi], [PozisyonID], [AktifMi], [DepartmanID]) VALUES (3, N'34567890123', N'Mehmete', N'Kaya', CAST(N'1982-12-03' AS Date), N'Erkek', N'Bağdat Cad. No:78 İstanbul', N'5553456789', N'mehmet.kaya@email.com', CAST(N'2021-02-01' AS Date), NULL, 6, 1, NULL)
INSERT [dbo].[Personel] ([PersonelID], [TCKimlikNo], [Adi], [Soyadi], [DogumTarihi], [Cinsiyet], [Adres], [Telefon], [Email], [IseBaslamaTarihi], [IstenAyrilmaTarihi], [PozisyonID], [AktifMi], [DepartmanID]) VALUES (4, N'45678901234', N'Zeynep', N'Çelik', CAST(N'1992-04-15' AS Date), N'Kadın', N'Atatürk Cad. No:56 İzmir', N'5554567890', N'zeynep.celik@email.com', CAST(N'2018-11-20' AS Date), NULL, 4, 1, NULL)
INSERT [dbo].[Personel] ([PersonelID], [TCKimlikNo], [Adi], [Soyadi], [DogumTarihi], [Cinsiyet], [Adres], [Telefon], [Email], [IseBaslamaTarihi], [IstenAyrilmaTarihi], [PozisyonID], [AktifMi], [DepartmanID]) VALUES (5, N'56789012345', N'Ali', N'Öztürk', CAST(N'1988-09-27' AS Date), N'Erkek', N'Cumhuriyet Mah. No:34 Ankara', N'5555678901', N'ali.ozturk@email.com', CAST(N'2022-01-05' AS Date), NULL, 7, 1, NULL)
INSERT [dbo].[Personel] ([PersonelID], [TCKimlikNo], [Adi], [Soyadi], [DogumTarihi], [Cinsiyet], [Adres], [Telefon], [Email], [IseBaslamaTarihi], [IstenAyrilmaTarihi], [PozisyonID], [AktifMi], [DepartmanID]) VALUES (6, N'67890123456', N'Fatma', N'Yıldız', CAST(N'1987-03-25' AS Date), N'Kadın', N'Bahçelievler Mah. No:42 İstanbul', N'5556789012', N'fatma.yildiz@email.com', CAST(N'2023-04-15' AS Date), NULL, 5, 1, NULL)
INSERT [dbo].[Personel] ([PersonelID], [TCKimlikNo], [Adi], [Soyadi], [DogumTarihi], [Cinsiyet], [Adres], [Telefon], [Email], [IseBaslamaTarihi], [IstenAyrilmaTarihi], [PozisyonID], [AktifMi], [DepartmanID]) VALUES (7, N'78901234567', N'Emre', N'Şahin', CAST(N'1991-11-12' AS Date), N'Erkek', N'Göztepe Cad. No:123 İstanbul', N'5557890123', N'emre.sahin@email.com', CAST(N'2022-10-01' AS Date), NULL, 2, 1, NULL)
INSERT [dbo].[Personel] ([PersonelID], [TCKimlikNo], [Adi], [Soyadi], [DogumTarihi], [Cinsiyet], [Adres], [Telefon], [Email], [IseBaslamaTarihi], [IstenAyrilmaTarihi], [PozisyonID], [AktifMi], [DepartmanID]) VALUES (8, N'89012345678', N'Selin', N'Arslan', CAST(N'1993-07-08' AS Date), N'Kadın', N'Kozyatağı Sok. No:18 İstanbul', N'5558901234', N'selin.arslan@email.com', CAST(N'2024-01-10' AS Date), NULL, 8, 1, NULL)
INSERT [dbo].[Personel] ([PersonelID], [TCKimlikNo], [Adi], [Soyadi], [DogumTarihi], [Cinsiyet], [Adres], [Telefon], [Email], [IseBaslamaTarihi], [IstenAyrilmaTarihi], [PozisyonID], [AktifMi], [DepartmanID]) VALUES (9, N'90123456789', N'Mustafa', N'Kurt', CAST(N'1984-09-30' AS Date), N'Erkek', N'Kadıköy Mah. No:67 İstanbul', N'5559012345', N'mustafa.kurt@email.com', CAST(N'2023-08-22' AS Date), NULL, 6, 1, NULL)
INSERT [dbo].[Personel] ([PersonelID], [TCKimlikNo], [Adi], [Soyadi], [DogumTarihi], [Cinsiyet], [Adres], [Telefon], [Email], [IseBaslamaTarihi], [IstenAyrilmaTarihi], [PozisyonID], [AktifMi], [DepartmanID]) VALUES (10, N'01234567890', N'Elif', N'Aydın', CAST(N'1989-05-17' AS Date), N'Kadın', N'Maltepe Cad. No:55 İstanbul', N'5550123456', N'elif.aydin@email.com', CAST(N'2024-02-15' AS Date), NULL, 3, 1, NULL)
SET IDENTITY_INSERT [dbo].[Personel] OFF
GO
SET IDENTITY_INSERT [dbo].[PersonelVardiyalari] ON 

INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (1, 1, 1, CAST(N'2025-03-08' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (2, 2, 2, CAST(N'2025-03-08' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (3, 3, 3, CAST(N'2025-03-08' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (4, 4, 1, CAST(N'2025-03-08' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (5, 5, 2, CAST(N'2025-03-08' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (6, 1, 1, CAST(N'2025-03-09' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (7, 2, 2, CAST(N'2025-03-09' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (8, 3, 3, CAST(N'2025-03-09' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (9, 4, 1, CAST(N'2025-03-09' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (10, 5, 2, CAST(N'2025-03-09' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (11, 1, 1, CAST(N'2025-03-10' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (12, 2, 2, CAST(N'2025-03-10' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (13, 3, 3, CAST(N'2025-03-10' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (14, 4, 1, CAST(N'2025-03-10' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (15, 5, 2, CAST(N'2025-03-10' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (16, 6, 2, CAST(N'2025-03-08' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (17, 7, 1, CAST(N'2025-03-08' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (18, 8, 2, CAST(N'2025-03-08' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (19, 9, 3, CAST(N'2025-03-08' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (20, 10, 1, CAST(N'2025-03-08' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (21, 6, 2, CAST(N'2025-03-09' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (22, 7, 1, CAST(N'2025-03-09' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (23, 8, 2, CAST(N'2025-03-09' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (24, 9, 3, CAST(N'2025-03-09' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (25, 10, 1, CAST(N'2025-03-09' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (26, 6, 2, CAST(N'2025-03-10' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (27, 7, 1, CAST(N'2025-03-10' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (28, 8, 2, CAST(N'2025-03-10' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (29, 9, 3, CAST(N'2025-03-10' AS Date), NULL)
INSERT [dbo].[PersonelVardiyalari] ([VardiyaID], [PersonelID], [VardiyaTurID], [VardiyaTarihi], [DurumNotu]) VALUES (30, 10, 1, CAST(N'2025-03-10' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[PersonelVardiyalari] OFF
GO
SET IDENTITY_INSERT [dbo].[Pozisyonlar] ON 

INSERT [dbo].[Pozisyonlar] ([PozisyonID], [PozisyonAdi], [DepartmanID]) VALUES (1, N'Resepsiyon Görevlisi', 1)
INSERT [dbo].[Pozisyonlar] ([PozisyonID], [PozisyonAdi], [DepartmanID]) VALUES (2, N'Bellboy', 1)
INSERT [dbo].[Pozisyonlar] ([PozisyonID], [PozisyonAdi], [DepartmanID]) VALUES (3, N'Kat Görevlisi', 2)
INSERT [dbo].[Pozisyonlar] ([PozisyonID], [PozisyonAdi], [DepartmanID]) VALUES (4, N'Kat Şefi', 2)
INSERT [dbo].[Pozisyonlar] ([PozisyonID], [PozisyonAdi], [DepartmanID]) VALUES (5, N'Garson', 3)
INSERT [dbo].[Pozisyonlar] ([PozisyonID], [PozisyonAdi], [DepartmanID]) VALUES (6, N'Aşçı', 3)
INSERT [dbo].[Pozisyonlar] ([PozisyonID], [PozisyonAdi], [DepartmanID]) VALUES (7, N'Muhasebe Uzmanı', 4)
INSERT [dbo].[Pozisyonlar] ([PozisyonID], [PozisyonAdi], [DepartmanID]) VALUES (8, N'İK Uzmanı', 5)
SET IDENTITY_INSERT [dbo].[Pozisyonlar] OFF
GO
SET IDENTITY_INSERT [dbo].[SigortaBilgileri] ON 

INSERT [dbo].[SigortaBilgileri] ([SigortaID], [PersonelID], [SigortaNo], [BaslangicTarihi], [BitisTarihi], [SigortaTuru], [AylikPrim]) VALUES (1, 1, N'SGK12345678', CAST(N'2020-03-15' AS Date), NULL, N'SGK', CAST(1250.50 AS Decimal(10, 2)))
INSERT [dbo].[SigortaBilgileri] ([SigortaID], [PersonelID], [SigortaNo], [BaslangicTarihi], [BitisTarihi], [SigortaTuru], [AylikPrim]) VALUES (2, 2, N'SGK23456789', CAST(N'2019-06-10' AS Date), NULL, N'SGK', CAST(1100.75 AS Decimal(10, 2)))
INSERT [dbo].[SigortaBilgileri] ([SigortaID], [PersonelID], [SigortaNo], [BaslangicTarihi], [BitisTarihi], [SigortaTuru], [AylikPrim]) VALUES (3, 3, N'SGK34567890', CAST(N'2021-02-01' AS Date), NULL, N'SGK', CAST(1350.25 AS Decimal(10, 2)))
INSERT [dbo].[SigortaBilgileri] ([SigortaID], [PersonelID], [SigortaNo], [BaslangicTarihi], [BitisTarihi], [SigortaTuru], [AylikPrim]) VALUES (4, 4, N'SGK45678901', CAST(N'2018-11-20' AS Date), NULL, N'SGK', CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[SigortaBilgileri] ([SigortaID], [PersonelID], [SigortaNo], [BaslangicTarihi], [BitisTarihi], [SigortaTuru], [AylikPrim]) VALUES (5, 5, N'SGK56789012', CAST(N'2022-01-05' AS Date), NULL, N'SGK', CAST(1400.50 AS Decimal(10, 2)))
INSERT [dbo].[SigortaBilgileri] ([SigortaID], [PersonelID], [SigortaNo], [BaslangicTarihi], [BitisTarihi], [SigortaTuru], [AylikPrim]) VALUES (6, 6, N'SGK67890123', CAST(N'2023-04-15' AS Date), NULL, N'SGK', CAST(1250.00 AS Decimal(10, 2)))
INSERT [dbo].[SigortaBilgileri] ([SigortaID], [PersonelID], [SigortaNo], [BaslangicTarihi], [BitisTarihi], [SigortaTuru], [AylikPrim]) VALUES (7, 7, N'SGK78901234', CAST(N'2022-10-01' AS Date), NULL, N'SGK', CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[SigortaBilgileri] ([SigortaID], [PersonelID], [SigortaNo], [BaslangicTarihi], [BitisTarihi], [SigortaTuru], [AylikPrim]) VALUES (8, 8, N'SGK89012345', CAST(N'2024-01-10' AS Date), NULL, N'SGK', CAST(1400.00 AS Decimal(10, 2)))
INSERT [dbo].[SigortaBilgileri] ([SigortaID], [PersonelID], [SigortaNo], [BaslangicTarihi], [BitisTarihi], [SigortaTuru], [AylikPrim]) VALUES (9, 9, N'SGK90123456', CAST(N'2023-08-22' AS Date), NULL, N'SGK', CAST(1350.00 AS Decimal(10, 2)))
INSERT [dbo].[SigortaBilgileri] ([SigortaID], [PersonelID], [SigortaNo], [BaslangicTarihi], [BitisTarihi], [SigortaTuru], [AylikPrim]) VALUES (10, 10, N'SGK01234567', CAST(N'2024-02-15' AS Date), NULL, N'SGK', CAST(1150.25 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[SigortaBilgileri] OFF
GO
SET IDENTITY_INSERT [dbo].[VardiyaTurleri] ON 

INSERT [dbo].[VardiyaTurleri] ([VardiyaTurID], [VardiyaAdi], [BaslangicSaati], [BitisSaati]) VALUES (1, N'Sabah', CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[VardiyaTurleri] ([VardiyaTurID], [VardiyaAdi], [BaslangicSaati], [BitisSaati]) VALUES (2, N'Akşam', CAST(N'16:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[VardiyaTurleri] ([VardiyaTurID], [VardiyaAdi], [BaslangicSaati], [BitisSaati]) VALUES (3, N'Gece', CAST(N'00:00:00' AS Time), CAST(N'08:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[VardiyaTurleri] OFF
GO
/****** Object:  Index [UQ_Maas_Personel_AyYil]    Script Date: 7.04.2025 22:17:54 ******/
ALTER TABLE [dbo].[Maaslar] ADD  CONSTRAINT [UQ_Maas_Personel_AyYil] UNIQUE NONCLUSTERED 
(
	[PersonelID] ASC,
	[MaasAyi] ASC,
	[MaasYili] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Personel__7E1935EDADF35245]    Script Date: 7.04.2025 22:17:54 ******/
ALTER TABLE [dbo].[Personel] ADD UNIQUE NONCLUSTERED 
(
	[TCKimlikNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Personel_Vardiya_Tarih]    Script Date: 7.04.2025 22:17:54 ******/
ALTER TABLE [dbo].[PersonelVardiyalari] ADD  CONSTRAINT [UQ_Personel_Vardiya_Tarih] UNIQUE NONCLUSTERED 
(
	[PersonelID] ASC,
	[VardiyaTarihi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
ALTER TABLE [dbo].[Personel]  WITH CHECK ADD  CONSTRAINT [FK_Personel_Departmanlar] FOREIGN KEY([DepartmanID])
REFERENCES [dbo].[Departmanlar] ([DepartmanID])
GO
ALTER TABLE [dbo].[Personel] CHECK CONSTRAINT [FK_Personel_Departmanlar]
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
