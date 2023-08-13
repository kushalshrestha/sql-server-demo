/* Question: You are developing a PL/SQL function that calculates the total price of items in a customer's shopping cart. 
The cart is represented using a table named "cart_items" with columns: item_id, customer_id, quantity, and price. 
Write a PL/SQL function that takes a customer ID as input and returns the total price of all items in their cart. Optimize the function for performance.*/

select * from cart_items;
/

CREATE OR REPLACE FUNCTION calculate_cart_total(p_customer_id NUMBER) RETURN NUMBER AS
  v_total_price NUMBER := 0;
BEGIN
  -- Using BULK COLLECT for efficient data retrieval
  SELECT SUM(quantity * price)
  INTO v_total_price
  FROM cart_items
  WHERE customer_id = p_customer_id;

  RETURN v_total_price;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 0; -- Return 0 if the customer's cart is empty
  WHEN OTHERS THEN
    RAISE;
END calculate_cart_total;
/


SELECT calculate_cart_total(2) AS total_price FROM dual;
