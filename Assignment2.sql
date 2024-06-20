--Q1) Create   Database Name as Order_Stores_Data 

--Q2) Create two Table names as Orders_Table and Stores_Table

CREATE TABLE Orders_Table (
    Order_Id INT PRIMARY KEY,
    OrderDate DATE,
    Region VARCHAR(50),
    Rep VARCHAR(50),
    Order_Item VARCHAR(50),
    Units INT,
    Unit_Cost DECIMAL(10, 2),
    Total_Price DECIMAL(10, 2)
);

-- Create Stores_Table
CREATE TABLE Stores_Table (
    Store_Id INT PRIMARY KEY,
    StoreType VARCHAR(3),
    Assortment INT,
    CompetitionDistance INT,
    Month INT,
    Year INT,
    PromoInterval VARCHAR(3)
);

--Q3) Insert All records present here in the Orders_table and Stores_Table & make primary key

INSERT INTO Orders_Table (OrderDate, Region, Rep, Order_Item, Units, Unit_Cost, Total_Price, Order_Id)
VALUES
('2021-01-06', 'East', 'Aruna', 'Pencil', 95, 1.99, 189.05, 1),
('2021-01-23', 'Central', 'Kivell', 'Eraser', 50, 19.99, 999.50, 2),
('2021-02-09', 'Central', 'Ganesh', 'Pen', 36, 4.99, 179.64, 3),
('2021-02-26', 'Central', 'Payal', 'Pen', 27, 19.99, 539.73, 4),
('2021-03-15', 'West', 'Sorvino', 'Pencil', 56, 2.99, 167.44, 5),
('2021-04-01', 'East', 'Hitesh', 'Pencil', 60, 4.99, 299.40, 6),
('2021-04-18', 'Central', 'Akshita', 'Pencil', 75, 1.99, 149.25, 7),
('2021-05-05', 'Central', 'Ruchika', 'Books', 90, 4.99, 449.10, 8),
('2021-05-22', 'West', 'Surbhi', 'Pen', 32, 1.99, 63.68, 9),
('2021-06-08', 'East', 'Jones', 'Suitcase', 60, 8.99, 539.40, 10);


INSERT INTO stores_table (Store_Id, StoreType, Assortment, CompetitionDistance, Month, Year, PromoInterval)
VALUES
    (1, 'c', 47, 1270, 9, 2008, 'Jan'),
    (2, 'a', 33, 570, 11, 2007, 'Feb'),
    (3, 'a', 49, 14130, 12, 2006, 'Mar'),
    (4, 'c', 14, 620, 9, 2009, NULL),
    (5, 'a', 20, 29910, 4, 2015, 'May'),
    (6, 'a', 50, 310, 12, 2013, 'Jun'),
    (7, 'a', 42, 24000, 4, 2013, NULL),
    (8, 'a', 35, 7520, 10, 2014, 'Aug'),
    (9, 'a', 13, 2030, 8, 2000, NULL),
    (10, 'a', 21, 3160, 9, 2009, 'Oct');


--Q4) Add one Column Name  as Store_Names and insert the records given above in Stores table.

ALTER TABLE Stores_Table
ADD Store_Names VARCHAR(50); 

-- Step 2: Update the new column with the provided store names
UPDATE Stores_Table
SET Store_Names = CASE Store_Id
    WHEN 1 THEN 'Car'
    WHEN 2 THEN 'Bikes'
    WHEN 3 THEN 'Hardware'
    WHEN 4 THEN 'Electrics'
    WHEN 5 THEN 'Fibers'
    WHEN 6 THEN 'Elastics'
    WHEN 7 THEN 'Books'
    WHEN 8 THEN 'Shoes'
    WHEN 9 THEN 'Cloths'
    WHEN 10 THEN 'Scraps'
    ELSE NULL 
END;


--Q5)Make Stored_Id as a Foreign Key with reference too Orders_Table 

