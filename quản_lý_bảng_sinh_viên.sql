create schema SinhVien;
set search_path to SinhVien;

create table students
(
    id         serial primary key,
    full_name  varchar(100),
    gender     varchar(10),
    birth_year int,
    major      varchar(25),
    gpa        decimal(3, 1)
);

INSERT INTO students (full_name, gender, birth_year, major, gpa)
VALUES ('Nguyễn Văn A', 'Nam', 2002, 'CNTT', 3.6),
       ('Trần Thị Bích Ngọc', 'Nữ', 2001, 'Kinh tế', 3.2),
       ('Lê Quốc Cường', 'Nam', 2003, 'CNTT', 2.7),
       ('Phạm Minh Anh', 'Nữ', 2000, 'Luật', 3.9),
       ('Nguyễn Văn A', 'Nam', 2002, 'CNTT', 3.6),
       ('Lưu Đức Tài', '2004', 2004, 'Cơ khí', NULL),
       ('Võ Thị Thu Hằng', 'Nữ', 2001, 'CNTT', 3.0);

insert into students (full_name, gender, birth_year, major, gpa)
values ('Phan Hoàng Nam', 'Nam', 2003, 'CNTT', 3.8);

update students
set gpa = 3.4
where full_name = 'Lê Quốc Cường';

delete
from students
where gpa is null;

select *
from students
where major = 'CNTT'
  and gpa >= 3.0
limit 3 offset 0;

select distinct major
from students;

select *
from students
where major = 'CNTT'
order by gpa desc, full_name asc;

select *
from students
where full_name ilike 'nguyễn%';

select *
from students
where birth_year between 2001 and 2003;