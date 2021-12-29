create or replace PACKAGE cart_operation  AS
    procedure insert_cart (p_id in number,c_id in number,qty in number,u_price in number,t_price in number);
    PROCEDURE delete_cart (i_id in number);
    PROCEDURE update_cart (i_id in number,qty in number);
END;

create or replace PACKAGE body cart_operation  AS
    procedure insert_cart (p_id in number,c_id in number,qty in number,u_price in number,t_price in number)
is
begin
insert into cart_items (pet_id,customer_id,quantity,unit_price,total_price) values(p_id,c_id,qty,u_price,t_price);
commit;
end insert_cart;
PROCEDURE delete_cart (i_id in number)
is 
begin
delete from cart_items where item_id=i_id;
COMMIT;
end delete_cart;
procedure update_cart(i_id in number,qty in number,t_price in number)
is
begin 
update cart_items set quantity=qty,total_price=to_number(total_price)*qty  where item_id=i_id;
commit;
end update_cart;
end;
/

execute cart_operation.insert_cart(10,12,2,10000);
execute cart_operation.delete_cart(6);
execute cart_operation.update_cart(6,2);







