--Basics Questions:-
--1) Create two Databases Name :- Brands , and  Products (Created)

--2) Create two tables in SQL Server  name  as ITEMS_Table in Brands database and PRODUCT_Table in Products database.
create table ITEMS_Table 
(Item_id int,
Item_description varchar(50),
Vendor_nos int,
Vendor_name varchar(50),
Bottle_size int,
Bottle_price float)

Create table PRODUCT_Table
(Product_Id int,
Country varchar(50),
Product varchar(50),
Units_sold float,
Manufacturing_price money,
sale_price money,
Gross_sales money,
sales money,
COGS money,
profit money,
date int,
Month_number int,
Month_name varchar(50),
year int)


--3)  After Creating both the tables Add records in that tables (records are available above)

insert into ITEMS_Table (Item_Id, item_description,	vendor_nos,	vendor_name, bottle_size, bottle_price)
values
(1,	'Travis Hasse Apple Pie', 305,'Mhw Ltd', 750, $9.77 ),
(2,	'D_aristi Xtabentun', 391, 'Anchor Distilling (preiss Imports)', 750, $14.12), 
(3, 'Hiram Walker Peach Brandy', 370, 'Pernod Ricard Usa/austin Nichols', 1000, $6.50), 
(4,	'Oak Cross Whisky', 305, 'Mhw Ltd', 750, $25.33), 
(5, 'Uv Red(cherry) Vodka', 380, 'Phillips Beverage Company', 200, $1.97), 
(6, 'Heaven Hill Old Style White Label', 259, 'Heaven Hill Distilleries Inc.', 750, $6.37 ),
(7, 'Hyde Herbal Liqueur', 194, 'Fire Tail Brands Llc', 750, $5.06),
(8, 'Dupont Calvados Fine Reserve;', 403, 'Robert Kacher Selections', 750, $23.61) 

select *from ITEMS_Table

insert into PRODUCT_Table (Product_Id, Country, Product, Units_Sold, Manufacturing_Price, Sale_Price, Gross_Sales, Sales, COGS, Profit, Date, Month_Number, Month_Name, Year)
values
(1, 'Canada', 'Carretera', 1618.5, $3.00, $20.00, $32370.00,  $32370.00, $1685.00,  $16185.00, 01-01-2014, 1, 'January', 2014),
(2,	'Germany', 'Carretera', 1321, $3.00, $20.00, $26420.00,  $26420.00, $1310.00, $13210.00, 01-01-2014, 1, 'January', 2015),
(3, 'France', 'Carretera', 2178, $3.00, $15.00, $32670.00, $32670.00, $21780.00, $10890.00, 01-06-2014, 6, 'June', 2016),
(4, 'Germany', 'Carretera', 888, $3.00, $15.00, $13320.00, $13320.00, $8880.00, $4440.00, 01-06-2014, 6, 'June', 2017),
(5, 'Mexico', 'Carretera', 2470, $3.00, $15.00, $37050.00, $37050.00, $24700.00, $12350.00, 01-06-2014, 6, 'June', 2018),
(6, 'Germany', 'Carretera', 1513, $3.00, $350.00, $529550.00, $529550.00, $393380.00, $136170.00, 01-12-2014, 12, 'December', 2019),
(7, 'Germany', 'Montana', 921, $5.00, $15.00, $13815.00, $13815.00, $9210.00, $4605.00, 01-03-2014, 3, 'March', 2020),
(8, 'Canada', 'Montana', 2518, $5.00, $12.00, $30216.00,$30216.00, $7554.00, $22662.00, 01-06-2014, 6, 'June', 2021)


--4) Delete those product having the Units Sold 1618.5 , 888 and 2470.
delete from PRODUCT_Table
where Units_sold in ( 1618.5 , 888, 2470)

--5) DROP the table and Create it again.
 drop table PRODUCT_Table

 
Create table PRODUCT_Table
(Product_Id int,
Country varchar(50),
Product varchar(50),
Units_sold float,
Manufacturing_price money,
sale_price money,
Gross_sales money,
sales money,
COGS money,
profit money,
date int,
Month_number int,
Month_name varchar(50),
year int)

--Intermediate Questions
--Big Table :--
--1) Find the Total Sale Price  and  Gross Sales 
select sum(sale_price) as Total_sales from PRODUCT_Table
select sum(gross_sales) as Total_gross_sales from PRODUCT_Table

--2) In which year we have got the highest sales
SELECT YEAR AS sales_year, SUM(Units_sold * sale_price) AS total_sales
FROM PRODUCT_Table
GROUP BY YEAR
ORDER BY total_sales DESC
limit 1;

--3)  Which Product having the sales of $ 37,050.00
select year from product_table
where sales like 37050.00 

--4) Which Countries lies between profit of $ 4,605 to $  22 , 662.00
select distinct country from PRODUCT_Table
where profit between 4605 and 22662.00

--5) Which Product Id having the sales of $ 24 , 700.00
select product_Id from PRODUCT_Table
where sales = 24700.00


--Small Table :--

--1) Find the item_description having the bottle size of 750
select Item_description from ITEMS_Table
where Bottle_size = 750

--2) Find the vendor Name having the vendor_nos 305 , 380 , 391
select vendor_name from ITEMS_Table
where Vendor_nos in (305,380,391)

