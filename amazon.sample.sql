CREATE TABLE PRODUCTS1(
PRODUCT_ID NUMBER(15)PRIMARY KEY,
PRODUCT_NAME VARCHAR2(100) NOT NULL,
DESCRIPTION VARCHAR2(1000),
STANDARD_COST NUMBER(15),
LIST_PRICE NUMBER(15),
CATEGORY_ID NUMBER(15));

select * from products1; 

CREATE TABLE ORDER_ITEMS1(
ORDER_ID NUMBER(15)PRIMARY KEY,
ITEM_ID NUMBER(15) NOT NULL UNIQUE,
product_id NUMBER(15)CONSTRAINT product_component_fk REFERENCES products(product_id),
quantity NUMBER(10) CONSTRAINT no_qty NOT NULL CONSTRAINT check_qty CHECK (quantity > 0),
UNIT_PRICE NUMBER(15));

CREATE TABLE ORDERS1(
ORDER_ID NUMBER(15),
CUSTOMER_ID NUMBER(15)PRIMARY KEY,
STATUS VARCHAR2(20),
SALESMAN_ID VARCHAR(10),
ORDER_DATE DATE) ;
ALTER TABLE ORDERS MODIFY SALESMAN_ID NUMBER(15);
ALTER TABLE ORDERS ADD FOREIGN KEY(SALESMAN_ID) REFERENCES EMPLOYEES(EMPLOYEE_ID); 


CREATE TABLE CUSTOMERS1(
CUSTOMER_ID NUMBER(15)PRIMARY KEY,
NAME varchar2(15) NOT NULL,
address VARCHAR2(100),
WEBSITE VARCHAR(30),
CREDIT_LINIT NUMBER(15),
FOREIGN KEY (CUSTOMER_ID) REFERENCES ORDERS1(CUSTOMER_ID));
alter table customers1 rename column CREDIT_LINIT to CREDIT_LIMIT;

select * from customers1;

ALTER TABLE customers modify name varchar2(32);
select * from customers1;

CREATE TABLE EMPLOYEES(
EMPLOYEE_ID NUMBER(15)PRIMARY KEY,
FIRST_NAME VARCHAR2(32) NOT NULL,
LAST_NAME VARCHAR2(32) NOT NULL,
EMAIL VARCHAR2(50),
PHONE NUMBER(15));
select * from employees;
ALTER TABLE EMPLOYEES ADD (HIRE_DATE DATE,MANAGER_ID NUMBER(10),JOB_TITLE VARCHAR2(20));

DESCRIBE EMPLOYEES;

--DROP TABLE EMPLOYEES;
--DROP TABLE ORDERS;
--DROP TABLE ORDER_ITEMS;
--DROP TABLE CUSTOMERS;
--DROP TABLE PRODUCTS;


SELECT * FROM products inner JOIN order_items ON PRODUCTS.PRODUCT_ID=ORDER_ITEMS.PRODUCT_ID;
SELECT * FROM order_items INNER JOIN ORDERS ON order_items.order_id=orders.order_id;
SELECT * FROM ORDERS INNER JOIN employees ON orders.SALESMAN_id=employees.employee_id;
SELECT * FROM ORDERS INNER JOIN CUSTOMERS ON ORDERS.CUSTOMER_ID=customers.customer_id;

SELECT * FROM PRODUCTS1;
SELECT * FROM order_items1;
SELECT * FROM ORDERS1;
SELECT * FROM employees;
SELECT * FROM CUSTOMERS1;
DESCRIBE customers1;


insert into customers1 values(1,'Oliver','Star City','arrowcom',20000);
insert into customers1 values(2,'Barry','Central City','flash.com',20000);
insert into customers1 values(3,'Kara','National City','supergirl.com',15000);
insert into customers1 values(4,'Sara','Star City','arrow.com',24000);
insert into customers1 values(5,'Bruce','Gotham City','batman.com',2000000);
insert into customers1 values(6,'Clark','Metropolis','superman.com',10000);
insert into customers1 values(8,'Anakin','Tatooine','satrwars.com',20000);
insert into customers1 values(9,'Peter','New Jersey','spidey.om',14000);

insert into orders1 values(401,2,'Shipped',5,'21-08-2021');
insert into orders1 values(402,1,'Packed',7,'7-11-2020');
insert into orders1 values(403,3,'Delivered',2,'11-3-2019');
insert into orders1 values(404,6,'Packed',5,'28-12-2020');
insert into orders1 values(405,4,'Shipped',7,'19-05-2018');
insert into orders1 values(406,7,'Delivered',6,'2-02-2020');
insert into orders1 values(407,2,'Delivered',6,'13-06-2020');
insert into orders1 values(408,9,'Shipped',7,'12-04-2021');
insert into orders1 values(409,8,'Packed',6,'13-7-2020');
DESCRIBE order_items;
delete order_items;
insert into order_items1 values(401,501,101,2,15000);
insert into order_items1 values(402,502,102,4,5000);
insert into order_items1 values(403,503,103,1,9000);
insert into order_items1 values(404,504,104,4,18000);
insert into order_items1 values(405,505,105,3,6000);
insert into order_items1 values(406,506,106,5,2000);
insert into order_items1 values(407,507,107,4,7000);
insert into order_items1 values(408,508,108,2,3000);
describe order_items;


