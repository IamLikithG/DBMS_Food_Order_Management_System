show databases;
drop database FOMS;
use FOMS;
show tables;
create table customer(cus_id int,cus_name varchar(20),phone_num int(10),cus_address varchar(20),cus_age int,constraint cus_id_prim primary key(cus_id));
create table food_category(food_cate_no int,food_cate_name varchar(20),constraint food_cate_prim primary key(food_cate_no));
create table food(food_id int,food_name varchar(20),food_cost decimal(5,2),food_cate_no int,constraint food_id_prim primary key(food_id),constraint food_cate_no_fore1 foreign key(food_cate_no) references food_category(food_cate_no)on delete cascade);
create table orders(ord_id int,cus_id int,food_id int,quantity int,order_amount int,constraint ord_id_prim primary key(ord_id,cus_id,food_id),constraint cus_id_fore foreign key(cus_id) references customer(cus_id)on delete cascade,constraint food_id_fore foreign key(food_id) references food(food_id)on delete cascade);
create table bill(bill_id int,ord_id int,cus_id int,payment_mode varchar(20),total_cost decimal(7,2),bill_date date,constraint bill_id_prim primary key(bill_id),constraint ord_id_fore1 foreign key(ord_id) references orders(ord_id)on delete cascade,constraint cus_id_fore3 foreign key(cus_id) references customer(cus_id)on delete cascade);

insert into food_category value(10,"Breakfast"); 
insert into food_category value(11,"Lunch");
insert into food_category value(12,"Dinner");
insert into food_category value(13,"Beverages");
insert into food_category value(15,"Desert");



create table customer (cus_id int primary key, cus_name varchar(20), cus_age int NOT NULL, phone_no int(10) NOT NULL, cus_address varchar(20));
create table orders (ord_id int primary key, cus_id int, food_id int ,
foreign key (cus_id) references customer(cus_id) ON DELETE CASCADE, foreign key(food_id) references food(food_id) ON DELETE CASCADE);
create table food (food_id int primary key, food_name varchar(20),food_cost decimal(5,2));
create table food_category(food_cate_no int,food_cate_name varchar(20),constraint food_cate_prim primary key(food_cate_no));
create table food_category (food_id int, food_cate_name varchar(20), veg varchar(20), non_veg varchar(20), 
foreign key (food_id) references food(food_id) ON DELETE CASCADE);
create table bill ( bill_id int primary key, cus_id int, payment_method varchar(20), total_cost decimal(5,2), 
foreign key (cus_id) references customer(cus_id) ON DELETE CASCADE);


desc food_category;
desc orders;
select * from customer;
select * from orders;
select * from food;
select * from food_category;
select * from bill;

alter table customer modify  phone_num bigint NOT NULL;
insert into orders values(1,1001,502,1,175);
delete from orders where ord_id=1 AND food_id =502;

delimiter $$;
create trigger `MaxQuantity_Voilation` before insert on `orders`
for each row
begin
if new.quantity>=5 then
signal sqlstate '45000';
end if;
end;$$

create procedure Customer_cart (in ID int) Select C.cus_name as CUSTOMER_NAME,F.food_name as FOOD_NAME,O.ord_id as ORDER_ID,F.food_cost as FOOD_UNIT_PRICE,O.quantity as QUANTITY,O.order_amount as TOTAL_AMOUNT from 
 customer C,food F,orders O where O.cus_id=ID and C.cus_id=O.cus_id and O.food_id=F.food_id;
create procedure Filter_action (in fname varchar(20)) SELECT * FROM food_category where food_cate_name=fname;

insert into orders values(11,1001,502,6,1050);

insert into customer values (112,'Likith G',20,9663832340,'mangalore');
create procedure Customer_cart (in ID int) Select C.cus_name as CUSTOMER_NAME,F.food_name as FOOD_NAME,O.ord_id as ORDER_ID,F.food_cost as FOOD_UNIT_PRICE,O.quantity as QUANTITY,O.order_amount as TOTAL_AMOUNT from 
 customer C,food F,orders O where O.cus_id=ID and C.cus_id=O.cus_id and O.food_id=F.food_id;
create procedure Filter_action (in fname varchar(20)) SELECT * FROM food_category where food_cate_name=fname;