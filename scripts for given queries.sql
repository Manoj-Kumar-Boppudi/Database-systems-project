-- script for insert query -1
insert into inventory values(8448, 256, 218, 2112, 7117);
select * from inventory;

-- script for insert query -2
insert into order_item values (64466, 1, 49.99, 3223, 2222);
select * from order_item;

-- script for update query -1
update customer set Email_address = 'Laura_Murrauy@gmail.com' where Customer_ID = 1221;
select * from customer;

-- script for update query -2
update product set Unit_Price = 99.99 where Product_ID = 2112;
select * from product;

-- script for delete query -1
delete from order_item where Order_Item_ID = 64466;
select * from order_item;

-- script for delete query -2
delete from inventory where Inventory_ID = 8338;
select * from inventory;

-- script for select query
select Name, Address, Mobile_number from employee;

-- script for select query with join -1
SELECT c.Resident_Address, o.Order_Total, o.Order_Date
FROM customer c
INNER JOIN _order o ON c.Customer_ID = o.Customer_ID;


-- script for select query with join -2 
SELECT d.Delivery_ID, d.Delivery_Address, o.Order_Date, o.Order_Total
FROM delivery d
INNER JOIN _order o ON d.Order_ID = o.Order_ID;

-- script for data summary query-1
select sum(Quantity) As Total_Number_of_products from inventory;

-- script for data summary query-2
select avg(Unit_Price) As Average_Product_price from product;

-- script for multi table query
SELECT c.Name, c.Mobile_number, p.Name, o.Order_Total
FROM customer c
INNER JOIN _order o ON c.Customer_ID = o.Customer_ID
INNER JOIN order_item oi ON o.Order_ID = oi.Order_ID
INNER JOIN product p ON oi.Product_ID = p.Product_ID;

-- script for query of my choice
SELECT MAX(Order_Total) AS max_total_amount FROM _order;