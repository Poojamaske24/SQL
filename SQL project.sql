CREATE TABLE EmployeeDetail (
    EmployeeID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary INT,
    JoiningDate DATETIME,
    Department VARCHAR(10),
    Gender VARCHAR(10)
);

INSERT INTO EmployeeDetail (EmployeeID, FirstName, LastName, Salary, JoiningDate, Department, Gender) VALUES
(1, 'vikas', 'Ahlawat', 600000, '2023-02-12 11:16:00', 'IT', 'Male'),
(2, 'Nikita', 'Jain', 530000, '2013-02-14 11:16:00', 'HR', 'Female'),
(3, 'Ashish', 'Kumar', 1000000, '2013-02-14 11:16:00', 'IT', 'Male'),
(4, 'Nikhil', 'Sharma', 480000, '2013-02-15 11:16:00', 'HR', 'Male'),
(5, 'Anish', 'Kadian', 500000, '2013-02-16 11:16:00', 'Paroll', 'Male');

--1) Write a query to get all employee detail from "EmployeeDetail" table
select * from EmployeeDetail

--2) Write a query to get only "FirstName" column from "EmployeeDetail" table
select Firstname from EmployeeDetail

--3) Write a query to get FirstName in upper case as "First Name".
select UPPER(firstname) as 'First name' from EmployeeDetail

--4) Write a query to get FirstName in upper case as "First Name".
select UPPER(firstname) As "First Name" from EmployeeDetail

--5) Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name)
SELECT CONCAT(FirstName, ' ', LastName) AS Name
FROM EmployeeDetail;

--6)	Select employee detail whose name is "Vikas'
select Firstname from EmployeeDetail
where firstname = 'vikas'

--7)	Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'.
select * from EmployeeDetail
where firstname like 'a%';

--9.	Get all employee details from EmployeeDetail table whose "FirstName" end with 'h'
select * from EmployeeDetail
where firstname like 'h%';

--9.	Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p'
select * from EmployeeDetail
where firstname like '[a-p]%';

--Get all employee detail from EmployeeDetail table whose "FirstName" not start with any single character between 'a-p'
select * from EmployeeDetail
where firstname < 'A' Or FirstName > 'P'

--Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters. The Underscore(_) Wildcard Character represents any single character
select * from EmployeeDetail
where Gender like '__le';

--Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters
select * from EmployeeDetail
where firstname like 'a_____';

--Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as".
select * from EmployeeDetail
where firstname like '%[%]%';

--Get all unique "Department" from EmployeeDetail table
select distinct department from EmployeeDetail

--Get the highest "Salary" from EmployeeDetail table.
select MAX(salary) AS 'Highest salary' from EmployeeDetail;

--Get the lowest "Salary" from EmployeeDetail table
select min(salary) AS 'Lowest salary' from EmployeeDetail;

--Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013
SELECT EmployeeID, FirstName, LastName, Salary, 
       DATE_FORMAT(JoiningDate, '%d %b %Y') AS JoiningDate, 
       Department, Gender
FROM EmployeeDetail;

--Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15"
SELECT EmployeeID, FirstName, LastName, Salary, 
       DATE_FORMAT(JoiningDate, '%Y/%m/%d') AS JoiningDate, 
       Department, Gender
FROM EmployeeDetail;

--Show only time part of the "JoiningDate"
SELECT EmployeeID, FirstName, LastName, Salary, 
       DATE_FORMAT(JoiningDate, '%H:%i:%s') AS JoiningTime, 
       Department, Gender
FROM EmployeeDetail;

--Get only Year part of "JoiningDate"
SELECT EmployeeID, FirstName, LastName, Salary, 
       year(JoiningDate) as Joiningyear, 
       Department, Gender
FROM EmployeeDetail;

--Get only Month part of "JoiningDate”
SELECT EmployeeID, FirstName, LastName, Salary, 
       MONTH(joiningdate) AS Joiningmonth, 
       Department, Gender
FROM EmployeeDetail;

--Get system date (checkthis)

--Get UTC date.(checkthis)


--Get the first name, current date, joiningdate and diff between current date and joining date in months.

--Get the first name, current date, joiningdate and diff between current date and joining date in days.

--Get all employee details from EmployeeDetail table whose joining year is 2013
select * from EmployeeDetail
where YEAR(joiningdate) = 2013;

--Get all employee details from EmployeeDetail table whose joining month is Jan(1)
select * from EmployeeDetail
where month(JoiningDate) = 1;

--Get how many employee exist in "EmployeeDetail" table
select COUNT(employeeID) as 'Total employees' from EmployeeDetail; 

--31.	Select only one/top 1 record from "EmployeeDetail" table
select * from EmployeeDetail
limit 1;

--Select all employee detail with First name "Vikas","Ashish", and "Nikhil".
select * from EmployeeDetail
where FirstName in ('Vikas','Ashish','Nikhil');

--Select all employee detail with First name not in "Vikas","Ashish", and "Nikhil"
select * from EmployeeDetail
where FirstName not in ('Vikas','Ashish','Nikhil');

--Select first name from "EmployeeDetail" table after removing white spaces from right side
SELECT RTRIM(FirstName) AS FirstName
FROM EmployeeDetail;

--Select first name from "EmployeeDetail" table after removing white spaces from left side
SELECT lTRIM(FirstName) AS FirstName
FROM EmployeeDetail;

