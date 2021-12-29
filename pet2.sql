create or replace PACKAGE CUSTOMER_OPERATION AS 
 /* TODO enter package declarations (types, exceptions, methods etc) here */ 
    procedure insert_customer (c_firstname in customers.customer_firstname%type,
                               c_lastname in customers.customer_lastName%type,
                               c_username in customers.customer_username%type,
                               c_password in customers.customer_password%type,
                               c_email in customers.customer_email%type,
                               c_number in customers.customer_mobilenumber%type,
                               c_gender in customers.customer_gender%type);
                               
    PROCEDURE update_customer (c_id in customers.customer_id%type,
                               c_firstname in customers.customer_firstname%type,
                               c_lastname in customers.customer_lastName%type,
                               c_username in customers.customer_username%type,
                               c_password in customers.customer_password%type,
                               c_email in customers.customer_email%type,
                               c_number in customers.customer_mobilenumber%type,
                               c_gender in customers.customer_gender%type);
                               
    PROCEDURE delete_customer (c_id in number);
END CUSTOMER_OPERATION;
drop package Cart_OPERATION; 

CREATE OR REPLACE PACKAGE body CUSTOMER_OPERATION AS 

   procedure insert_customer ( c_firstname in customers.customer_firstname%type,
                               c_lastname in customers.customer_lastName%type,
                               c_username in customers.customer_username%type,
                               c_password in customers.customer_password%type,
                               c_email in customers.customer_email%type,
                               c_number in customers.customer_mobilenumber%type,
                               c_gender in customers.customer_gender%type) 
   is
   begin
   insert into Customers(customer_firstname,customer_lastname,customer_username,
   customer_password,customer_email,customer_mobilenumber,customer_gender)
   values (c_firstname,c_lastname,c_username,c_password,c_email,c_number,c_gender);
   end insert_customer;
   
   PROCEDURE update_customer ( c_id in customers.customer_id%type,
                               c_firstname in customers.customer_firstname%type,
                               c_lastname in customers.customer_lastName%type,
                               c_username in customers.customer_username%type,
                               c_password in customers.customer_password%type,
                               c_email in customers.customer_email%type,
                               c_number in customers.customer_mobilenumber%type,
                               c_gender in customers.customer_gender%type)
   is
   begin
   update customers set customer_firstname=c_firstname,customer_lastName=c_lastname,
   customer_username=c_username,customer_password=c_password,customer_email=c_email,
   customer_mobilenumber=c_number,customer_gender=c_gender where customer_id=c_id;
   end update_customer;
   
   PROCEDURE delete_customer (c_id in number)
   is
   begin
   delete from Customers where customer_id=c_id;
   end delete_customer;
   end;
   
   
   set SERVEROUT on
   DECLARE
   v_status varchar2(2);
   v_error VARCHAR2(500);
   begin
   cart_operation.insert_cart(5000,5000,1,1000,v_status,v_error);
   DBMS_OUTPUT.PUT_LINE(V_STATUS  ||'   '|| V_ERROR );
   end;
   
   execute  customer_operation.insert_customer('karthi','kanan','karthikanan','karthikanan','karithi@hmail.com',9876543232,'male'); 
  
   execute  customer_operation.update_customer(41,'karthikanan','kanan','karthikanan','karthikanan','karithi1@hmail.com',9876543232,'male');
   
   execute  customer_operation.delete_customer(41);
   select * from customers;