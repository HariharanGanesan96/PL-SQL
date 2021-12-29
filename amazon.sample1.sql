select * from admin_details;
select * from orders;
select * from order_items;
select * from customers;                 
select * from cart_items;
select * from pet_details;
select * from admin_details;

alter table customers rename COLUMN customer_bank to customer_wallet;
update pet_details set available_qty=to_number(pet_qty);
update pet_details set available_qty=1 where pet_id=7;
update customers set customer_wallet=15000;
update pet_details set status='approved',admin_id=1 where pet_id=1;
select * from customers where Customer_id=8;


exec updatewallet_customer(20000,1);


create or replace PACKAGE cart_operation  AS
    procedure insert_cart (p_id in number,c_id in number,qty in number,u_price in number,status out varchar2,v_error out varchar2);
    PROCEDURE delete_cart (i_id in number);
    PROCEDURE update_cart (i_id in number,qty in number);
END;


create or replace PACKAGE body cart_operation  AS

procedure insert_cart (p_id in number,c_id in number,qty in number,u_price in number, status out varchar2,v_error out varchar2)
is
begin
insert into cart_items (pet_id,customer_id,quantity,unit_price,total_price) values(p_id,c_id,qty,u_price,qty*u_price);
if Sql%rowcount>0 then 
status:='ok';
end if;
commit;
EXCEPTION when OTHERS then 
status:='ko';
v_error:=sqlcode||sqlerrm;
end insert_cart;

PROCEDURE delete_cart (i_id in number)
is 
begin
delete from cart_items where item_id=i_id;
COMMIT;
end delete_cart;

procedure update_cart (i_id in number,qty in number)
is
begin 
update cart_items set quantity=qty,total_price=to_number(unit_price)*qty  where item_id=i_id;
commit;
end update_cart;
end;


set serveroutput on
declare
username animals_customers.customer_username%TYPE:='&username';
password animals_customers.customer_password%TYPE:='&password';
firstname animals_customers.customer_firstname%TYPE;
begin
select admin_firstname into firstname 
        from admin_details 
        where admin_username=username and admin_password=password;
        dbms_output.put_line('Admin firstname: ' || firstname );
EXCEPTION 
        WHEN NO_DATA_FOUND THEN
        select customer_firstname into firstname
        from customers 
        where customer_username=username and customer_password=password;
        dbms_output.put_line('user firstname: ' || firstname );
end;
/

select * from customers;
