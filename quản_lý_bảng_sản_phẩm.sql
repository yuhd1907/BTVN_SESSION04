create schema quanlysanpham;
set search_path to quanlysanpham;

create table products
(
    id           serial primary key,
    name         varchar(100),
    category     varchar(100),
    price        decimal(15, 0),
    stock        int,
    manufacturer varchar(25)
);

INSERT INTO products (name, category, price, stock, manufacturer)
VALUES ('Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
       ('Chuột Logitech M90', 'Phụ kiện', 150000, 50, 'Logitech'),
       ('Bàn phím cơ Razer', 'Phụ kiện', 2200000, 0, 'Razer'),
       ('Macbook Air M2', 'Laptop', 32000000, 7, 'Apple'),
       ('iPhone 14 Pro Max', 'Điện thoại', 35000000, 15, 'Apple'),
       ('Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
       ('Tai nghe AirPods 3', 'Phụ kiện', 4500000, NULL, 'Apple');

insert into products (name, category, price, stock, manufacturer)
values ('Chuột không dây Logitech M170', 'Phụ kiện', 300000, 20, 'Logitech');

update products
set price = price * 1.1
where manufacturer = 'Apple';

delete
from products
where stock = 0;

select *
from products
where price between 1000000 and 30000000;

select *
from products
where stock IS NULL;

select distinct manufacturer
from products;

select *
from products
order by price desc, name asc;

select *
from products
where name ilike '%laptop%';

select *
from products
order by price desc, name asc
limit 2 offset 0;