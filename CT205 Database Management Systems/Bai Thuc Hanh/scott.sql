-- Thuc hanh buoi 2
-- Cau 5a
select * from emp;
select * from bonus;

declare
    cursor c_emp is
    select *
    from emp
    where extract(year from sysdate) - extract(year from hiredate)>25
    and sal <2000;
    v_emp c_emp%rowtype;
begin
    open c_emp;
    loop
        fetch c_emp into v_emp;
        exit when c_emp%notfound;
        
        if v_emp.comm is null then
            v_emp.comm:=500;
        else
            v_emp.comm:=v_emp.comm+500;
        end if;
        
        update emp
        set comm = v_emp.comm
        where empno = v_emp.empno;
        
        insert into bonus(ename, job, sal, comm)
            values(v_emp.ename, v_emp.job, v_emp.sal, v_emp.comm);
    end loop;
    commit;
    close c_emp;
end;

select * from emp;
select * from bonus;


-- Cau 5b
create table emp_retire(
    empno       number(4) not null,
    ename       varchar2(10),
    job         varchar2(9),
    mgr         number(4),
    hiredate    date,
    sal         number(7,2),
    comm        number(7,2),
    deptno      number(2));

declare
    cursor cEmpRetire is
    select *
    from emp
    where extract(year from sysdate) - extract(year from hiredate) >= 28
    for update;
begin
    
    for emp_rec in cEmpRetire
    loop
        insert into emp_retire(empno, ename, job, mgr, hiredate, sal, comm, deptno)
            values(emp_rec.empno, emp_rec.ename, emp_rec.job, emp_rec.mgr, emp_rec.hiredate, emp_rec.sal, emp_rec.comm, emp_rec.deptno);
        delete from emp
        where current of cEmpRetire;
    end loop;
    
end;

select * from emp_retire;


-- Cau 5c
-- Khoi phuc du lieu cho bang emp
insert into emp
select *
from emp_retire;

select * from emp;

declare
    manager emp.mgr%type;
    cursor c_emp(mgr_no number) is
        select sal
        from emp
        where mgr = mgr_no
        for update of sal;
begin
    select empno into manager
    from emp
    where ename = 'KING';
    
    for emp_rec in c_emp(manager)
    loop
        update emp
        set sal = emp_rec.sal*1.05
        where current of c_emp;
    end loop;
    commit;
end;


-- Bai tap tu lam sau buoi 2
-- Cau 1-1
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


-- Cau 1-2
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


-- Cau 1-3
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


-- Cau 1-4
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


-- Cau 1-5
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