--Bai Thuc hanh 3


CREATE TABLE TACPHAM(
	NT 		smallint primary key ,
	tua 		varchar(150),
	tacgia 		varchar(100)
) ;

CREATE TABLE DOCGIA (
	ND		smallint PRIMARY KEY ,
	ho		VARCHAR(30),
	ten		VARCHAR(30),
	dchi	VARCHAR(100),
	tel		CHAR(10)
) ;

CREATE TABLE SACH (
	NS		smallint primary key ,
	nxb		varchar(50),
	NT		smallint not null, 
 	foreign key(NT) references TACPHAM(NT)
);

CREATE TABLE MUON (
	NS		smallint not NULL, 
	foreign key(NS) references SACH(NS),
	ngaymuon	date not NULL,
	hantra	date not null,
	ngaytra 	date,
	ND		smallint not null, 
	foreign key(ND) references DOCGIA(ND),
	primary key 	(NS, ngaymuon)
) ;


INSERT INTO TACPHAM VALUES (1,'Les miserables','Victor Hugo');
INSERT INTO TACPHAM VALUES (2,'Germinal ','Emile Zola');
INSERT INTO TACPHAM VALUES (3,'Madame Bovary','Gustave Flaubert');
INSERT INTO TACPHAM VALUES (4,'Les Fleurs du mal','Charles Baudelaire');
INSERT INTO TACPHAM VALUES (5,'La Bete Humaine','Emile Zola');
INSERT INTO TACPHAM VALUES (6,'Le Pere Goriot ','Honore de Balzac');
INSERT INTO TACPHAM VALUES (7,'Le Rouge et le Noir','Stendhal');
INSERT INTO TACPHAM VALUES (8,'Une vie','Guy de Maupassant');
INSERT INTO TACPHAM VALUES (9,'Ubu Roi','Alfred Jarry');
INSERT INTO TACPHAM VALUES (10,'Po�e','Arthur Rimbaud');
INSERT INTO TACPHAM VALUES (11,'La Mare au Diable','George Sand');
INSERT INTO TACPHAM VALUES (12,'Carmen','Prosper Merimee');
INSERT INTO TACPHAM VALUES (13,'Lettres de mon moulin','Alphonse Daudet');
INSERT INTO TACPHAM VALUES (14,'Les contes du chat perché', 'Marcel Ayme');
INSERT INTO TACPHAM VALUES (15,'La Peste','Albert Camus');
INSERT INTO TACPHAM VALUES (16,'Le petit prince','Antoine de St Exupery');


