--sql task-2

--create table customers(customer_id serial primary key,customer_name varchar,city varchar,phone_number varchar,
--email varchar,registration_date date);

--create table orders(order_id serial primary key,customer_id int references customers (customer_id),
--order_date date,order_amount int,delivery_city varchar,payment_mode varchar);

--create table products(product_id  serial primary key,product_name varchar,category varchar,price int,stock_quantity int,
--supplier_name varchar,supplier_city varchar,supply_date date);

--create table order_items (order_item_id serial primary key,order_id int references orders (order_id),
--product_id int references products ( product_id ),quantity int,total_price int);

--distinct

--select distinct city from  customers order by city;

--select distinct  supplier_name from  products order by supplier_name;

--select distinct  payment_mode from  orders order by  payment_mode;

--select distinct p.category from  products p join  order_items  oi on p.product_id = oi.product_id order by p.category;

--select distinct  supplier_city from  products order by supplier_city;
--order by
--Select customers.customer_name, customers. city, orders.order_date
--from customers join orders on customers.customer_id = orders.customer_id where extract(year from order_date) = 2023;

--select product_name, category, total_price from  customers c join orders o on c.customer_id = o.customer_id
--join  order_items oi on o.order_id = oi.order_id join  products p on oi.product_id = p.product_id
--where c.city = 'Mumbai' 

--select customer_name, order_date, total_price  from  customers c join orders o on c.customer_id = o.customer_id
--join  order_items oi on o.order_id = oi.order_id where o.payment_mode = 'Credit Card'

--select product_name, category,total_price from  orders o 
--join  order_items oi on o.order_id = oi.order_id join  products p on oi.product_id = p.product_id
--where o.order_date between '2023-04-18' and  '2023-06-25'

--select customer_name, sum(quantity) as total_products from  customers c join orders o on c.customer_id = o.customer_id
--join  order_items oi on o.order_id = oi.order_id group by customer_name

--limit & offset
--select * from  customers order by customer_name limit 10;

--select  * from  products order by  price desc limit 5;

--select * from customers order by customer_id limit 10 offset 10;

--select order_id, order_date, customer_id from orders
--where extract(year from order_date) = 2023 order by order_date limit 5;

--select distinct city from customers order by city limit 10 offset 10;

-- aggegate function
 
--select count (order_id) from orders;

--select payment_mode, sum (total_price) from orders o join order_items oi on o.order_id = oi.order_id where o.payment_mode = 'UPI'
--group by  o.payment_mode;

--select avg (price) from products;

--select min (total_price), max (total_price) from  orders o join order_items oi on o.order_id = oi.order_id
--where extract (year from o.order_date)=2023;

--select product_id, sum(quantity) from order_items group by product_id;


--set operations


--Select customer_id from orders where extract ( year from  order_date) = 2022
--intersect
--select  customer_id from  orders where extract (year from order_date)= 2023;

--select product_id from products where extract ( year from  supply_date) = 2022
--except
--select  product_id  from  products where extract (year from supply_date)= 2023;


--select supplier_city from products
--except
--select city from customers;


--select supplier_city from products
--union
--select city from customers;

--subqueries
--select customer_name from customers where customer_id in 
--(select o.customer_id from orders o join order_items oi on o.order_id = oi.order_id
--group by  o.customer_id having sum(oi.total_price)> (select avg(total_price) from order_items));


--select product_name from products where product_id in (select oi.product_id from order_items oi group by oi.product_id
--having count(oi.order_id) >1 );


--select product_name from products where product_id in (select oi.product_id from order_items oi 
--join orders o on oi.order_id = o.order_id join customers c on o.customer_id = c.customer_id where c.city ='Pune');


--select * from orders where order_id in (select oi.order_id from order_items oi 
--group by oi.order_id order by sum(oi.total_price)desc limit 3);


--select customer_name from customers where customer_id in (select o.customer_id from orders o join order_items oi 
--on o.order_id = oi.order_id join products p on oi.product_id = p.product_id where p.price > 30000);




