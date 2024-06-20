CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100)
);

INSERT INTO Customers (CustomerID, Name, Email)
VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com'),
  (11, 'Alex Brown', 'alexbrown@example.com'),
  (12, 'Sophie Turner', 'sophieturner@example.com'),
  (13, 'Charlie Miller', 'charliemiller@example.com'),
  (14, 'Ava Wilson', 'avawilson@example.com'),
  (15, 'Daniel Harris', 'danielharris@example.com'),
  (16, 'Emma Davis', 'emmadavis@example.com'),
  (17, 'James White', 'jameswhite@example.com'),
  (18, 'Lily Martin', 'lilymartin@example.com'),
  (19, 'Benjamin Johnson', 'benjaminjohnson@example.com'),
  (20, 'Zoe Anderson', 'zoeanderson@example.com'),
  (21, 'Jackson Moore', 'jacksonmoore@example.com'),
  (22, 'Victoria Lewis', 'victorialewis@example.com'),
  (23, 'Ethan Garcia', 'ethangarcia@example.com'),
  (24, 'Grace Taylor', 'gracetaylor@example.com'),
  (25, 'Christopher Hall', 'christopherhall@example.com');

  CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductName VARCHAR(50),
  OrderDate DATE,
  Quantity INT
);

INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES
  (1, 1, 'Product A', '2023-07-01', 5),
  (2, 2, 'Product B', '2023-07-02', 3),
  (3, 3, 'Product C', '2023-07-03', 2),
  (4, 4, 'Product A', '2023-07-04', 1),
  (5, 5, 'Product B', '2023-07-05', 4),
  (6, 6, 'Product C', '2023-07-06', 2),
  (7, 7, 'Product A', '2023-07-07', 3),
  (8, 8, 'Product B', '2023-07-08', 2),
  (9, 9, 'Product C', '2023-07-09', 5),
  (10, 10, 'Product A', '2023-07-10', 1),
  (11, 11, 'Product D', '2023-07-11', 2),
  (12, 12, 'Product E', '2023-07-12', 3),
  (13, 13, 'Product F', '2023-07-13', 4),
  (14, 14, 'Product G', '2023-07-14', 1),
  (15, 15, 'Product H', '2023-07-15', 5),
  (16, 16, 'Product I', '2023-07-16', 2),
  (17, 17, 'Product J', '2023-07-17', 3),
  (18, 18, 'Product A', '2023-07-18', 4),
  (19, 19, 'Product B', '2023-07-19', 2),
  (20, 20, 'Product C', '2023-07-20', 1),
  (21, 21, 'Product D', '2023-07-21', 3),
  (22, 22, 'Product E', '2023-07-22', 5),
  (23, 23, 'Product F', '2023-07-23', 2),
  (24, 24, 'Product G', '2023-07-24', 1),
  (25, 25, 'Product H', '2023-07-25', 4);

  
CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99),
  (11, 'Product K', 15.99),
  (12, 'Product L', 9.99),
  (13, 'Product M', 6.49),
  (14, 'Product N', 11.49),
  (15, 'Product O', 8.99),
  (16, 'Product P', 7.49),
  (17, 'Product Q', 10.99),
  (18, 'Product R', 13.99),
  (19, 'Product S', 16.49),
  (20, 'Product T', 5.49),
  (21, 'Product U', 14.99),
  (22, 'Product V', 8.49),
  (23, 'Product W', 9.99),
  (24, 'Product X', 12.49),
  (25, 'Product Y', 4.99);






--Task 1
--1.	Write a query to retrieve all records from the Customers table..

select * from customers

--2.	Write a query to retrieve the names and email addresses of customers whose names start with 'J'.
Select Name, Email from Customers
where name like  'j%'

--3.	Write a query to retrieve the order details (OrderID, ProductName, Quantity) for all orders..
select OrderID, ProductName, Quantity from Orders

--4.	Write a query to calculate the total quantity of products ordered.
select SUM(quantity) as Total_quantity
from Orders

--5.	Write a query to retrieve the names of customers who have placed an order.
SELECT name
FROM customers
WHERE CustomerID IN (
    SELECT DISTINCT CustomerID
    FROM orders
);


--6.	Write a query to retrieve the products with a price greater than $10.00.
select ProductName
from Products
where Price > $10.00

--7.	Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'.
SELECT c.name AS name, o.OrderDate
FROM customers c
JOIN orders o ON c.customerId = o.CustomerID
WHERE o.OrderDate >= '2023-07-05';


--8.	Write a query to calculate the average price of all products.
select AVG(price) as avgerage_price
from Products

--9.	Write a query to retrieve the customer names along with the total quantity of products they have ordered.
SELECT c.name AS customer_name, SUM(o.quantity) AS total_quantity_ordered
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
GROUP BY c.name;

--10.	Write a query to retrieve the products that have not been ordered.
SELECT p.ProductName
FROM products p
LEFT JOIN orders o ON p.ProductName = o.ProductName
WHERE o.ProductName IS NULL;

--SELECT p.product_name
FROM products p
LEFT JOIN orders o ON p.product_name = o.product_name
WHERE o.product_name IS NULL;

--Task 2 :-
--1.	Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders.

SELECT c.name AS customer_name, SUM(o.quantity) AS total_quantity_ordered
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
GROUP BY c.name
ORDER BY total_quantity_ordered DESC
Limit 5


--2.	Write a query to calculate the average price of products for each product category.
select ProductName, avg( price ) as average_price
from products 
group by productName

