create database Nhanvien;
create schema luongnhanvien;
set search_path to luongnhanvien;

create table employees
(
    id         serial primary key,
    full_name  varchar(50),
    department varchar(25),
    position   varchar(25),
    salary     decimal(15, 0),
    bonus      decimal(15, 0),
    join_year  int
);

INSERT INTO employees (id, full_name, department, position, salary, bonus, join_year)
VALUES (1, 'Nguyễn Văn Huy', 'IT', 'Developer', 18000000, 1000000, 2021),
       (2, 'Trần Thị Mai', 'HR', 'Recruiter', 12000000, NULL, 2020),
       (3, 'Lê Quốc Trung', 'IT', 'Tester', 15000000, 800000, 2023),
       (4, 'Nguyễn Văn Huy', 'IT', 'Developer', 18000000, 1000000, 2021),
       (5, 'Phạm Ngọc Hân', 'Finance', 'Accountant', 14000000, NULL, 2019),
       (6, 'Bùi Thị Lan', 'HR', 'HR Manager', 20000000, 3000000, 2018),
       (7, 'Đặng Hữu Tài', 'IT', 'Developer', 17000000, NULL, 2022);

delete
from employees as a
    using employees as b
where a.id <> b.id
  and a.full_name = b.full_name
  and a.department = b.department
  and a.position = b.position;

update employees
set salary = salary * 1.1
where department = 'IT'
  and salary < 18000000;

update employees
set bonus = 500000
where bonus IS NULL;

select *
from employees
where department in ('IT', 'HR')
  and join_year > 2020
  and (salary + bonus) > 15000000;

select *
from employees
order by (salary + bonus) desc;

select *
from employees
where full_name ilike 'nguyễn%' or full_name ilike '%hân';

select distinct department
from employees
where bonus IS NOT NULL;

select *
from employees
where join_year between 2019 and 2022;