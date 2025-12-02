create schema quanlyhocbong;
set search_path to quanlyhocbong;

create table students
(
    id    serial primary key,
    name  varchar(50),
    age   int,
    major varchar(50),
    gpa   decimal(3, 2)
);

create table scholarships
(
    id         serial primary key,
    student_id int references students (id),
    name       varchar(50),
    amount     decimal(10, 2),
    year       int
);

insert into students (name, age, major, gpa)
values ('An', 20, 'CNTT', 3.5),
       ('Bình', 21, 'Toán', 3.2),
       ('Cường', 22, 'CNTT', 3.8),
       ('Dương', 20, 'Vật lý', 3.0),
       ('Em', 21, 'CNTT', 2.9);

insert into scholarships (student_id, name, amount, year)
values (1, 'Học bổng xuất sắc', 1000, 2025),
       (3, 'Học bổng xuất sắc', 1200, 2025),
       (2, 'Học bổng khuyến khích', 500, 2025),
       (4, 'Học bổng khuyến khích', 400, 2025);

insert into scholarships (student_id, name, amount, year)
select id, 'Học bổng khuyến khích', 450, 2025
from students
where name = 'Em';

update students
set gpa = 4.0
where id in (select id from scholarships where name = 'Học bổng xuất sắc');

delete
from scholarships
where id in (select id from students where gpa < 3.0);

select students.name, students.major, s.name, s.amount
from students
         join scholarships s on students.id = s.student_id
where s.year = 2025
order by s.amount desc;

select distinct *
from students
         join scholarships s on students.id = s.student_id
where s.student_id in (select student_id
               from scholarships
               group by student_id
               having count(*) > 1);

select *
from students
         join scholarships s on students.id = s.student_id
where students.name ilike '%c%'
  and s.amount > 1000;

select *
from students
order by gpa desc
limit 2 offset 0;