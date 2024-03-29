


create database new
use new

----------------------------------------------------------------------------
--Create, Insert:

create table customer(
c_id int not null primary key,
c_name varchar(10) not null,
product_id int FOREIGN KEY REFERENCES product(p_id),
amount float
)
insert into customer (c_id, c_name, product_id, amount)
values (1,'ali',2, 1),
       (2,'veli',4, 2), 
       (3,'nuri',3, 2.5),
       (4,'safi',3, 2),
       (5,'ayse',null, null);

--Rename:

exec sp_rename 'customer.product_id', 'p_id'
select * from customer


----  ----   -----  ----   -----  ----   -----  ----   ----  -----   -----  ---   --------


create table product(
p_id int not null primary key,
p_name varchar(10) unique not null,
price float
)
insert into product (p_id, p_name, price)
values (1, 'elma', 5),
       (2, 'armut', 4.5),
       (3, 'ayva', 8),
       (4, 'brokoli', 10);


--------------------------------------------------------------------------
--Alter, Drop:

alter table customer add c_surname int;
alter table customer alter column c_surname varchar(10);
alter table customer drop column c_surname;

select * from customer

----------------------------------------------------------------------------
--Delete, Update:

delete from product where p_name='armut' 
insert into product (p_id, p_name, price) values (2, 'armut', 4.5);
update product set price=8.5 where price=8

select * from product


-----------------------------------------------------------------------------
--order by/ group by

select c_name, amount 
from customer
order by amount asc


alter table customer add gender varchar(10);
insert into customer (gender)
values  ('male'),
	('male'),
	('male'),
	('male'),
        ('female');
select *
from customer
group by gender


------------------------------------------------------------------------------
--Joins:

select c_id, c_name, p_name, price, amount, (amount*price)as paid
from customer inner join product 
on customer.p_id = product.p_id


select c_id, c_name, p_name, price, amount, (amount*price)as paid
from customer left join product 
on customer.p_id = product.p_id


select c_id, c_name, p_name, price, amount, (amount*price)as paid
from customer right join product 
on customer.p_id = product.p_id


select c_id, c_name, p_name, price, amount, (amount * price)as paid
from customer full join product 
on customer.p_id = product.p_id


----------------------------------------------------------------------------------------------------

 




