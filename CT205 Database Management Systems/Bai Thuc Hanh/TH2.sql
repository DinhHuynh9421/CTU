--Bai thuc hanh 2
alter user hr identified by th2 account unlock

--Cau 1
SET SERVEROUTPUT ON; 
DECLARE
    total_sales NUMBER(15,2);
    emp_id VARCHAR2(9);
    company_number NUMBER DEFAULT 10;
BEGIN
    total_sales := 350000;
    emp_id :=3;
    dbms_output.put_line('Employed ' || emp_id ||
         ', sold total product value: ' || total_sales);
END;

--Cau 2
set serveroutput on; 
declare 
 ten varchar2(10); 
begin 
 ten := &Nhap_vao_ten_cua_ban; 
 dbms_output.put_line 
 ('chao ban ' || ten); 
end;

--Cau 3
SET SERVEROUTPUT ON; 
DECLARE 
 vEname employees.last_name%TYPE;  
 vSalary employees.salary%TYPE; 
BEGIN 
 SELECT last_name,salary INTO vEname,vSalary 
 FROM employees 
 WHERE employee_id=100; 
 DBMS_OUTPUT.PUT_LINE('Name:'||vEname||'. Salary:'|| 
vSalary); 
END;

--Cau 4
SET SERVEROUTPUT ON; 
DECLARE 
 vEname employees.first_name%TYPE; 
BEGIN 
 SELECT first_name INTO vEname 
 FROM employees 
 WHERE employee_id=120; 
 IF vEname='Matthew' THEN 
 dbms_output.put_line('Hi ' || vEname); 
 ELSE 
 dbms_output.put_line('Hello' || vEname); 
 END IF; 
END; 

SET SERVEROUTPUT ON; 
DECLARE 
 vArea VARCHAR2(20) ; 
BEGIN 
 SELECT region_id INTO vArea 
 FROM countries 
 WHERE country_id='CA' ; 
 CASE vArea 
 WHEN 1 THEN vArea :='Europe' ; 
 WHEN 2 THEN vArea :='America' ;
 WHEN 3 THEN vArea :='Asia' ; 
 ELSE vArea :='Other' ; 
 END CASE ; 
 dbms_output.put_line('The Area is ' || vArea) ; 
END ;

SET SERVEROUTPUT ON; 
DECLARE 
 counter NUMBER ; 
BEGIN 
 FOR counter IN 1..4 --t?ng 
 LOOP 
 dbms_output.put(counter) ; 
 END LOOP ; 
 dbms_output.new_line ; 
 FOR counter IN REVERSE 1..4 -- gi?m 
 LOOP 
 dbms_output.put(counter) ; 
 END LOOP ; 
 dbms_output.new_line ; 
END;

--Cau 5
--a)
DECLARE 
 CURSOR c_Emp IS 
 select * from emp
 where extract(year from sysdate) - extract(year from 
hiredate)> 25 
 and sal <2000; 
 -- Khai b�o bien de chua dong du lieu cua cursor 
 v_Emp c_Emp%rowtype; 
BEGIN 
 -- M? cursor 
 OPEN c_Emp; 
 -- D�ng v�ng l?p ?? l?y h?t d? li?u 
 LOOP 
 -- L?y m?t d�ng d? li?u t? cursor 
 FETCH c_Emp INTO v_Emp; 
 -- Tho�t khoi dong lap neu da lay het du lieu trong 
cursor 
 EXIT WHEN c_Emp%notfound; 
 -- kiem tra cac gia tri null cua cot tien thuong 
 if v_Emp.comm is null then 
 v_Emp.comm:=500; 
 else 
 v_Emp.comm:=v_Emp.comm+500; 
 end if; 
 -- C?p nh?t l?i ti?n th??ng trong b?ng Emp v?i m� nh�n 
vi�n 
 -- trong cursor hi?n h�nh 
 UPDATE Emp 
 SET comm = v_Emp.comm 
 WHERE empno = v_Emp.empno; 
 --Luu v�o bang Bonus 
 INSERT INTO BONUS(ename, job, sal, comm) 
 VALUES (v_Emp.ename, v_Emp.job, v_Emp.sal, 
v_Emp.comm); 
 END LOOP; 
 COMMIT; -- l?u l?i nh?ng thay ??i 
 --��ng cursor 
 CLOSE c_Emp; 
END;