INSERT INTO DOCGIA VALUES (1,'Lecoeur','Jeanette','16 rue de la R�blique, 75010 Paris','0145279274');
INSERT INTO DOCGIA VALUES (2,'Lecoeur','Philippe','16 rue de la R�blique, 75010 Paris','0145279274');
INSERT INTO DOCGIA VALUES (3,'Dupont','Yvan','73 rue Lamarck, 75018 Paris','0163538294');
INSERT INTO DOCGIA VALUES (4,'Mercier','Claude','155 avenue Parmentier, 75011 Paris','0136482736');
INSERT INTO DOCGIA VALUES (5,'L�r','Marc','90 avenue du Maine, 75014 Paris','0164832947');
INSERT INTO DOCGIA VALUES (6,'Martin','Laure','51 boulevard Diderot, 75012 Paris','0174693277');
INSERT INTO DOCGIA VALUES (7,'Crozier','Martine','88 rue des Portes Blanches, 75018 Paris','0146829384');
INSERT INTO DOCGIA VALUES (8,'Lebon','Cl�nt','196 boulevard de Sebastopol, 75001 Paris','0132884739');
INSERT INTO DOCGIA VALUES (9,'Dufour','Jacques','32 rue des Alouettes, 75003 Paris','0155382940');
INSERT INTO DOCGIA VALUES (10,'Dufour','Antoine','32 rue des Alouettes, 75003 Paris','0155382940');
INSERT INTO DOCGIA VALUES (11,'Dufour','St�anie','32 rue des Alouettes, 75003 Paris','0155382940');
INSERT INTO DOCGIA VALUES (12,'Raymond','Carole','35 rue Oberkampf, 75011 Paris','0153829402');
INSERT INTO DOCGIA VALUES (13,'Durand','Albert','4 rue Mandar, 75002 Paris','0642374021');
INSERT INTO DOCGIA VALUES (14,'Wilson','Paul','12 rue Paul Vaillant Couturier, 92400 Montrouge','0642327407');
INSERT INTO DOCGIA VALUES (15,'Grecault','Philippe','15 rue de la Roquette, 75012 Paris','0132762983');
INSERT INTO DOCGIA VALUES (16,'Carre','St�ane','51 boulevard Diderot, 75012 Paris','0174693277');
INSERT INTO DOCGIA VALUES (17,'Johnson','Astrid','3 rue L� Blum, 75002 Paris','0143762947');
INSERT INTO DOCGIA VALUES (18,'Mirou','Caroline','2 square Mirabeau, 75011 Paris','0163827399');
INSERT INTO DOCGIA VALUES (19,'Espelette','Jean-Jacques','141 avenue de France, 75019 Paris','0134887264');
INSERT INTO DOCGIA VALUES (20,'Despentes','Anthony','56 boulevard de la Villette, 75019 Paris','0133889463');
INSERT INTO DOCGIA VALUES (21,'Terlu','V�nique','45 rue des Batignolles, 75020 Paris','0165998372');
INSERT INTO DOCGIA VALUES (22,'Rihour','C�le','7 rue Montorgueil, 75002 Paris','0166894754');
INSERT INTO DOCGIA VALUES (23,'Franchet','Pierre','160 rue Montmartre, 75009 Paris','0633628549');
INSERT INTO DOCGIA VALUES (24,'Trochet','Ernest','34 rue de l''Esperance, 75008 Paris','0638295563');
INSERT INTO DOCGIA VALUES (25,'Gainard','Simon','55 rue Desnouettes, 75015 Paris','0174928934');
INSERT INTO DOCGIA VALUES (26,'Touche','Johanna','14 rue du Bac, 75006 Paris','0619384065');
INSERT INTO DOCGIA VALUES (27,'Cornu','Sylvain','22 rue Mouffetard, 75005 Paris','0184927489');
INSERT INTO DOCGIA VALUES (28,'Frederic','Cyril','15 rue du Simplon, 75018 Paris','0173625492');
INSERT INTO DOCGIA VALUES (29,'Crestard','Cedric','5 rue Doudeauville, 75018 Paris','0629485700');
INSERT INTO DOCGIA VALUES (30,'Le Bihan','Karine','170 bis rue Ordener, 75018 Paris','0638995221');


INSERT INTO SACH VALUES (1,'GF',1);
INSERT INTO SACH VALUES (2,'FOLIO',2);
INSERT INTO SACH VALUES (3,'HACHETTE',3);
INSERT INTO SACH VALUES (4,'GF',4);
INSERT INTO SACH VALUES (5,'FOLIO',5);
INSERT INTO SACH VALUES (6,'FOLIO',6);
INSERT INTO SACH VALUES (7,'GF',7);
INSERT INTO SACH VALUES (8,'FOLIO',8);
INSERT INTO SACH VALUES (9,'HACHETTE',9);
INSERT INTO SACH VALUES (10,'GF',10);
INSERT INTO SACH VALUES (11,'HACHETTE',11);
INSERT INTO SACH VALUES (12,'FOLIO',12);
INSERT INTO SACH VALUES (13,'GF',13);
INSERT INTO SACH VALUES (14,'FOLIO',14);
INSERT INTO SACH VALUES (15,'HACHETTE',15);
INSERT INTO SACH VALUES (16,'HACHETTE',16);
INSERT INTO SACH VALUES (17,'GF',1);
INSERT INTO SACH VALUES (18,'FOLIO',2);
INSERT INTO SACH VALUES (19,'HACHETTE',2);
INSERT INTO SACH VALUES (20,'FOLIO',4);
INSERT INTO SACH VALUES (21,'GF',5);
INSERT INTO SACH VALUES (22,'HACHETTE',4);
INSERT INTO SACH VALUES (23,'HACHETTE',7);
INSERT INTO SACH VALUES (24,'FOLIO',8);
INSERT INTO SACH VALUES (25,'GF',1);
INSERT INTO SACH VALUES (26,'HACHETTE',10);
INSERT INTO SACH VALUES (27,'FOLIO',11);
INSERT INTO SACH VALUES (28,'FOLIO',12);
INSERT INTO SACH VALUES (29,'GF',1);
INSERT INTO SACH VALUES (30,'HACHETTE',14);

