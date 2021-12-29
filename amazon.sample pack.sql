create or replace PACKAGE sales AS 

 procedure insertCustomers1(c_id number,name IN customers1.name%type,address in customers1.address%type,
 website in customers1.website%type,credit_limt in customers1.credit_limit%type,status out varchar2,
 error out varchar2);  
 
 procedure deletecustomer1( c_id in customers1.customer_id%type,status out varchar2,error out varchar2 );
 
 procedure insertorders1(o_id number,c_id number,o_status varchar2,s_id number,o_date date,status out varchar2,
 error out varchar2);  

 procedure deleteorders1( o_id number,status out varchar2,error out varchar2); 
 
 procedure insertorderitems1(o_id number,i_id number,p_id number,qty number,price number,status out varchar2,
 error out varchar2);
 
 procedure deleteorderitems1( i_id number,status out varchar2,error out varchar2);
 
 procedure insertproducts1(p_id number,p_name varchar2,p_dec varchar2,s_price number,l_price number,
 cat number,status out varchar2,error out varchar2);  

 procedure deleteproducts1(p_id number,status out varchar2,error out varchar2);
 
 procedure insertEmployee1(firstName IN employees.first_name%type,lastName  in employees.last_name%type,
 email in employees.email%type,phone in employees.phone%type,hire in employees.hire_date%type,
 manager_id in employees.manager_id%type,job_title in employees.job_title%type,status out varchar2,
 error out varchar2);
 
 procedure deleteemployee1( employe_id in employees.employee_id%type,status out varchar2,error out varchar2);

 
END sales;

CREATE OR REPLACE PACKAGE body sales AS 

   procedure insertCustomers1
(
c_id number,
name IN customers1.name%type,
address in customers1.address%type,
website in customers1.website%type,
credit_limt in customers1.credit_limit%type,
status out varchar2,
error out varchar2
)  
is    
begin    
insert into customers1 values( c_id,name,address,website,credit_limt );    
dbms_output.put_line('Customers record inserted successfully');

if sql%rowcount>0 then 
status:='Values Inserted';
end if;
commit;

EXCEPTION when others then 
status:='Given customer id does not exit';
error:=(sqlcode||' '||sqlerrm);
end insertcustomers1;

procedure deletecustomer1
  ( c_id in customers1.customer_id%type,
  status out varchar2,error out varchar2
  ) is
begin
  delete from customers1 where customer_id = c_id;
  if SQL%ROWCOUNT >0 
  then
    status:='Deleted';
  end if;
if sql%rowcount=0
then status:='No value Deleted';
end if;
exception
  when others then
   status:='Somthing went wrong';
   error:=sqlcode ||' '|| sqlerrm;
commit;
end deletecustomer1;

 procedure insertorders1
(o_id number,
c_id number,
o_status varchar2,
s_id number,
o_date date,
status out varchar2,
error out varchar2
)  
is    
begin    
insert into orders1 values(o_id,c_id,o_status,s_id,o_date);
dbms_output.put_line('order record inserted successfully');
if sql%rowcount>0 then 
status:='Values Inserted';
end if;
commit;

EXCEPTION when others then 
status:='Value not Inserted';
error:=sqlcode||' '||sqlerrm;
end insertorders1;

  procedure deleteorders1
  ( o_id number,
  status out varchar2,error out varchar2
  ) is
begin
  delete from orders1 where order_id = o_id;
 
  if SQL%ROWCOUNT >0 
  then
    status:='Deleted';
  end if;
if sql%rowcount=0
then status:='GIven order id not found';
end if;
exception
  when others then
   status:='value not deleted';
   error:=sqlcode ||' '|| sqlerrm;
commit;
end deleteorders1;

 procedure insertorderitems1