--3.	Write a query to retrieve the customers who have not placed any orders.
select c.name as customer_name
from Customers c
left join Orders o on c.CustomerID = o.CustomerID
where OrderID is null;

--4.	Write a query to retrieve the order details (OrderID, ProductName, Quantity) for orders placed by customers whose names start with 'M'.
select o.OrderID, o.ProductName, o.Quantity 
from Orders o
join customers c ON o.CustomerID = c.CustomerID
where c.Name like 'M%'

--5.	Write a query to calculate the total revenue generated from all orders.
select SUM(o.Quantity * p.price) as Total_revenue
from orders o
join Products p on o.productName = p.ProductName

--6.	Write a query to retrieve the customer names along with the total revenue generated from their orders.
select c.name as Customer_name, SUM(o.quantity * p.price) as Total_revenue
from Customers c
join orders o on c.CustomerID =o.CustomerID
join products p on o.ProductName =p.productName
group by c.Name

--7.	Write a query to retrieve the customers who have placed at least one order for each product category.
SELECT c.CustomerID, c.name AS customer_name
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.name
HAVING COUNT(DISTINCT o.ProductName) = (SELECT COUNT(DISTINCT ProductName) FROM products);

--8.	Write a query to retrieve the customers who have placed orders on consecutive days.-----
SELECT DISTINCT c.name AS customer_name
FROM orders o1
JOIN orders o2 ON o1.customerId = o2.customer_Id
JOIN customers c ON o1.customerId = c.customerId
WHERE DATEDIFF(o2.OrderDate, o1.OrderDate) = 1;


--9.	Write a query to retrieve the top 3 products with the highest average quantity ordered.

SELECT ProductName, AVG(quantity) AS avg_quantity_ordered
FROM orders
GROUP BY ProductName
ORDER BY avg_quantity_ordered DESC
limit 3;

--10.	Write a query to calculate the percentage of orders that have a quantity greater than the average quantity.----

SELECT 
    (COUNT(CASE WHEN quantity > avg_quantity THEN 1 END) / COUNT(*)) * 100 AS percentage_orders
FROM 
    (SELECT AVG(quantity) AS avg_quantity FROM orders) AS avg_table,
    orders;

--Task 3:-
--1.	Write a query to retrieve the customers who have placed orders for all products.
SELECT c.CustomerID, c.Name, c.Email
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name, c.Email
HAVING COUNT(DISTINCT o.ProductName) = (SELECT COUNT(*) FROM Products);


--2.	Write a query to retrieve the products that have been ordered by all customers.
SELECT o.customerID, o.ProductName
FROM orders o
JOIN customers c ON o.customerID = c.customerID
GROUP BY o.customerID, o.ProductName
HAVING COUNT(DISTINCT c.CustomerID) = (SELECT COUNT(*) FROM Customers);


--3.	Write a query to calculate the total revenue generated from orders placed in each month.
SELECT FORMAT(o.OrderDate, 'yyyy-MM') AS Month, SUM(o.Quantity * p.Price) AS TotalRevenue
FROM Orders o
JOIN Products p ON o.ProductName = p.ProductName
GROUP BY FORMAT(o.OrderDate, 'yyyy-MM');

--4.	Write a query to retrieve the products that have been ordered by more than 50% of the customers.
SELECT p.ProductID, p.ProductName
FROM Products p
JOIN Orders o ON p.ProductName = o.ProductName
GROUP BY p.ProductID, p.ProductName
HAVING COUNT(DISTINCT o.CustomerID) > (SELECT COUNT(*) FROM Customers) / 2;


--5.	Write a query to retrieve the top 5 customers who have spent the highest amount of money on orders.
SELECT c.CustomerID, c.Name, c.Email, SUM(o.Quantity * p.Price) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Products p ON o.ProductName = p.ProductName
GROUP BY c.CustomerID, c.Name, c.Email
ORDER BY TotalSpent DESC
limit 5;

--6.	Write a query to calculate the running total of order quantities for each customer.
SELECT o.CustomerID, c.Name, o.OrderID, o.OrderDate, 
       SUM(o.Quantity) OVER (PARTITION BY o.CustomerID ORDER BY o.OrderDate) AS RunningTotalQuantity
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

--7.	Write a query to retrieve the top 3 most recent orders for each customer.
WITH RankedOrders AS (
  SELECT o.*, 
         ROW_NUMBER() OVER (PARTITION BY o.CustomerID ORDER BY o.OrderDate DESC) AS rn
  FROM Orders o
)
SELECT o.CustomerID, o.OrderID, o.ProductName, o.OrderDate, o.Quantity
FROM RankedOrders o
WHERE o.rn <= 3;

--8.	Write a query to calculate the total revenue generated by each customer in the last 30 days.

--9.	Write a query to retrieve the customers who have placed orders for at least two different product categories.
SELECT c.CustomerID, c.Name, c.Email
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name, c.Email
HAVING COUNT(DISTINCT o.ProductName) >= 2;

--10.	Write a query to calculate the average revenue per order for each customer.
SELECT c.CustomerID, c.Name, c.Email, AVG(o.Quantity * p.Price) AS AvgRevenuePerOrder
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Products p ON o.ProductName = p.ProductName
GROUP BY c.CustomerID, c.Name, c.Email;


--11.	Write a query to retrieve the customers who have placed orders for every month of a specific year.



--12.	Write a query to retrieve the customers who have placed orders for a specific product in consecutive months.


--13.	Write a query to retrieve the products that have been ordered by a specific customer at least twice.