--b)
CREATE TABLE EMP_RETIRE ( 
 EMPNO NUMBER(4) NOT NULL, 
 ENAME VARCHAR2(10), 
 JOB VARCHAR2(9), 
 MGR NUMBER(4), 
 HIREDATE DATE, 
 SAL NUMBER(7,2), 
 COMM NUMBER(7,2), 
 DEPTNO NUMBER(2) );
 
 DECLARE 
 -- T�m c�c nh�n vi�n c� s? n?m l�m vi?c >=28, kh�a b?ng 
 -- emp khi cursor n�y ???c m?
 CURSOR cEmpRetire IS 
 Select * 
 From emp 
 where extract(year from sysdate) - 
 extract(year from hiredate) >= 28 
 FOR UPDATE; 
BEGIN 
 -- bi?n emp_rec ???c d�ng tr?c ti?p ?? l?y t?ng d�ng d? li?u 
 -- trong cursor,ta d�ng c�ch n�y thay cho vi?c khai b�o bi?n 
v� 
 -- d�ng l?nh FETCH 
 FOR emp_rec IN cEmpRetire 
 LOOP 
 -- L?y d�ng hi?n h�nh c?a cursor ?? th�m v�o b?ng retire 
 INSERT INTO Emp_Retire(Empno, EName, Job, Mgr, 
 Hiredate, Sal, Comm, Deptno) 
 VALUES (emp_rec.Empno, emp_rec.EName, emp_rec.Job, 
emp_rec.Mgr, emp_rec.Hiredate, emp_rec.Sal, emp_rec.Comm, 
emp_rec.Deptno); 
 -- X�a d? li?u trong Emp v?i m?u tin gi?ng v?i 
 -- m?u tin trong cursor hi?n h�nh 
 DELETE FROM Emp 
 WHERE CURRENT OF cEmpRetire; 
 END LOOP; 
END; 

--c)
DECLARE 
 --Khai b�o bi?n manager c� ki?u d? li?u gi?ng v?i c?t MGR 
 --trong b?ng EMP 
 manager EMP.MGR%TYPE; 
 --Khi b�o cursor c� tham s? truy?n v�o l� m� s? c?a manager 
 --v� kh�a c?t SAL trong b?ng EMP l?i khi cursor n�y ???c m?
 CURSOR C_Emp(mgr_no number) IS 
 SELECT SAL 
 FROM EMP 
 WHERE MGR = mgr_no 
 FOR UPDATE of SAL; 
BEGIN 
 --T�m m� s? c?a nh�n vi�n t�n l� KING l?u v�o bi?n manager 
 SELECT empno INTO manager 
 FROM EMP 
 WHERE EName = 'KING'; 
 --Khai b�o kh�ng t??ng minh bi?n emp_rec tr?c ti?p trong 
 --v�ng l?p for ?? l?u gi� tr? c?a cursor hi?n h�nh 
 --ta d�ng c�ch n�y thay cho vi?c khai b�o t??ng minh m?t 
bi?n 
 --sau ?� d�ng l?nh FETCH ?? chuy?n d? li?u v�o bi?n ?� 
 FOR emp_rec IN C_Emp(manager) 
 LOOP 
 UPDATE scott.EMP 
 SET sal = emp_rec.sal * 1.05 
 WHERE CURRENT OF C_Emp; 
 END LOOP; 
 COMMIT; 
END;

--Bai tap tu lam 
--Cau 1
--1.1
set serverout on;
declare
    inputJob    emp.job%type;
    cursor j_emp(ipJob emp.job%type) is
    select *
    from emp
    where emp.job = ipJob;
    counter     int;
begin
    counter := 0;
    inputJob:= &Nhap_gia_tri_can_tim;
    
    for emp_rec in j_emp(inputJob)
    loop
        counter := counter+1;
    end loop;
    
    dbms_output.put_line('So dong tim duoc la: '||counter);
    dbms_output.put_line('Cac dong do la: ');
    
    for emp_rec in j_emp(inputJob)
    loop
        dbms_output.put_line(emp_rec.empno||'|'||emp_rec.ename||'|'||emp_rec.job||'|'||emp_rec.mgr||'|'||emp_rec.hiredate||'|'||emp_rec.comm||'|'||emp_rec.deptno);
    end loop;
end;

--1.2
set serveroutput on;
declare
    inputNo         emp.empno%type;
    emp_ename       emp.ename%type;
    emp_hiredate    emp.hiredate%type;
    emp_sal         emp.sal%type;