31.	Display first name and Gender as M/F.(if male then M, if Female then F)
SELECT FirstName, 
       CASE 
           WHEN Gender = 'Male' THEN 'M' 
           WHEN Gender = 'Female' THEN 'F' 
       END AS Gender
FROM EmployeeDetail;

--Select first name from "EmployeeDetail" table prifixed with "Hello
SELECT CONCAT('Hello ', FirstName) AS FirstName
FROM EmployeeDetail;

--	Get employee details from "EmployeeDetail" table whose Salary greater than 600000
select * from EmployeeDetail
where Salary > 600000;

--Get employee details from "EmployeeDetail" table whose Salary less than 700000
select * from EmployeeDetail
where Salary < 700000;

--Get employee details from "EmployeeDetail" table whose Salary between 500000 than 600000
select * from EmployeeDetail
where Salary between 500000 and 600000;


--31.	Give records of ProjectDetail table
create table ProjectDetail
(ProjectID int,
EmployeeDetailID int,
ProjectName varchar (50));

insert into projectDetail
(ProjectID, EmployeeDetailID, ProjectName)
values
(1,1, 'task_track'),
(2,1, 'CLP'),
(3,1, 'Survey_management'),
(4,2,'HR_Management'),
(5,3, 'Task_tracl'),
(6,3,'GRS'),
(7,3,'DDS'),
(8,4, 'HR_Management'),
(9,6, 'GL_Management')

--31.	Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table.
select department, sum(salary) as Total_salary from employeedetail
group by department;

31.	Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary.
select department, sum(salary) as Total_salary from employeedetail
group by department
order by Total_salary asc;

--31.	Write the query to get the department and department wise total(sum) salary, display it in descending order according to salary
select department, sum(salary) as Total_salary from employeedetail
group by department
order by Total_salary desc;

--31.	Write the query to get the department, total no. of departments, total(sum) salary with respect to department from "EmployeeDetail" table.
select department, count(department) as No_Of_departments,
sum(salary) as Total_salary from employeedetail
group by department;

--31.	Get department wise average salary from "EmployeeDetail" table order by salary ascending
select department, avg(salary) as Average_salary
from employeedetail
group by department
order by Average_salary asc;

--47 . Get department wise maximum salary from "EmployeeDetail" table order by salary ascending
select department, max(salary) as maximum_salary
from employeedetail
group by department
order by maximum_salary asc;

--48.Get department wise minimum salary from "EmployeeDetail" table order by salary ascending.
select department, min(salary) as minimum_salary
from employeedetail
group by department
order by minimum_salary asc;

--49.	Join both the table that is Employee and ProjectDetail based on some common paramter
select * from employeedetail e
join 
projectdetail p on e.employeeID = p.employeeDetailID;


--49.	Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employee which have assigned project already.
select e.firstname, e.lastname, P.Projectname
from EmployeeDetail e
join 
ProjectDetail p on e.EmployeeID = p.EmployeeDetailID
Order by FirstName;

--49.	Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee even they have not assigned project.
select e.firstname, e.lastname, P.Projectname
from EmployeeDetail e
left join 
ProjectDetail p on e.EmployeeID = p.EmployeeDetailID
Order by FirstName;

--53)	Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee if project is not assigned then display "-No Project Assigned"
SELECT 
    e.FirstName, 
    e.LastName, 
    IFNULL(p.ProjectName, '-No Project Assigned') AS ProjectName
FROM 
    EmployeeDetailTable e
LEFT JOIN 
    ProjectDetail p ON e.EmployeeID = p.EmployeeDetailID
ORDER BY 
    e.FirstName;


--54.Get all project name even they have not matching any employeeid, in left table, order by firstname from "EmployeeDetail" and "ProjectDetail
select e.employeeID, e.firstname, e.lastname, P.Projectname
from EmployeeDetail e
right join 
ProjectDetail p on e.EmployeeID = p.EmployeeDetailID
Order by FirstName;

--55.	Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL
SELECT 
    e.FirstName, 
    e.LastName, 
    p.ProjectName
FROM 
    EmployeeDetail e
LEFT JOIN 
    ProjectDetail p ON e.EmployeeID = p.EmployeeDetailID

UNION

SELECT 
    e.FirstName, 
    e.LastName, 
    p.ProjectName
FROM 
    EmployeeDetail e
RIGHT JOIN 
    ProjectDetail p ON e.EmployeeID = p.EmployeeDetailID;


--59.	Write down the query to fetch ProjectName on which more than one employee are working along with EmployeeName
SELECT 
    p.ProjectName, 
    e.FirstName, 
    e.LastName
FROM 
    ProjectDetail p
JOIN 
    EmployeeDetail e ON p.EmployeeDetailID = e.EmployeeID
WHERE 
    p.ProjectID IN (
        SELECT 
            ProjectID
        FROM 
            ProjectDetail
        GROUP BY 
            ProjectID
        HAVING 
            COUNT(EmployeeDetailID) > 1
    )
ORDER BY 
    p.ProjectName, e.FirstName;


--59.	Apply Cross Join in Both the tables
SELECT 
    e.FirstName, 
    e.LastName, 
    p.ProjectName
FROM 
    EmployeeDetail e
CROSS JOIN 
    ProjectDetail p;