insert into products1 values(101,'Mobile','a small portable radio telephone',1500,6500,201);
insert into products1 values(102,'Laptob','a small, portable personal computer (PC) with a screen and alphanumeric keyboard.',21000,56500,205);
insert into products1 values(103,'Earphone','a small piece of equipment which you wear over or inside your ears so that you can listen to music, the radio, or your phone without anyone else hearing',3100,10000,203);
insert into products1 values(104,'Mobile Case','designed to attach to, support, or otherwise hold a smartphone,',300,500,202);
insert into products1 values(105,'Bag','a bag is a kind of soft container.',500,1500,208);
insert into products1 values(106,'Charger','a charger is the accessory you plug into your phone or laptop when the battery power is low',100,2500,201);
insert into products1 values(107,'Guitar','a flat-bodied stringed instrument with a long fretted neck and usually six strings played with a pick or with the fingers',6500,18500,219);
insert into products1 values(108,'Violin','The violin is a string instrument which has four strings and is played with a bow.',5500,14500,219);
insert into products1 values(109,'Water Bottle','A water bottle is a container that is used to hold water, liquids or other beverages for consumption.',250,750,235);
insert into products1 values(110,'Pen','A pen is a common writing instrument that applies ink to a surface, usually paper, for writing or drawing',50,150,231);

DESCRIBE products;

insert into contacts values(2001,'Oliver','Queen','Oliver@gmail.com',9836433993,1);
insert into contacts values(2002,'Barry','Allen','Barry@gmail.com',8342833949,2);
insert into contacts values(2003,'Kara','Denvers','karazoral@gmail.com',8336463359,3);
insert into contacts values(2004,'Sara','Lence','saralance@gmail.com',7364833394,4);
insert into contacts values(2005,'Bruce','Wayne','bruce@gmail.com',8366473597,5);
insert into contacts values(2006,'Clark','Kent','clark@gmail.com',736433991,6);
insert into contacts values(2007,'Anakin','Skywalker','skywalker@gamil.com',987654445,7);
insert into contacts values(2008,'Luck','Skywalker','luckskywalker@gamil.com',986544876,8);
insert into contacts values(2009,'Peter','Parker','spider@gamil.com',865578836,9);

insert into employees values(0001,'tony','stark','iron@gamil.com',982764082,'11-02-2010',22,'HR');
insert into employees values(0002,'Steve','Rogers','cap@gamil.com',6974837642,'12-06-2011',12,'Delivery');
insert into employees values(0004,'Bruce','Banner','hulk@gamil.com',755264082,'02-2-2008',8,'Admin');
insert into employees values(0005,'Thor','Odinson','thor@gamil.com',845264082,'1-07-2012',18,'Delivery');
insert into employees values(0006,'Nick','Fury','nick@gamil.com',9658264082,'14-11-2008',12,'Delivery');
insert into employees values(0007,'Clint','Barton','hawkeye@gamil.com',7834264082,'15-04-2014',17,'Delivery');
insert into employees values(0008,'Natasha','Romanoff','blackwidow@gamil.com',9688264082,'23-05-2016',22,'HR');


select * from employees;
describe employees;
SELECT * FROM products inner JOIN order_items ON PRODUCTS.PRODUCT_ID=ORDER_ITEMS.PRODUCT_ID;
SELECT * FROM order_items INNER JOIN ORDERS ON order_items.order_id=orders.order_id;
SELECT * FROM ORDERS INNER JOIN employees ON orders.SALESMAN_id=employees.employee_id;
SELECT * FROM ORDERS INNER JOIN CUSTOMERS ON ORDERS.CUSTOMER_ID=customers.customer_id;



--Write query to display which category sold most with QTY
select * from products;
desc products;
select * from orders;
select * from order_items;
standared_xcost

SELECT products.category_id,sum(order_items.quantity)as qty 
FROM products 
inner JOIN order_items ON PRODUCTS.PRODUCT_ID=ORDER_ITEMS.PRODUCT_ID
group by products.category_id
order by qty desc
fetch first 1 rows only;

select * from products;

create table product_categories
(category_id number primary key
,category_name varchar2(50));
insert into product_categories values(201,'electronices');
insert into product_categories values(202,'medical');
insert into product_categories values(203,'food');
insert into product_categories values(204,'cloths');
insert into product_categories values(205,'bikes');
drop table product_categories;