ALTER TABLE Orders_Table
ADD CONSTRAINT FK_Stores_Orders FOREIGN KEY (Order_Id) REFERENCES Stores_Table(Store_Id);

--Q6) Update the missing  records in the Order_item Column in Order_table missing records are given in this sheet

UPDATE Orders_Table
SET Order_item = 
    CASE 
        WHEN Order_Id = 3 THEN 'Compass'
        WHEN Order_Id = 4 THEN 'Torch'
        WHEN Order_Id = 5 THEN 'Phone'
        WHEN Order_Id = 7 THEN 'Laptop'
        WHEN Order_Id = 9 THEN 'Box'
    END
WHERE Order_Id IN (3, 4, 5, 7, 9);


--Q7) Update the missing records in the PromoInterval Column in Stores Table.
update Stores_Table
set PromoInterval = 
case
when Store_Id = 4 then 'Apr'
when Store_Id = 7 then 'jul'
when Store_Id = 9 then 'sep'
end
where Store_Id in (4,7,9);

--Q8) Rename the column name  of Assortment to Store_Nos in Stores_Table.
EXEC sp_rename 'Stores_Table.Assortment', 'Store_Nos', 'COLUMN';

--Q9) Rename the column name  of Order_Item to Item_name  and Rep Column as Customers_name in Orders_Table.
EXEC sp_rename 'orders_table.Order_Item', 'Item_name', 'column' 
eXEC sp_rename'orders_table.Rep', 'Customers_name', 'column'

--Q10) Sort the Unit Cost of Orders_table in Descding order and Total column in Ascending order.
SELECT *
FROM Orders_Table
ORDER BY [Unit_Cost] DESC, Total_Price ASC;

--Q11) Convert Customers_name to Cus_Name  and find how many  Cus_Name in each region.
EXEC sp_rename 'orders_table.Customers_name', 'Cus_Name', 'column'

SELECT Region, COUNT(DISTINCT Cus_Name) AS Num_Customers
FROM Orders_Table
GROUP BY Region;

--Q12) Find the sum of Total_Price Column and Unit Cost  in Orders_Table 
SELECT SUM(Total_Price) AS Total_Price_Sum, SUM([Unit_Cost]) AS Unit_Cost_Sum
FROM Orders_Table;

--Q13) Show me OrderDate  , Unit Cost  , StoreType and Year in One table and names that table as Order_Stores_Table.
SELECT 
    o.OrderDate,
    o.Unit_Cost,
    s.StoreType,
    s.Year
INTO Order_Stores_Table
FROM Orders_Table o
JOIN Stores_Table s ON o.Store_Id = s.Store_Id;

select * from Stores_Table


--Q14)  Give me Order_Item  and Region whose Order_Id is 4 , 5, 6 ,9
select Item_name, Region
from Orders_Table
where 
Order_Id in (4 , 5, 6 ,9)

--Q15) Show me year  whose ComptetitionDistance is 29910  , 310 , 3160
select distinct YEAR from Stores_Table
where 
CompetitionDistance in (29910,310,3160);

--Q16)  Give me that Item_name whose  Total_Price is greater than 200 and less than 400
select item_name from Orders_Table
where Total_Price > 200 and Total_Price < 400;

--Q17) Rename the CompetitionDistance as CD and find the total CD in Stores_Table.

EXEC sp_rename 'Stores_Table.CompetitionDistance', 'CD', 'COLUMN';

select SUM(CD) as Total_CD from Stores_Table

--Q18) What is the Total Count of Stores_Type and CD columns
select COUNT(storetype) as storetype_count from Stores_Table
select COUNT(CD) as CD_Count from Stores_Table

--Q19) Apply the Cross Join in  Orders_Table and Stores_Table.
SELECT *
FROM Orders_Table
CROSS JOIN Stores_Table;

--Q20) DROP both the databases
Drop database Order_Stores_Data_Assign2



