CREATE DATABASE OtelPersonelYonetimi;
GO

USE OtelPersonelYonetimi;
GO

-- Departman tablosu
CREATE TABLE Departmanlar (
    DepartmanID INT PRIMARY KEY IDENTITY(1,1),
    DepartmanAdi NVARCHAR(50) NOT NULL
);

-- Pozisyon tablosu
CREATE TABLE Pozisyonlar (
    PozisyonID INT PRIMARY KEY IDENTITY(1,1),
    PozisyonAdi NVARCHAR(50) NOT NULL,
    DepartmanID INT FOREIGN KEY REFERENCES Departmanlar(DepartmanID)
);

-- Personel tablosu
CREATE TABLE Personel (
    PersonelID INT PRIMARY KEY IDENTITY(1,1),
    TCKimlikNo NVARCHAR(11) UNIQUE NOT NULL,
    Adi NVARCHAR(50) NOT NULL,
    Soyadi NVARCHAR(50) NOT NULL,
    DogumTarihi DATE NOT NULL,
    Cinsiyet NVARCHAR(5) CHECK (Cinsiyet IN ('Erkek', 'Kadın')),
    Adres NVARCHAR(200),
    Telefon NVARCHAR(15),
    Email NVARCHAR(100),
    IseBaslamaTarihi DATE NOT NULL,
    IstenAyrilmaTarihi DATE NULL,
    PozisyonID INT FOREIGN KEY REFERENCES Pozisyonlar(PozisyonID),
    AktifMi BIT DEFAULT 1
);

-- Maaş tablosu
CREATE TABLE Maaslar (
    MaasID INT PRIMARY KEY IDENTITY(1,1),
    PersonelID INT FOREIGN KEY REFERENCES Personel(PersonelID),
    BrutMaas DECIMAL(10, 2) NOT NULL,
    NetMaas DECIMAL(10, 2) NOT NULL,
    MaasAyi INT NOT NULL CHECK (MaasAyi BETWEEN 1 AND 12),
    MaasYili INT NOT NULL,
    OdemeTarihi DATE,
    Aciklama NVARCHAR(200),
    CONSTRAINT UQ_Maas_Personel_AyYil UNIQUE (PersonelID, MaasAyi, MaasYili)
);

-- Sigorta bilgileri tablosu
CREATE TABLE SigortaBilgileri (
    SigortaID INT PRIMARY KEY IDENTITY(1,1),
    PersonelID INT FOREIGN KEY REFERENCES Personel(PersonelID),
    SigortaNo NVARCHAR(20) NOT NULL,
    BaslangicTarihi DATE NOT NULL,
    BitisTarihi DATE NULL,
    SigortaTuru NVARCHAR(50) DEFAULT 'SGK',
    AylikPrim DECIMAL(10, 2) NOT NULL
);

-- Vardiya türleri tablosu
CREATE TABLE VardiyaTurleri (
    VardiyaTurID INT PRIMARY KEY IDENTITY(1,1),
    VardiyaAdi NVARCHAR(50) NOT NULL,
    BaslangicSaati TIME NOT NULL,
    BitisSaati TIME NOT NULL
);

-- Personel vardiyaları tablosu
CREATE TABLE PersonelVardiyalari (
    VardiyaID INT PRIMARY KEY IDENTITY(1,1),
    PersonelID INT FOREIGN KEY REFERENCES Personel(PersonelID),
    VardiyaTurID INT FOREIGN KEY REFERENCES VardiyaTurleri(VardiyaTurID),
    VardiyaTarihi DATE NOT NULL,
    DurumNotu NVARCHAR(100),
    CONSTRAINT UQ_Personel_Vardiya_Tarih UNIQUE (PersonelID, VardiyaTarihi)
);

-- Mesai türleri tablosu
CREATE TABLE MesaiTurleri (
    MesaiTurID INT PRIMARY KEY IDENTITY(1,1),
    MesaiTurAdi NVARCHAR(50) NOT NULL,
    CarpanKatsayi DECIMAL(3, 2) NOT NULL DEFAULT 1.5
);

-- Mesai kayıtları tablosu
CREATE TABLE MesaiKayitlari (
    MesaiID INT PRIMARY KEY IDENTITY(1,1),
    PersonelID INT FOREIGN KEY REFERENCES Personel(PersonelID),
    MesaiTurID INT FOREIGN KEY REFERENCES MesaiTurleri(MesaiTurID),
    MesaiTarihi DATE NOT NULL,
    BaslangicSaati TIME NOT NULL,
    BitisSaati TIME NOT NULL,
    MesaiSuresi DECIMAL(5, 2) NOT NULL, -- Saat olarak
    MesaiUcreti DECIMAL(10, 2) NOT NULL,
    Onaylandi BIT DEFAULT 0,
    Aciklama NVARCHAR(200)
);

