CREATE table customer(
customer_id int PRIMARY KEY,
name varchar2(32) not null,
user_name varchar2(32) not null UNIQUE,
password varchar2(32)not null,
Email varchar2(50) not null,
Mobile_number number(15) not null,
reg_date date DEFAULT sysdate);
alter table customer modify reg_date TIMESTAMP default sysdate;

CREATE SEQUENCE auto_increment
START WITH 4
INCREMENT BY 1;


drop SEQUENCE auto_increment;

drop SEQUENCE auto_increment;
--register
insert into customer(customer_id,name,user_name,password,email,mobile_number)
values(1,'hariharan','har2912','hari1234','hari1234@gamil.com',9080899233);
insert into customer(customer_id,name,user_name,password,email,mobile_number)
values(2,'kathi','kathi','kathi23','karthivalues@gamil.com',9089899233);
insert into customer(customer_id,name,user_name,password,email,mobile_number)
values(3,'ganesh','ganesh29121','hdka12341','ganesh341@gamil.com',9034399233);
insert into customer(customer_id,name,user_name,password,email,mobile_number)
values(AUTO_INCREMENT.nextval,'hemnaath','hemnaath18','hemn2911','hemnaathr@gamil.com',9042402399);

-- login 
SELECT  * FROM customer;
where user_name='har2912' and password='hari1234';

create table bus_list(
bus_id INT PRIMARY key ,
bus_name VARCHAR2(100) not null,
Source varchar2(50),
destination varchar2(50),
bus_far number(10),
bus_category varchar2(30),
total_seats number(5),
available_seats number(5),
seat_type varchar2(50),
start_time VARCHAR2(30),
end_time VARCHAR2(30),
travel_dureation VARCHAR2(30));

insert into bus_list
values (AUTO_INCREMENT.nextval,'SETC tamilnadu','Chennai','Trichy',500,'Non AC',40,40,'semi sleeper','10:00','04:00','6hrs'); 

insert into bus_list
values (AUTO_INCREMENT.nextval,'SETC tamilnadu','Madurai','Chennai',500,'Non AC',40,40,'semi sleeper','11:00','06:00','7hrs'); 

insert into bus_list
values (AUTO_INCREMENT.nextval,'SETC tamilnadu','Madurai','Trichy',500,'Non AC',40,40,'semi sleeper','11:00','06:00','7hrs'); 



select * from bus_list;
--bus root select
select * from bus_list where source='Chennai' and destination='Trichy';




