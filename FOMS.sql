show databases;
create database FOMS;
use FOMS;
create table customer (cus_id int primary key, cus_name varchar(20), cus_age int NOT NULL, phone_no int(10) NOT NULL, cus_address varchar(20));
create table orders (ord_id int primary key, cus_id int, food_id int ,
foreign key (cus_id) references customer(cus_id) ON DELETE CASCADE, foreign key(food_id) references food(food_id) ON DELETE CASCADE);
create table food (food_id int primary key, food_name varchar(20),food_cost decimal(5,2));
create table food_category (food_id int, food_cate_name varchar(20), veg varchar(20), non_veg varchar(20), 
foreign key (food_id) references food(food_id) ON DELETE CASCADE);
create table bill ( bill_id int primary key, cus_id int, payment_method varchar(20), total_cost decimal(5,2), 
foreign key (cus_id) references customer(cus_id) ON DELETE CASCADE);

select * from customer;
select * from orders;
select * from food;
select * from food_category;
select * from bill;

alter table customer modify  phone_no bigint NOT NULL;

insert into customer values (111,'Karthik Ballal',20,9874563211,'bantwal');

