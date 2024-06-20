--TASK 1

--1.Create University Database give any University name you want

--2. Under this University Create four tables and each table should have following three Column named as:-


Create Table College_Table (
		College_ID int primary key, 
		College_Name varchar(100),
		College_Area varchar(100));

Create table Department_Table (
		Dept_ID int primary key,
		Dept_Name varchar (100),
		Dept_Facility varchar (100),);

Create table Professor_Table (
		Professor_ID int primary key,
		Professor_Name varchar (100),
		Professor_Subject varchar (100));

Create table Student_Table (
		Student_ID int primary key,
		Student_Name varchar (100),
		Student_Stream varchar (100));


-- Insert 10 records into college_Table
INSERT INTO College_Table (College_ID, College_Name, College_Area)
VALUES
(1, 'ABC College', 'Downtown'),
(2, 'XYZ College', 'Suburb'),
(3, 'EFG University', 'City Center'),
(4, 'LMN Institute', 'Rural Area'),
(5, 'PQR School', 'Industrial Zone'),
(6, 'UVW Academy', 'Coastal Area'),
(7, 'IJK Institute', 'Mountain Town'),
(8, 'RST College', 'Urban Area'),
(9, 'MNO University', 'Desert Region'),
(10, 'GHI School', 'Island Location');


-- Insert 10 records into Department_Table
INSERT INTO Department_Table (Dept_ID, Dept_Name, Dept_Facility)
VALUES
(1, 'Computer Science', 'High-speed internet'),
(2, 'Electrical Engineering', 'Advanced labs'),
(3, 'Mechanical Engineering', 'Workshop facilities'),
(4, 'Chemistry', 'Laboratory equipment'),
(5, 'Physics', 'Research facilities'),
(6, 'Biology', 'Microscopes and labs'),
(7, 'Mathematics', 'Computational resources'),
(8, 'Business Administration', 'Case study rooms'),
(9, 'History', 'Archives and library'),
(10, 'Literature', 'Reading rooms');


--Insert 10 records into professor table 
INSERT INTO Professor_Table (Professor_ID, Professor_Name, Professor_Subject)
VALUES
(1, 'John Doe', 'Computer Networks'),
(2, 'Jane Smith', 'Digital Signal Processing'),
(3, 'David Brown', 'Thermodynamics'),
(4, 'Emily Wilson', 'Organic Chemistry'),
(5, 'Michael Johnson', 'Particle Physics'),
(6, 'Sarah Adams', 'Genetics'),
(7, 'Robert Green', 'Number Theory'),
(8, 'Jessica Parker', 'Marketing'),
(9, 'Daniel Taylor', 'Medieval History'),
(10, 'Laura White', 'English Literature');

INSERT INTO Student_Table (Student_ID, Student_Name, Student_Stream)
VALUES
(1, 'Alia', 'Computer Science'),
(2, 'Boby', 'Electrical Engineering'),
(3, 'Charlie', 'Mechanical Engineering'),
(4, 'Diya', 'Chemistry'),
(5, 'pratik', 'Physics'),
(6, 'reva', 'Biology'),
(7, 'muruga', 'Mathematics'),
(8, 'suriya', 'Business Administration'),
(9, 'gopal', 'History'),
(10, 'pujitha', 'Literature');

--TASK 2
--1.	Give the information of College_ID and College_name from College_Table
select College_ID, College_Name from College_Table;

--2.	Show  Top 5 rows from Student table.
Select top 5 * from Student_Table;

--3.	What is the name of  professor  whose ID  is 5
Select* from Professor_Table
where Professor_ID = '5';

--4.	Convert the name of the Professor into Upper case 
update Professor_Table
set Professor_Name = UPPER(professor_name);

--5.	Show me the names of those students whose name is start with a
select * from Student_Table
where Student_Name like 'a%';

--6.	Give the name of those colleges whose end with a
Select * from College_Table
where College_Name like 'a%';

--7.	 Add one Salary Column in Professor_Table
Alter table professor_table
add salary decimal (10,2);

--8.	Add one Contact Column in Student_table
ALTER TABLE Student_Table
ADD Contact VARCHAR(20); 

--9.	Find the total Salary of Professor 
Select SUM(salary) as total_salary
from Professor_Table;

--10.   Change datatype of any one column of any one Table
ALTER TABLE Student_Table
ALTER COLUMN Student_ID BIGINT;

--TASK 3
--1.	Show first 5 records from Students table and Professor table Combine
-- Combine and limit to first 5 records
SELECT * FROM Student_Table
UNION ALL
SELECT * FROM Professor_Table
limit 5;

--2.	Apply Inner join on all 4 tables together
SELECT s.*, p.*, d.*, c.*
FROM Student_Table s
INNER JOIN Professor_Table p ON s.Professor_ID = p.Professor_ID
INNER JOIN Department_Table d ON p.Dept_ID = d.Dept_ID
INNER JOIN College_Table_data c ON d.College_ID = c.College_ID;


--3.	Show Some null values from Department table and Professor table.

SELECT * FROM Department_Table
WHERE Dept_Name IS NULL 
select * from College_Table
where college_ID IS NULL;

--4.	Create a View from College Table  and give those records whose college name starts with C
CREATE VIEW CollegesStartingWithC AS
SELECT *
FROM College_Table
WHERE College_Name LIKE 'C%';

--5.	Create Stored Procedure  of Professor table whatever customer ID will be given by user it should show whole records of it.
CREATE PROCEDURE GetProfessorByID (@ProfessorID INT)
AS
BEGIN
    SELECT *
    FROM Professor_Table
    WHERE Professor_ID = @ProfessorID;
END;

EXEC GetProfessorByID @ProfessorID = 1


--6.	Rename the College_Table to College_Tables_Data .
EXEC sp_rename 'College_Table', 'College_Tables_Data';