INSERT INTO MUON VALUES (1,'9-2-2007','9-16-2007','9-7-2007',1);
INSERT INTO MUON VALUES (1,'10-1-2006','10-15-2006','10-11-2006',26);
INSERT INTO MUON VALUES (1,'6-14-2007','6-28-2007','6-19-2007',2);

INSERT INTO MUON VALUES (1,'4-27-2007','5-11-2007','5-8-2007',3);
INSERT INTO MUON VALUES (2,'8-23-2007','9-6-2007','9-2-2007',4);
INSERT INTO MUON VALUES (2,'10-6-2007','10-20-2007', NULL,28);

INSERT INTO MUON VALUES (9,'10-6-2007','10-20-2007', NULL,28);
INSERT INTO MUON VALUES (3,'9-9-2007','9-23-2007','9-13-2007',3);
INSERT INTO MUON VALUES (4,'2-8-2007','2-22-2007','2-12-2007',12);
INSERT INTO MUON VALUES (4,'2-7-2006','2-21-2006','2-20-2006',4);

INSERT INTO MUON VALUES (4,'6-17-2007','7-1-2007','6-27-2007',5);
INSERT INTO MUON VALUES (5,'10-4-2007','10-19-2007', NULL,16);
INSERT INTO MUON VALUES (6,'3-11-2007','3-25-2007','3-16-2007',3);

INSERT INTO MUON VALUES (8,'7-14-2007','7-28-2007','7-20-2007',18);
INSERT INTO MUON VALUES (8,'3-9-2007','3-23-2007','3-27-2007',13);

INSERT INTO MUON VALUES (10,'4-11-2007','4-25-2007','4-23-2007',8);
INSERT INTO MUON VALUES (10,'1-27-2006','2-10-2006','1-31-2006',7);
INSERT INTO MUON VALUES (11,'10-1-2007','10-15-2007', NULL,22);

INSERT INTO MUON VALUES (12,'3-3-2003','3-17-2003','3-13-2003',7);
INSERT INTO MUON VALUES (14,'10-2-2007','10-16-2007', NULL,1);
INSERT INTO MUON VALUES (15,'5-4-2007','5-18-2007','5-12-2007',10);

INSERT INTO MUON VALUES (16,'10-5-2007','10-19-2007', NULL,2);
INSERT INTO MUON VALUES (18,'7-4-2007','7-18-2007','7-11-2007',3);
INSERT INTO MUON VALUES (20,'12-17-2006','12-31-2006','12-17-2006',27);

INSERT INTO MUON VALUES (20,'9-6-2007','9-20-2007','9-22-2007',9);
INSERT INTO MUON VALUES (21,'9-7-2007','9-21-2007','9-19-2007',14);
INSERT INTO MUON VALUES (24,'2-14-2007','2-28-2007','2-20-2007',26);
INSERT INTO MUON VALUES (25,'8-19-2006','9-2-2006','9-3-2006',1);
INSERT INTO MUON VALUES (26,'11-15-2006','11-29-2006','11-22-2006',9);
INSERT INTO MUON VALUES (29,'9-20-2007','10-4-2007', NULL,27);

--Do KHANH TOAN
--MSSV B2012046
--STT 47

--cau 1
select *
from TACPHAM;

select *
from DOCGIA;

select *
from SACH;

select *
from MUON;

-- cau 3
select tp.nt, tp.tua from tacpham tp
where tp.tacgia='Guy de Maupassant';
--cau 4
select * from docgia dg
where dg.dchi ='32 rue des Alouettes, 75003 Paris';

-- cau 5
select s.nxb from sach s
join tacpham tp on s.nt = tp.nt
where tp.tua like '%Fleur%';

--cau 6
select tua from tacpham
where tacpham.tua like 'Le%';

--cau 7
select * from docgia dg
join muon m on m.nd = dg.nd
where m.ngaymuon between to_date('09-15-2007','MM-DD-YYYY') and to_date ('09-20-2007', 'MM-DD-YYYY');

--cau 8
select s.nxb from sach s
join tacpham tp on s.nt = tp.nt
where tp.tua like '%Germinal%';

--¢au 9
select dg.ten from sach s
join tacpham tp on tp.nt=s.nt
join muon m on m.ns=s.ns
join docgia dg on dg.nd=m.nd
where tp.tua='Poésie';

