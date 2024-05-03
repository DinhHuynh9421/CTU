/*Khuvuc(IP, tenKhuvuc, tang )
Ph�ng (MP, tenphong, somay , IP )
Loai (idloai, tenloai )
May (idMay, tenmay, IP, ad, idloai, MP )
Phanmem(idPM, tenPM, ngaymua, version, idloai, gia )
Caidat (id, idMay, idPM, ngaycai)*/
CREATE TABLE Khuvuc(
  IP CHAR(11) PRIMARY KEY,
  tenKhuvuc VARCHAR(30) NOT NULL,
  tang CHAR(1)
  );
CREATE TABLE Phong(
  MP CHAR(3) PRIMARY KEY,
  tenphong VARCHAR(30) NOT NULL,
  somay SMALLINT, 
  IP CHAR(11) REFERENCES KHUVUC(ip)
  --FOREIGN KEY(IP) REFERENCES Khuvuc(ip)
  );
CREATE TABLE Loai(
  idLoai CHAR(5) PRIMARY KEY,
  tenloai VARCHAR(18) NOT NULL
  );
CREATE TABLE May(
  idMay CHAR(3) PRIMARY KEY,
  tenmay VARCHAR(8) NOT NULL,
  IP CHAR(11),
  ad SMALLINT CHECK(AD>=0 AND AD<=255),
  idloai CHAR(4),
  MP CHAR(3)
  );

CREATE TABLE Phanmem(
  ipPM CHAR(4) PRIMARY KEY,
  tenPM VARCHAR(11) NOT NULL,
  ngaymua DATE,
  Version VARCHAR(3),
  idLoai CHAR(5) REFERENCES LOAI(idloai),
  gia SMALLINT CHECK (GIA>=0)
  );
CREATE TABLE Caidat(
  idMay CHAR(3) REFERENCES MAY(idmay),  
  idPM CHAR(4) REFERENCES PHANMEM(idpm),
  id CHAR(2) PRIMARY KEY,
  ngaycai DATE
  );
  
insert into khuvuc values('130.120.80','Brin RDC',null);
insert into khuvuc values('130.120.81','Brin tang 1',null);
insert into khuvuc values('130.120.82','Brin tang 2',null);

----------------------------------------------------

insert into phong values('s01','salle 1',3,'130.120.80');
insert into phong values('s02','salle 2',2,'130.120.80');
insert into phong values('s03','salle 3',2,'130.120.80');
insert into phong values('s11','salle 11',2,'130.120.81');
insert into phong values('s12','salle 12',1,'130.120.81');
insert into phong values('s21','salle 21',2,'130.120.82');
insert into phong values('s22','salle 22',0,'130.120.83');
insert into phong values('s23','salle 23',0,'130.120.83');

--select * from khuvuc;
--select * from phong;
----------------------------------------------------

insert into loai values('TX','Terminal X-Window');
insert into loai values('UNIX','Syst�me Unix');
insert into loai values('PCNT','PC Windows NT');
insert into loai values('PCWS','PC Windows');
insert into loai values('NC','Network Computer');

-----------------------------------------------------
insert into may values('p1','Poste 1','130.120.80',01,'TX','s01');
insert into may values('p2','Poste 2','130.120.80',02,'UNIX','s01');
insert into may values('p3','Poste 3','130.120.80',03,'TX','s01');
insert into may values('p4','Poste 4','130.120.80',04,'PCWS','s02');
insert into may values('p5','Poste 5','130.120.80',05,'PCWS','s02');
insert into may values('p6','Poste 6','130.120.80',06,'UNIX','s03');
insert into may values('p7','Poste 7','130.120.80',07,'TX','s03');
insert into may values('p8','Poste 8','130.120.81',01,'UNIX','s11');
insert into may values('p9','Poste 9','130.120.81',02,'TX','s11');
insert into may values('p10','Poste 10','130.120.81',03,'UNIX','s12');
insert into may values('p11','Poste 11','130.120.82',01,'PCNT','s21');
insert into may values('p12','Poste 12','130.120.82',02,'PCWS','s21');
-----------------------------------------------------
insert into phanmem values('log1','Oracle 6','1995-05-13','6.2','UNIX',3000);
insert into phanmem values('log2','Oracle 8','1999-09-15','8i','UNIX',5600);
insert into phanmem values('log3','SQL Server','1998-04-12','7','PCNT',2700);
insert into phanmem values('log4','Front Page','1997-06-03','5','PCWS',500);
insert into phanmem values('log5','WinDev','1997-05-12','5','PCWS',750);
insert into phanmem values('log6','SQL*Net',null,'2.0','UNIX',500);
insert into phanmem values('log7','I.I.S.','2002-04-12','2','PCNT',810);
insert into phanmem values('log8','Dreamweaver','2003-09-21','2.0','BeOS',1400);

--SELECT * FROM PHANMEM;
-----------------------------------------------------
insert into caidat(idMay,idPM,id,ngaycai) values('p2','log1','1','2003-05-15');
insert into caidat(idMay,idPM,id,ngaycai) values('p2','log2','2','2003-09-17');
insert into caidat(idMay,idPM,id,ngaycai) values('p4','log5','3',null);
insert into caidat(idMay,idPM,id,ngaycai) values('p6','log6','4','2003-05-20');
insert into caidat(idMay,idPM,id,ngaycai) values('p6','log1','5','2003-05-20');
insert into caidat(idMay,idPM,id,ngaycai) values('p6','log2','15','2003-05-20');
insert into caidat(idMay,idPM,id,ngaycai) values('p8','log2','6','2003-05-19');
insert into caidat(idMay,idPM,id,ngaycai) values('p8','log1','12','2003-05-20');
insert into caidat(idMay,idPM,id,ngaycai) values('p8','log6','7','2003-05-20');
insert into caidat(idMay,idPM,id,ngaycai) values('p11','log3','8','2003-04-20');
insert into caidat(idMay,idPM,id,ngaycai) values('p12','log4','9','2003-04-20');
insert into caidat(idMay,idPM,id,ngaycai) values('p11','log7','10','2003-04-20');
insert into caidat(idMay,idPM,id,ngaycai) values('p7','log7','11','2003-04-01');
 
 UPDATE KHUVUC SET TANG='0' WHERE IP='130.120.80';
 UPDATE PHANMEM SET GIA=GIA*0.9 WHRE IDLOAI='UNIX';
 ALTER TABLE MAY ADD NBLOG SMALLINT;
 UPDATE MAY SET NBLOG=0 WHETE IDMAY('P1','P3','P5','P9','P10');
 UPDATE MAY SET NBLOG=1 WHETE IDMAY('P4','P7','P12');
 UPDATE MAY SET NBLOG=0 WHETE IDMAY('P2','P6','P8','P11');
 CREATE TABLE PhanmemUNIX(
  idPM CHAR(4),
  tenPM VARCHAR(11),
  ngaymua DATE,
  version CHAR(3)
  );
R