-- Eksik mesai kayıtları tablosu
CREATE TABLE EksikMesaiKayitlari (
    EksikMesaiID INT PRIMARY KEY IDENTITY(1,1),
    PersonelID INT FOREIGN KEY REFERENCES Personel(PersonelID),
    EksikMesaiTarihi DATE NOT NULL,
    EksikSure DECIMAL(5, 2) NOT NULL, -- Saat olarak
    KesilisTutari DECIMAL(10, 2) NOT NULL,
    Aciklama NVARCHAR(200)
);

-- İzin türü tablosu
CREATE TABLE IzinTurleri (
    IzinTurID INT PRIMARY KEY IDENTITY(1,1),
    IzinTurAdi NVARCHAR(50) NOT NULL,
    UcretliMi BIT DEFAULT 1
);

-- İzin kayıtları tablosu
CREATE TABLE IzinKayitlari (
    IzinID INT PRIMARY KEY IDENTITY(1,1),
    PersonelID INT FOREIGN KEY REFERENCES Personel(PersonelID),
    IzinTurID INT FOREIGN KEY REFERENCES IzinTurleri(IzinTurID),
    BaslangicTarihi DATE NOT NULL,
    BitisTarihi DATE NOT NULL,
    IzinGunSayisi INT NOT NULL,
    OnayDurumu NVARCHAR(20) DEFAULT 'Beklemede',
    Aciklama NVARCHAR(200)
);

-- Örnek verilerin eklenmesi
-- Departmanlar
INSERT INTO Departmanlar (DepartmanAdi) VALUES 
('Ön Büro'), ('Kat Hizmetleri'), ('Yiyecek & İçecek'), ('Muhasebe'), ('İnsan Kaynakları');

-- Pozisyonlar
INSERT INTO Pozisyonlar (PozisyonAdi, DepartmanID) VALUES 
('Resepsiyon Görevlisi', 1), 
('Bellboy', 1), 
('Kat Görevlisi', 2), 
('Kat Şefi', 2), 
('Garson', 3), 
('Aşçı', 3), 
('Muhasebe Uzmanı', 4), 
('İK Uzmanı', 5);

-- Vardiya Türleri
INSERT INTO VardiyaTurleri (VardiyaAdi, BaslangicSaati, BitisSaati) VALUES 
('Sabah', '08:00', '16:00'), 
('Akşam', '16:00', '00:00'), 
('Gece', '00:00', '08:00');

-- Mesai Türleri
INSERT INTO MesaiTurleri (MesaiTurAdi, CarpanKatsayi) VALUES 
('Normal Mesai', 1.5), 
('Hafta Sonu Mesai', 2.0), 
('Tatil Günü Mesai', 2.5);

-- İzin Türleri
INSERT INTO IzinTurleri (IzinTurAdi, UcretliMi) VALUES 
('Yıllık İzin', 1), 
('Hastalık İzni', 1), 
('Ücretsiz İzin', 0), 
('Mazeret İzni', 1);

-- Personel Bilgileri
INSERT INTO Personel (TCKimlikNo, Adi, Soyadi, DogumTarihi, Cinsiyet, Adres, Telefon, Email, IseBaslamaTarihi, PozisyonID) VALUES 
('12345678901', 'Ahmet', 'Yılmaz', '1985-05-10', 'Erkek', 'Ankara Cad. No:123 İstanbul', '5551234567', 'ahmet.yilmaz@email.com', '2020-03-15', 1),
('23456789012', 'Ayşe', 'Demir', '1990-08-22', 'Kadın', 'İzmir Sok. No:45 İstanbul', '5552345678', 'ayse.demir@email.com', '2019-06-10', 3),
('34567890123', 'Mehmet', 'Kaya', '1982-12-03', 'Erkek', 'Bağdat Cad. No:78 İstanbul', '5553456789', 'mehmet.kaya@email.com', '2021-02-01', 6),
('45678901234', 'Zeynep', 'Çelik', '1992-04-15', 'Kadın', 'Atatürk Cad. No:56 İzmir', '5554567890', 'zeynep.celik@email.com', '2018-11-20', 4),
('56789012345', 'Ali', 'Öztürk', '1988-09-27', 'Erkek', 'Cumhuriyet Mah. No:34 Ankara', '5555678901', 'ali.ozturk@email.com', '2022-01-05', 7);

-- Sigorta Bilgileri
INSERT INTO SigortaBilgileri (PersonelID, SigortaNo, BaslangicTarihi, SigortaTuru, AylikPrim) VALUES 
(1, 'SGK12345678', '2020-03-15', 'SGK', 1250.50),
(2, 'SGK23456789', '2019-06-10', 'SGK', 1100.75),
(3, 'SGK34567890', '2021-02-01', 'SGK', 1350.25),
(4, 'SGK45678901', '2018-11-20', 'SGK', 1200.00),
(5, 'SGK56789012', '2022-01-05', 'SGK', 1400.50);