--cau 10
select dg.ho, dg.ten from sach s
join tacpham tp on tp.nt = s.nt
join muon m on m.ns = s.ns
join docgia dg on dg.nd=m.nd
where tp.tua ='Les Fleurs du mal';

--cau 11
select tp.tua, dg.ten from sach s
join tacpham tp on tp.nt = s.nt
join muon m on m.ns = s.ns
join docgia dg on dg.nd=m.nd
where m.ngaytra > m.hantra;

--cau 12
select tp.tua,dg.ten from sach s
join tacpham tp on tp.nt = s.nt
join muon m on m.ns = s.ns
join docgia dg on dg.nd=m.nd
where m.ngaytra < m.hantra;

--cau 13
select dg.ten from sach s
join tacpham tp on tp.nt = s.nt
join muon m on m.ns = s.ns
join docgia dg on dg.nd=m.nd
where tp.tacgia = 'Victor Hugo';

--cau 14
select dg.ten,tp.tua from sach s
join tacpham tp on tp.nt = s.nt
join muon m on m.ns = s.ns
join docgia dg on dg.nd=m.nd
where extract (Year from m.ngaymuon) ='2007';

-- cau 15
select count(*)
from tacpham;

-- cau 16
select t.nt, tua, count(*)
from tacpham t join sach s on t.nt=s.nt
group by t.nt, tua having count(*)>=2
order by t.nt;

--cau 17
select tacgia, count(*) stop
from tacpham
group by tacgia;

--cau 18
select t.nt, tua, count (*) sosach
from tacpham t join sach s on t.nt = s.nt
group by t.nt, tua
order by t.nt;

--cau 19
select nd, extract (year from ngaymuon) nam, count (*) solanmuon
from muon
group by nd, extract (year from ngaymuon)
order by nd;

--cau 20
select t.nt, tua, count(*)
from tacpham t join sach s on t.nt=s.nt
group by t.nt, tua having count(*)>=3
order by t.nt;

-- cau 21
select t.nt, tua, count(*)
from tacpham t join sach s on t.nt = s.nt
group by t.nt, tua having count (*)>=(select max(count(*)) from sach group by nt);

-- cau 22
select t.nt, nxb, count(*)
from sach s join tacpham t on s.nt = s.nt
group by t.nt, nxb having count (*)>=(select max(count(*)) from sach group by nt);

-- cau 23
select count(*)
from(select tacgia,count(*)sotp
from tacpham
group by tacgia having count(*)>1)

--cau 24
select tp.tua, count(*) from muon m
join sach s on s.ns =m.ns
join tacpham tp on tp.nt = s.nt
group by tp.tua having count(*) =
(select max(count(*)) from muon ml
join sach s1 on s1.ns = ml.ns
join tacpham tpl on tpl.nt = s1.nt
group by tpl.tua)

-- cau 25
select tp.tua, count(*) from muon m
join sach s on s.ns =m.ns
join tacpham tp on tp.nt = s.nt
group by tp.tua having count(*) =
(select min(count(*)) from muon ml
join sach s1 on s1.ns = ml.ns
join tacpham tpl on tpl.nt = s1.nt
group by tpl.tua)

-- cau 26
select m.nd, count(distinct tp.nt) solanmuon from muon m
join sach s on s.ns = m.ns
join tacpham tp on tp.nt=s.nt
group by m.nd having count(distinct tp.nt) =
(select max(count(distinct tpl.nt)) from muon ml
join sach sl on sl.ns = ml.ns
join tacpham tpl on tpl.nt = sl.nt
group by ml.nd);

--cau 27
select m.nd, count(distinct tp.nt) solanmuon from muon m
join sach s on s.ns = m.ns
join tacpham tp on tp.nt=s.nt
group by m.nd having count(distinct tp.nt) =
(select min(count(distinct tpl.nt)) from muon ml
join sach sl on sl.ns = ml.ns
join tacpham tpl on tpl.nt = sl.nt
group by ml.nd);

--cau 28
select tua
from tacpham t join sach s on t.nt = s.nt left join muon m on s.ns = m.ns
where ngaymuon is null

--cau 29
select tua
from tacpham
where nt not in (select nt
from sach s left join muon m on s.ns = m.ns
where ngaymuon is null)

--cau 30
select ho, ten
from muon m right join docgia d on d.nd = m.nd
where ngaymuon is null

--cau 31
select nxb, s.ns
from muon m right join sach s on m.ns = s.ns
where ngaymuon is null