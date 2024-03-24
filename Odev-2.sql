create table adresler(
adresNo int not null identity(1,1) Primary Key,
sehir nvarchar(50) not null,
mahalle nvarchar(50) not null,
binaNo int,
cadde nvarchar(100),
postaKodu nvarchar(20),
telefon int,
ulke nvarchar(50)
 
);

create table uyeler(
uyeNo int not null identity(1,1) Primary Key,
uyeAdi nvarchar(50) not null,
uyeSoyadi nvarchar(50) not null,
uyeCinsiyet nvarchar(10),
uyeMail nvarchar(100),
uyeTelefon int,
 
adresNo INT CONSTRAINT FK_uyeler_adresNo FOREIGN KEY(adresNo) REFERENCES adresler(adresNo)
 
);

CREATE TABLE kutuphane(
 kutuphaneIsmi nvarchar(50),
 kutuphaneAciklama nvarchar(200),
 kutuphaneNo int not null identity(1,1) Primary Key,
 
 adresNo INT CONSTRAINT FK_kutuphane_adresno FOREIGN KEY(adresNo) REFERENCES adresler(adresNo)
 
);

CREATE TABLE yazarlar(
yazarNo int identity(1,1) not null Primary Key,
yazarAdi nvarchar(25),
yazarSoyadi nvarchar(25)
 
);

CREATE TABLE kategoriler(
  kategoriNo int identity(1,1) not null,
  kategoriAdi nvarchar(25)
  
  );

CREATE TABLE kitaplar(
sayfaSayisi int,
kitapAdi nvarchar(100),

yayinTarihi datetime not null,
ISBN nvarchar(100) not null Primary Key,

yazarNo INT CONSTRAINT FK_yazar_kitaplar FOREIGN KEY(yazarNo) REFERENCES yazarlar(yazarNo),
kategoriNo INT CONSTRAINT FK_kategoriler_kitaplar FOREIGN KEY(kategoriNo) REFERENCES kategoriler(kategoriNo) 
 
);


CREATE TABLE emanet(
emanetNo int identity(1,1) not null,
emanetTarihi datetime,
teslimTarihi datetime,

uyeNo INT CONSTRAINT FK_uyeler_emanet FOREIGN KEY (uyeNo) REFERENCES uyeler(uyeNo),
kutuphaneNo INT CONSTRAINT FK_kutuphane_emanet FOREIGN KEY (kutuphaneNo) REFERENCES kutuphane(kutuphaneNo),
ISBN nvarchar(50) CONSTRAINT FK_kitaplar_emanet FOREIGN KEY (ISBN) REFERENCES kitaplar(ISBN)

);