-- Maaş Bilgileri (Son 2 ay için)
INSERT INTO Maaslar (PersonelID, BrutMaas, NetMaas, MaasAyi, MaasYili, OdemeTarihi) VALUES 
(1, 12000.00, 9600.00, 1, 2025, '2025-01-05'),
(2, 10000.00, 8000.00, 1, 2025, '2025-01-05'),
(3, 15000.00, 12000.00, 1, 2025, '2025-01-05'),
(4, 13500.00, 10800.00, 1, 2025, '2025-01-05'),
(5, 16000.00, 12800.00, 1, 2025, '2025-01-05'),
(1, 12000.00, 9600.00, 2, 2025, '2025-02-05'),
(2, 10000.00, 8000.00, 2, 2025, '2025-02-05'),
(3, 15000.00, 12000.00, 2, 2025, '2025-02-05'),
(4, 13500.00, 10800.00, 2, 2025, '2025-02-05'),
(5, 16000.00, 12800.00, 2, 2025, '2025-02-05');

-- Vardiya Kayıtları (Son 1 hafta için)
INSERT INTO PersonelVardiyalari (PersonelID, VardiyaTurID, VardiyaTarihi) VALUES 
(1, 1, '2025-03-08'),
(2, 2, '2025-03-08'),
(3, 3, '2025-03-08'),
(4, 1, '2025-03-08'),
(5, 2, '2025-03-08'),
(1, 1, '2025-03-09'),
(2, 2, '2025-03-09'),
(3, 3, '2025-03-09'),
(4, 1, '2025-03-09'),
(5, 2, '2025-03-09'),
(1, 1, '2025-03-10'),
(2, 2, '2025-03-10'),
(3, 3, '2025-03-10'),
(4, 1, '2025-03-10'),
(5, 2, '2025-03-10');

-- Mesai Kayıtları
INSERT INTO MesaiKayitlari (PersonelID, MesaiTurID, MesaiTarihi, BaslangicSaati, BitisSaati, MesaiSuresi, MesaiUcreti, Onaylandi) VALUES 
(1, 1, '2025-03-08', '16:00', '18:00', 2.00, 150.00, 1),
(3, 1, '2025-03-08', '08:00', '10:00', 2.00, 180.00, 1),
(2, 2, '2025-03-09', '16:00', '19:00', 3.00, 300.00, 1),
(4, 1, '2025-03-10', '16:00', '17:30', 1.50, 135.00, 0),
(5, 1, '2025-03-10', '00:00', '02:00', 2.00, 200.00, 0);

-- Eksik Mesai Kayıtları
INSERT INTO EksikMesaiKayitlari (PersonelID, EksikMesaiTarihi, EksikSure, KesilisTutari, Aciklama) VALUES 
(2, '2025-03-07', 1.00, 62.50, 'Geç gelme'),
(4, '2025-03-08', 0.50, 42.19, 'Erken çıkış'),
(1, '2025-03-09', 0.75, 56.25, 'Öğle molası uzatma');

-- İzin Kayıtları
INSERT INTO IzinKayitlari (PersonelID, IzinTurID, BaslangicTarihi, BitisTarihi, IzinGunSayisi, OnayDurumu, Aciklama) VALUES 
(3, 1, '2025-03-20', '2025-03-27', 5, 'Onaylandı', 'Yıllık izin'),
(5, 2, '2025-02-15', '2025-02-17', 3, 'Onaylandı', 'Hastalık izni'),
(2, 4, '2025-03-13', '2025-03-13', 1, 'Beklemede', 'Aile ziyareti');


-- Yeni personellerin eklenmesi
INSERT INTO Personel (TCKimlikNo, Adi, Soyadi, DogumTarihi, Cinsiyet, Adres, Telefon, Email, IseBaslamaTarihi, PozisyonID) VALUES 
('67890123456', 'Fatma', 'Yıldız', '1987-03-25', 'Kadın', 'Bahçelievler Mah. No:42 İstanbul', '5556789012', 'fatma.yildiz@email.com', '2023-04-15', 5),
('78901234567', 'Emre', 'Şahin', '1991-11-12', 'Erkek', 'Göztepe Cad. No:123 İstanbul', '5557890123', 'emre.sahin@email.com', '2022-10-01', 2),
('89012345678', 'Selin', 'Arslan', '1993-07-08', 'Kadın', 'Kozyatağı Sok. No:18 İstanbul', '5558901234', 'selin.arslan@email.com', '2024-01-10', 8),
('90123456789', 'Mustafa', 'Kurt', '1984-09-30', 'Erkek', 'Kadıköy Mah. No:67 İstanbul', '5559012345', 'mustafa.kurt@email.com', '2023-08-22', 6),
('01234567890', 'Elif', 'Aydın', '1989-05-17', 'Kadın', 'Maltepe Cad. No:55 İstanbul', '5550123456', 'elif.aydin@email.com', '2024-02-15', 3);

