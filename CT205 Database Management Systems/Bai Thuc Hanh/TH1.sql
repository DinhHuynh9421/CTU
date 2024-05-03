--Bai thuc hanh 1
--Cau 5
CREATE USER Test1 IDENTIFIED BY Test1;

GRANT CREATE SESSION TO Test1;

ALTER USER Test1 IDENTIFIED BY pTest1;

GRANT CREATE TABLE TO Test1 WITH ADMIN OPTION;

CREATE TABLE Students( SID char(7) PRIMARY KEY, 
SName Varchar2(30)); 
INSERT INTO Students VALUES('1940000','Phung Phung Phi'); 
INSERT INTO Students VALUES('1940001','Tao Tung Thieu'); 
SELECT * FROM STUDENTS; 

--Cau 6
CREATE USER Test2 IDENTIFIED BY Test2 
DEFAULT TABLESPACE USERS QUOTA 2M ON USERS;

GRANT CREATE SESSION TO Test2;

GRANT CREATE TABLE TO Test2 WITH ADMIN OPTION;

CREATE TABLE Products( PID char(3) PRIMARY KEY, 
PName Varchar2(30)); 
INSERT INTO Products VALUES('P01','Kem Danh Rang P/S'); 
INSERT INTO Products VALUES('P02','Khan Giay Puppy'); 
SELECT * FROM PRODUCTS;

REVOKE CREATE TABLE FROM Test1; 

CREATE TABLE Students( SID char(7) PRIMARY KEY, 
 SName Varchar2(30)); 
INSERT INTO Students VALUES('1941111','Phung Phung Huyen'); 
INSERT INTO Students VALUES('1942221','Tao Tung Ong'); 
SELECT * FROM STUDENTS;

SELECT * FROM Products;
SELECT * FROM Students;

REVOKE CREATE TABLE FROM Test1;

CREATE TABLE Dev1( SIF char(7) PRIMARY KEY, 
 SNames Varchar2(30)); 
INSERT INTO Dev1 VALUES('1941112','Phung Phung Huyen'); 
INSERT INTO Dev1 VALUES('1942231','Tao Tung Ong'); 
SELECT * FROM DEV1;

CREATE TABLE Dev2( SIF char(7) PRIMARY KEY, 
 SName Varchar2(30)); 
INSERT INTO Dev2 VALUES('1941111','Phung Phung Huyen'); 
INSERT INTO Dev2 VALUES('1942221','Tao Tung Ong'); 
SELECT * FROM DEV2;

CREATE USER Test3 IDENTIFIED BY Test3 
DEFAULT TABLESPACE USERS QUOTA 2M ON USERS;

GRANT CREATE SESSION TO Test3;

GRANT CREATE TABLE TO Test3 WITH ADMIN OPTION;

--Cau 7
SELECT * FROM Test1.Students;

GRANT SELECT, UPDATE ON students TO Test2 WITH GRANT OPTION;

DELETE FROM Test1.Students;

GRANT SELECT, UPDATE ON Test1.students TO Test3;

UPDATE Test1.Students SET sname='bla bla bla' WHERE 
SID='1940001' 
SELECT * FROM Test1.Students;

GRANT DELETE ON Test1.students TO Test3;

REVOKE SELECT, UPDATE ON Students FROM Test2;

--Cau 8
CREATE USER user1 IDENTIFIED BY user1 
 DEFAULT TABLESPACE USERS QUOTA 1M ON USERS; 
CREATE USER user2 IDENTIFIED BY user2 
 DEFAULT TABLESPACE USERS QUOTA 1M ON USERS; 
 
CREATE ROLE TTOracle;

GRANT CREATE SESSION, CREATE TABLE, CREATE PROCEDURE, 
 CREATE TRIGGER TO TTOracle; 
 
GRANT TTOracle TO user1,user2;

REVOKE TTOracle FROM user1;

--Cau 9
create user uimp1 identified by uimp1 
default tablespace users quota 2M on users;

grant create session, create table to uimp1; 
imp userid=uimp1 file=D:\CT205\csdl1.dmp fromuser=csdl1 touser=uimp1

create user uimp2 identified by uimp2 
default tablespace users quota 2M on users;

grant create session, create table to uimp2; 
imp userid=uimp2 file=D:\CT205\csdl2.dmp fromuser=csdl2 touser=uimp2 touser=qlyBH

create user uimp3 identified by uimp3 
default tablespace users quota 2M on users;

grant create session, create table to qlyBH; 
imp userid=qlyBH/hqtcsdl file=d:\qlbh.dmp fromuser=qlbh 
touser=qlyBH

--Cau 10
sqlplus sys as sysdba

SQL> create directory expdir as ‘D:\backup’; 
SQL> grant read, write on directory expdir to hr; 
SQL> commit;

select * from dba_directories; 

expdp hr/hr@xe schemas=hr directory=expdir dumpfile=hr.dmp

expdp hr/hr@xe tables=(regions,locations) 
directory=expdir dumpfile=hrTabs.dmp 

SQL> grant read, write on directory expdir to uimp1;

impdp uimp1 @xe directory=expdir dumpfile=hr.dmp 
remap_schema=hr:uimp1

--Cau 11
expdp system@xe full=y directory=expdir dumpfile=full%U.dmp 
filesize=100M logfile=fullexp.log 

--Bai tap tu lam buoi 1
--Cau 1
sqlplus sys as sysdba

SELECT username FROM dba_users;
CREATE USER new_user1 IDENTIFIED BY 123;
DEFAULT TABLESPACE USERS QUOTA @M ON USERS;

GRANT CREATE SESSION, CREATE TABLE TO qlyBH; 
imp userid=qlyBH/hqtcsdl file=d:\qlbh.dmp fromuser=qlbh 
touser=qlyBH 

--Cau 2
sqlplus sys as sysdba

ALTER USER SCOTT ACCOUNT UNLOCK;
ALTER USER HR ACCOUNT UNLOCK;

ALTER USER SCOTT IDENTIFIED BY 123;
ALTER USER HR IDENTIFIED BY th1;

sqlplus HR/th1
sqlplus SCOTT/123

EXIT;
--Cau 3

--Cau 4
GRANT INSERT, UPDATE, DELETE ON hr.table1 TO scott;
GRANT INSERT, UPDATE, DELETE ON scott.table2 TO hr;

-- SCOTT sua du lieu trong bang cua HR
INSERT INTO hr.table1 SID VALUES ('1941111','Nguyen Van A');;
-- SCOTT xoa du lieu trong bang cua HR
DELETE FROM hr.table1 WHERE condition;