begin
    inputNo := &Nhap_gia_tri_can_tim;
    select ename, hiredate, sal into emp_ename, emp_hiredate, emp_sal
    from emp
    where empno=inputNo;
    
    if emp_sal>1200 then
        dbms_output.put_line('Co phai muc luong lon hon 1200: Co');
    else
        dbms_output.put_line('Co phai muc luong lon hon 1200: Khong');
    end if;
    
    if instr (emp_ename,'T') = 0 then
        dbms_output.put_line('Ten nhan vien co chua chu T: Khong');
    else
        dbms_output.put_line('Ten nhan vien co chua chu T: Co');
    end if;
    
    if extract(month from emp_hiredate) = 12 then
        dbms_output.put_line('Ngay gia nhap co quan co phai thang 12: Co');
    else
        dbms_output.put_line('Ngay gia nhap co quan co phai thang 12: Khong');
    end if;
end;

--1.3
select * from bonus;
insert into bonus values('NICK','MANAGER',1000,null);

declare
    cursor j_emp is
    select comm
    from bonus
    where job = 'MANAGER'
    for update;
begin
    for emp_rec in j_emp
    loop
        update bonus
        set comm = 0.2
        where current of j_emp;
    end loop;
end;

--1.4
set serveroutput on;
declare
    inputJob    emp.job%type;
    cursor j_emp(ipJob emp.job%type) is
    select empno, ename, hiredate, sal
    from emp
    where emp.job = ipJob;
begin
    inputJob := &Nhap_chuc_vu_can_tim;
    for emp_rec in j_emp(inputJob)
    loop
        dbms_output.put_line(emp_rec.empno||'|'||emp_rec.ename||'|'||emp_rec.hiredate||'|'||emp_rec.sal);
    end loop; 
end;

--1.5
create table Emp_GradeSal( ename varchar2(40), sal number(7,2));
set serveroutput on;
declare
    cursor s_emp is
    select ename,sal
    from emp;
    
    cursor sg_salgrade(sFromEmp emp.sal%type) is
    select grade
    from salgrade
    where losal <= sFromEmp
    and sFromEmp <= hisal;
begin
    for emp_rec in s_emp
    loop
        for salgrade_rec in sg_salgrade(emp_rec.sal)
        loop
            insert into emp_gradesal values(emp_rec.ename,salgrade_rec.grade);
        end loop;
    end loop;
end;

select *
from Emp_GradeSal
order by sal;

drop table emp_gradesal;
--Cau 2
--2.1
select country_name, region_name
from countries ct, regions r
where ct.region_id = r.region_id
order by region_name;

--2.2
create table bang_luong(emp_id char(3), emp_fname varchar2(20), emp_lname varchar2(20), sal number(8,2));

declare
    cursor s_emp is
    select employee_id, first_name, last_name, salary, commission_pct
    from employees;
    
    s_temp employees.salary%type;
begin
    for emp_rec in s_emp
    loop
        if emp_rec.commission_pct is null then
            s_temp := emp_rec.salary;
        else
            s_temp := emp_rec.salary*emp_rec.commission_pct + emp_rec.salary;
        end if;
        insert into bang_luong values(emp_rec.employee_id, emp_rec.first_name, emp_rec.last_name, s_temp);
    end loop;
end;

select * from bang_luong;

--2.3
declare
    cursor it_emp is
    select salary
    from employees
    where job_id = 'IT_PROG'
    and extract(year from sysdate) - extract(year from hire_date) >15
    for update;
begin
    for emp_rec in it_emp
    loop
        update employees
        set salary = salary*1.1
        where current of it_emp;
    end loop;
end;

select sum(salary)
from employees
where job_id='IT_PROG';

--2.4
declare
    cursor com_emp is
    select commission_pct
    from employees
    where manager_id is null
    for update;
begin
    for emp_rec in com_emp
    loop
        update employees
        set commission_pct = 0.25
        where current of com_emp;
    end loop;
end;

--2.5
alter table employees add TinhTrang varchar2(10);
declare 
    inputID     employees.employee_id%type;
    cursor e_emp(ipID employees.employee_id%type) is
    select employee_id, hire_date, job_id, department_id
    from employees
    where ipID = employee_id
    for update;
begin
    inputID := &Nhap_ma_so_nhan_vien_da_thoi_viec;
    for emp_rec in e_emp(inputID)
    loop
        insert into job_history values(emp_rec.employee_id, emp_rec.hire_date, sysdate, emp_rec.job_id, emp_rec.department_id);
        update employees
        set tinhtrang = 'Fired'
        where current of e_emp;
    end loop;
end;