-- Sigorta bilgilerinin eklenmesi
INSERT INTO SigortaBilgileri (PersonelID, SigortaNo, BaslangicTarihi, SigortaTuru, AylikPrim) VALUES 
(6, 'SGK67890123', '2023-04-15', 'SGK', 1250.00),
(7, 'SGK78901234', '2022-10-01', 'SGK', 1100.00),
(8, 'SGK89012345', '2024-01-10', 'SGK', 1400.00),
(9, 'SGK90123456', '2023-08-22', 'SGK', 1350.00),
(10, 'SGK01234567', '2024-02-15', 'SGK', 1150.25);

-- Maaş bilgilerinin eklenmesi (son 2 ay için)
INSERT INTO Maaslar (PersonelID, BrutMaas, NetMaas, MaasAyi, MaasYili, OdemeTarihi) VALUES 
(6, 11500.00, 9200.00, 1, 2025, '2025-01-05'),
(7, 9800.00, 7840.00, 1, 2025, '2025-01-05'),
(8, 14000.00, 11200.00, 1, 2025, '2025-01-05'),
(9, 15000.00, 12000.00, 1, 2025, '2025-01-05'),
(10, 10500.00, 8400.00, 1, 2025, '2025-01-05'),
(6, 11500.00, 9200.00, 2, 2025, '2025-02-05'),
(7, 9800.00, 7840.00, 2, 2025, '2025-02-05'),
(8, 14000.00, 11200.00, 2, 2025, '2025-02-05'),
(9, 15000.00, 12000.00, 2, 2025, '2025-02-05'),
(10, 10500.00, 8400.00, 2, 2025, '2025-02-05');

-- Vardiya kayıtlarının eklenmesi (son 1 hafta için)
INSERT INTO PersonelVardiyalari (PersonelID, VardiyaTurID, VardiyaTarihi) VALUES 
(6, 2, '2025-03-08'),
(7, 1, '2025-03-08'),
(8, 2, '2025-03-08'),
(9, 3, '2025-03-08'),
(10, 1, '2025-03-08'),
(6, 2, '2025-03-09'),
(7, 1, '2025-03-09'),
(8, 2, '2025-03-09'),
(9, 3, '2025-03-09'),
(10, 1, '2025-03-09'),
(6, 2, '2025-03-10'),
(7, 1, '2025-03-10'),
(8, 2, '2025-03-10'),
(9, 3, '2025-03-10'),
(10, 1, '2025-03-10');

-- Mesai kayıtlarının eklenmesi
INSERT INTO MesaiKayitlari (PersonelID, MesaiTurID, MesaiTarihi, BaslangicSaati, BitisSaati, MesaiSuresi, MesaiUcreti, Onaylandi) VALUES 
(6, 1, '2025-03-09', '00:00', '02:00', 2.00, 172.50, 1),
(7, 2, '2025-03-09', '16:00', '18:30', 2.50, 245.00, 1),
(8, 1, '2025-03-10', '16:00', '18:00', 2.00, 175.00, 0),
(9, 3, '2025-03-08', '08:00', '11:00', 3.00, 375.00, 1),
(10, 1, '2025-03-10', '16:00', '17:30', 1.50, 131.25, 0);

-- Eksik mesai kayıtlarının eklenmesi
INSERT INTO EksikMesaiKayitlari (PersonelID, EksikMesaiTarihi, EksikSure, KesilisTutari, Aciklama) VALUES 
(7, '2025-03-08', 0.5, 30.63, 'Geç gelme'),
(9, '2025-03-09', 1.0, 75.00, 'İzinsiz erken çıkış'),
(10, '2025-03-10', 0.25, 16.41, 'Öğle molasından geç dönüş');

-- İzin kayıtlarının eklenmesi
INSERT INTO IzinKayitlari (PersonelID, IzinTurID, BaslangicTarihi, BitisTarihi, IzinGunSayisi, OnayDurumu, Aciklama) VALUES 
(6, 2, '2025-03-25', '2025-03-27', 3, 'Onaylandı', 'Sağlık raporu'),
(8, 1, '2025-04-10', '2025-04-17', 5, 'Beklemede', 'Yıllık izin talebi'),
(9, 4, '2025-03-18', '2025-03-18', 1, 'Onaylandı', 'Acil aile durumu');