-- Thuc hanh buoi 2
-- Cau 3
set serveroutput on;
declare
    vEname  employees.last_name%TYPE;
    vSalary employees.salary%TYPE;
begin
    select last_name, salary into vEname, vSalary
    from employees
    where employee_id=100;
    dbms_output.put_line('Name: '||vEname||'. Salary: '||vSalary);
end;

--Cau 4
set serveroutput on;
declare
    vEname employees.first_name%TYPE;
begin
    select first_name into vEname
    from employees
    where employee_id=120;
    
    if vEname='Matthew' then
        dbms_output.put_line('Hi '|| vEname);
    else
        dbms_output.put_line('Hello '|| vEname);
    end if;
end;


set serveroutput on;
declare
    vArea varchar2(20);
begin
    select region_id into vArea
    from countries
    where country_id='CA';
    case vArea
        when 1 then vArea:='Europe';
        when 2 then vArea:='America';
        when 3 then vArea:='Asia';
        else vArea:='Other';
    end case;
    
    dbms_output.put_line('The Area is '||vArea);
end;


set serveroutput on;
declare
    counter number;
begin
    for counter in 1..4
    loop
        dbms_output.put(counter);
    end loop;
    
    dbms_output.new_line;
    
    for counter in reverse 1..4
    loop
        dbms_output.put(counter);
    end loop;
    dbms_output.new_line;
end;


-- Bai tap tu lam sau buoi 2
-- Cau 2-1
select country_name, region_name
from countries ct, regions r
where ct.region_id = r.region_id
order by region_name;

-- Cau 2-2
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

-- Cau 2-3
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


-- Cau 2-4
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

-- Cau 2-5
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