(o_id number,
i_id number,
p_id number,
qty number,
price number,
status out varchar2,
error out varchar2
)  
is    
begin    
insert into order_items1 values(o_id,i_id,p_id,qty,price);
dbms_output.put_line('orderitems record inserted successfully');
if sql%rowcount>0 then 
status:='Values Inserted';
end if;
commit;

EXCEPTION when others then 
status:='Value not Inserted';
error:=sqlcode||' '||sqlerrm;
end insertorderitems1;

procedure deleteorderitems1
  ( i_id number,
  status out varchar2,error out varchar2
  ) is
begin
  delete from order_items1 where item_id = i_id;
 
  if SQL%ROWCOUNT >0 
  then
    status:='Deleted';
  end if;
if sql%rowcount=0
then status:='GIven item id not found';
end if;
exception
  when others then
   status:='value not deleted';
   error:=sqlcode ||' '|| sqlerrm;
commit;
end deleteorderitems1;

 procedure insertproducts1
(p_id number,
p_name varchar2,
p_dec varchar2,
s_price number,
l_price number,
cat number,
status out varchar2,
error out varchar2
)  
is    
begin    
insert into products1 values(p_id,p_name,p_dec,s_price,l_price,cat);
dbms_output.put_line('products record inserted successfully');
if sql%rowcount>0 then 
status:='Values Inserted';
end if;
commit;

EXCEPTION when others then 
status:='Value not Inserted';
error:=sqlcode||' '||sqlerrm;
end insertproducts1;

 procedure deleteproducts1
  ( p_id number,
  status out varchar2,error out varchar2
  ) is
begin
  delete from products1 where product_id = p_id;
 
  if SQL%ROWCOUNT >0 
  then
    status:='Deleted';
  end if;
if sql%rowcount=0
then status:='GIven product id not found';
end if;
exception
  when others then
   status:='value not deleted';
   error:=sqlcode ||' '|| sqlerrm;
commit;
end deleteproducts1;

 procedure insertEmployee1
(    
firstName IN employees.first_name%type,
lastName  in employees.last_name%type,
email in employees.email%type,
phone in employees.phone%type,
hire in employees.hire_date%type,
manager_id in employees.manager_id%type,
job_title in employees.job_title%type,
status out varchar2,
error out varchar2
) 

is    

begin    
insert into employees (first_name,last_name,email,phone,hire_date,manager_id,job_title )  values(firstName,lastName,email,phone,hire,manager_id,job_title );    
dbms_output.put_line('Employee record inserted successfully'); 


if sql%rowcount>0 then 
status:='Values Inserted';
end if;
commit;

EXCEPTION when others then 
status:='Value not Inserted';
error:=sqlcode||' '||sqlerrm;

end insertemployee1;

 procedure deleteemployee1
  ( employe_id in employees.employee_id%type,
  status out varchar2,error out varchar2)
is
begin
  delete from employees where employee_id = employe_id;
  
  if SQL%ROWCOUNT >0 
  then
    status:='Deleted';
  end if;
if sql%rowcount=0
then status:='No value Deleted';
end if;
exception
  when others then
   status:='Somthing went wrong';
   error:=sqlcode ||' '|| sqlerrm;
commit;
end deleteemployee1;

end;
-------------------------------------------------------------------------------------------------------------


exec sales.insertCustomers1(11,'Oliver','Star City','arrowcom',20000);  
 
exec sales.deletecustomer1(9);
 
exec sales.insertorders1(412,2,'Shipped',5,'21-08-2021',status,error);  

exec sales.deleteorders1(412); 
 
exec sales.insertorderitems1(412,501,101,2,15000,status,error);
 
exec sales.deleteorderitems1(412,status,error);

exec sales.insertproducts1(111,'Robot','a small portable radio telephone',1500,6500,201,status,error);  

exec sales.deleteproducts1(111,status,error);
 
exec sales.insertEmployee1(0111,'tony','stark','iron@gamil.com',982764082,'11-02-2010',22,'HR',status,error);
 
exec sales.deleteemployee1(0111,status,error);