--3) What is total Bottle_price 
select sum(bottle_price) as Total_bottle_price from ITEMS_Table

--4) Make Primary Key to Item_id
ALTER TABLE items_table
ADD CONSTRAINT PK_Item_id PRIMARY KEY (Item_id);


--5) Which item id having the bottle_price of $ 5.06
select item_ID from ITEMS_Table
where Bottle_price = 5.06

--Advance Questions:--
--1) Apply INNER  , FULL OUTER , LEFT JOIN types on both the table 
-- Inner join
select
    i.Item_Id,
    i.Item_Description,
    i.Vendor_Nos,
    i.Vendor_Name,
    i.Bottle_Size,
    i.Bottle_Price,
    p.Product_Id,
    p.Country,
    p.Product,
    p.Units_Sold,
    p.Manufacturing_Price,
    p.Sale_Price,
    p.Gross_Sales,
    p.Sales,
    p.COGS,
    p.Profit,
    p.Month_Number,
    p.Month_Name,
    p.Year
FROM 
   ITEMS_Table i
inner JOIN 
   PRODUCT_Table p
ON 
    i.Item_Id = p.Product_Id;

-- Left join
select
    i.Item_Id,
    i.Item_Description,
    i.Vendor_Nos,
    i.Vendor_Name,
    i.Bottle_Size,
    i.Bottle_Price,
    p.Product_Id,
    p.Country,
    p.Product,
    p.Units_Sold,
    p.Manufacturing_Price,
    p.Sale_Price,
    p.Gross_Sales,
    p.Sales,
    p.COGS,
    p.Profit,
    p.Month_Number,
    p.Month_Name,
    p.Year
FROM 
   ITEMS_Table i
Left JOIN 
   PRODUCT_Table p
ON 
    i.Item_Id = p.Product_Id;

--Full outer join
select
    i.Item_Id,
    i.Item_Description,
    i.Vendor_Nos,
    i.Vendor_Name,
    i.Bottle_Size,
    i.Bottle_Price,
    p.Product_Id,
    p.Country,
    p.Product,
    p.Units_Sold,
    p.Manufacturing_Price,
    p.Sale_Price,
    p.Gross_Sales,
    p.Sales,
    p.COGS,
    p.Profit,
    p.Month_Number,
    p.Month_Name,
    p.Year
FROM 
   ITEMS_Table i
Full outer JOIN 
   PRODUCT_Table p
ON 
    i.Item_Id = p.Product_Id;

--2) Apply  OUTER  ,  RIGHT JOIN , CROSS JOIN types  on both the table 
-- Outer join
-- FULL OUTER JOIN between ITEMS_Table and PRODUCT_Table
SELECT 
    i.Item_Id,
    i.Item_Description,
    i.Vendor_Nos,
    i.Vendor_Name,
    i.Bottle_Size,
    i.Bottle_Price,
    p.Product_Id,
    p.Country,
    p.Product,
    p.Units_Sold,
    p.Manufacturing_Price,
    p.Sale_Price,
    p.Gross_Sales,
    p.Sales,
    p.COGS,
    p.Profit,
    p.Month_Number,
    p.Month_Name,
    p.Year
FROM 
    ITEMS_Table i
FULL OUTER JOIN 
    PRODUCT_Table p
ON 
    i.Item_Id = p.Product_Id;

--Right outer join
-- Perform a RIGHT OUTER JOIN between ITEMS_Table and PRODUCT_Table
SELECT 
    i.Item_Id,
    i.Item_Description,
    i.Vendor_Nos,
    i.Vendor_Name,
    i.Bottle_Size,
    i.Bottle_Price,
    p.Product_Id,
    p.Country,
    p.Product,
    p.Units_Sold,
    p.Manufacturing_Price,
    p.Sale_Price,
    p.Gross_Sales,
    p.Sales,
    p.COGS,
    p.Profit,
    p.Month_Number,
    p.Month_Name,
    p.Year
FROM 
   ITEMS_Table i
RIGHT OUTER JOIN 
   PRODUCT_Table p
ON 
    i.Item_Id = p.Product_Id;

--Cross join
select * 
from Items_table
cross join Product_table;

--3) Find the item_description and Product having the gross sales of 13,320.00
select Item_description from Items_table
select product from Product_table
where gross_sales = 13320;

select * from items_table
--4)   Split the Item_description Column into Columns Item_desc1 and Item_desc2
-- Assuming the delimiter is a space (' ')
-- This query works for MySQL, you may need to adapt it for other SQL dialects

-- Add two new columns to the table
ALTER TABLE Items_table
ADD Item_descrip1 VARCHAR(250)

-- Add two new columns to the table
ALTER TABLE Items_table
ADD Item_descrip2 VARCHAR(250)

-- Update the new columns with split values from the Item_description column
UPDATE Items_table
SET
    Item_descrip1 = LEFT(Item_description, CHARINDEX(' ', Item_description + ' ') - 1),
    Item_descrip2 = LTRIM(RIGHT(Item_description, LEN(Item_description) - CHARINDEX(' ', Item_description + ' ')));


-- Drop the original Item_description column if no longer needed
ALTER TABLE Items_table
DROP COLUMN Item_description;


