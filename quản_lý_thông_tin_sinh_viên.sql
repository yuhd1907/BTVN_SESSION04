create database quanlysinhvien;
create schema sinhvien;
set search_path to sinhvien;

create table students
(
    id    serial primary key,
    name  varchar(50),
    age   int,
    major varchar(50),
    gpa   decimal(3, 2)
);

insert into students (name, age, major, gpa)
values ('An', 20, 'CNTT', 3.5),
       ('Bình', 21, 'Toán', 3.2),
       ('Cường', 22, 'CNTT', 3.8),
       ('Dương', 20, 'Vật lý', 3.0),
       ('Em', 21, 'CNTT', 2.9);

insert into students (name, age, major, gpa)
values ('Hùng', 23, 'Hóa học', 3.4);

update students
set gpa = 3.6
where name = 'Bình';

delete
from students
where gpa < 3.0;

select name, major
from students
order by gpa desc;

select distinct name
from students
where major = 'CNTT';

select *
from students
where gpa between 3.0 and 3.6;

select *
from students
where name like 'C%';

select *
from students
order by name asc
limit 3 offset 1;