CREATE TABLE regions (
	region_id INT IDENTITY(1,1) PRIMARY KEY,
	region_name VARCHAR (25) DEFAULT NULL
);
CREATE TABLE countries (
	country_id CHAR (2) PRIMARY KEY,
	country_name VARCHAR (40) DEFAULT NULL,
	region_id INT NOT NULL,
	FOREIGN KEY (region_id) REFERENCES regions (region_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE locations (
	location_id INT IDENTITY(1,1) PRIMARY KEY,
	street_address VARCHAR (40) DEFAULT NULL,
	postal_code VARCHAR (12) DEFAULT NULL,
	city VARCHAR (30) NOT NULL,
	state_province VARCHAR (25) DEFAULT NULL,
	country_id CHAR (2) NOT NULL,
	FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE jobs (
	job_id INT IDENTITY(1,1) PRIMARY KEY,
	job_title VARCHAR (35) NOT NULL,
	min_salary DECIMAL (8, 2) DEFAULT NULL,
	max_salary DECIMAL (8, 2) DEFAULT NULL
);
CREATE TABLE departments (
	department_id INT IDENTITY(1,1) PRIMARY KEY,
	department_name VARCHAR (30) NOT NULL,
	location_id INT DEFAULT NULL,
	FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE employees (
	employee_id INT IDENTITY(1,1) PRIMARY KEY,
	first_name VARCHAR (20) DEFAULT NULL,
	last_name VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	phone_number VARCHAR (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id INT NOT NULL,
	salary DECIMAL (8, 2) NOT NULL,
	manager_id INT DEFAULT NULL,
	department_id INT DEFAULT NULL,
	FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);


CREATE TABLE dependents (
	dependent_id INT IDENTITY(1,1) PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	relationship VARCHAR (25) NOT NULL,
	employee_id INT NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);
/*Data for the table regions */
SET IDENTITY_INSERT regions ON;

INSERT INTO regions(region_id, region_name) 
VALUES (1, 'Europe');

INSERT INTO regions(region_id, region_name) 
VALUES (2, 'Americas');

INSERT INTO regions(region_id, region_name) 
VALUES (3, 'Asia');

INSERT INTO regions(region_id, region_name) 
VALUES (4, 'Middle East and Africa');

SET IDENTITY_INSERT regions OFF;

/*Data for the table countries */
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('AR','Argentina',2);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('AU','Australia',3);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('BE','Belgium',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('BR','Brazil',2);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('CA','Canada',2);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('CH','Switzerland',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('CN','China',3);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('DE','Germany',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('DK','Denmark',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('EG','Egypt',4);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('FR','France',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('HK','HongKong',3);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('IL','Israel',4);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('IN','India',3);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('IT','Italy',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('JP','Japan',3);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('KW','Kuwait',4);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('MX','Mexico',2);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('NG','Nigeria',4);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('NL','Netherlands',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('SG','Singapore',3);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('ZW','Zimbabwe',4);


/*Data for the table locations */
SET IDENTITY_INSERT locations ON;

INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
 SET IDENTITY_INSERT locations OFF;

 /*Data for the table jobs */
  SET IDENTITY_INSERT jobs ON;
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (1,'Public Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (2,'Accounting Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (3,'Administration Assistant',3000.00,6000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (4,'President',20000.00,40000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (5,'Administration Vice President',15000.00,30000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (6,'Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (7,'Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (8,'Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (9,'Programmer',4000.00,10000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (10,'Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (11,'Marketing Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (12,'Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (13,'Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (14,'Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (15,'Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (16,'Sales Representative',6000.00,12000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (17,'Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (18,'Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (19,'Stock Manager',5500.00,8500.00);
SET IDENTITY_INSERT jobs OFF;

/*Data for the table departments */
SET IDENTITY_INSERT departments ON;

INSERT INTO departments(department_id,department_name,location_id)
 VALUES (1,'Administration',1700);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (2,'Marketing',1800);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (3,'Purchasing',1700);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (4,'Human Resources',2400);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (5,'Shipping',1500);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (6,'IT',1400);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (7,'Public Relations',2700);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (8,'Sales',2500);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (9,'Executive',1700);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (10,'Finance',1700);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (11,'Accounting',1700);


SET IDENTITY_INSERT departments OFF;


/*Data for the table employees */

 SET IDENTITY_INSERT employees ON;
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
 VALUES (100,'Steven','King','steven.king@sqltutorial.org','515.123.4567','1987-06-17',4,24000.00,NULL,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','1989-09-21',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569','1993-01-13',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','1990-01-03',9,9000.00,102,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','1991-05-21',9,6000.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (105,'David','Austin','david.austin@sqltutorial.org','590.423.4569','1997-06-25',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','1998-02-05',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','1999-02-07',9,4200.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','1994-08-17',7,12000.00,101,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','1994-08-16',6,9000.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (110,'John','Chen','john.chen@sqltutorial.org','515.124.4269','1997-09-28',6,8200.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','1997-09-30',6,7700.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469','1998-03-07',6,7800.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','1999-12-07',6,6900.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561','1994-12-07',14,11000.00,100,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562','1995-05-18',13,3100.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563','1997-12-24',13,2900.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564','1997-07-24',13,2800.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565','1998-11-15',13,2600.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566','1999-08-10',13,2500.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234','1996-07-18',19,8000.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234','1997-04-10',19,8200.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234','1995-05-01',19,7900.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234','1997-10-10',19,6500.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224','1998-09-28',18,2700.00,120,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (145,'John','Russell','john.russell@sqltutorial.org',NULL,'1996-10-01',15,14000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,'1997-01-05',15,13500.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,'1998-03-24',16,8600.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,'1998-04-23',16,8400.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,'1999-05-24',16,7000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,'2000-01-04',16,6200.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876','1996-02-04',17,4000.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876','1997-03-03',17,3900.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444','1987-09-17',3,4400.00,101,1);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555','1996-02-17',10,13000.00,100,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666','1997-08-17',11,6000.00,201,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777','1994-06-07',8,6500.00,101,4);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888','1994-06-07',12,10000.00,101,7);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080','1994-06-07',2,12000.00,101,11);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (206,'William','Gietz','william.gietz@sqltutorial.org','515.123.8181','1994-06-07',1,8300.00,205,11);

 SET IDENTITY_INSERT employees OFF;

 
/*Data for the table dependents */

SET IDENTITY_INSERT dependents ON;

INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (1,'Penelope','Gietz','Child',206);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (2,'Nick','Higgins','Child',205);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (3,'Ed','Whalen','Child',200);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (4,'Jennifer','King','Child',100);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (5,'Johnny','Kochhar','Child',101);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (6,'Bette','De Haan','Child',102);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (7,'Grace','Faviet','Child',109);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (8,'Matthew','Chen','Child',110);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (9,'Joe','Sciarra','Child',111);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (10,'Christian','Urman','Child',112);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (11,'Zero','Popp','Child',113);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (12,'Karl','Greenberg','Child',108);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (13,'Uma','Mavris','Child',203);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (14,'Vivien','Hunold','Child',103);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (15,'Cuba','Ernst','Child',104);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (16,'Fred','Austin','Child',105);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (17,'Helen','Pataballa','Child',106);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (18,'Dan','Lorentz','Child',107);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (19,'Bob','Hartstein','Child',201);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (20,'Lucille','Fay','Child',202);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (21,'Kirsten','Baer','Child',204);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (22,'Elvis','Khoo','Child',115);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (23,'Sandra','Baida','Child',116);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (24,'Cameron','Tobias','Child',117);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (25,'Kevin','Himuro','Child',118);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (26,'Rip','Colmenares','Child',119);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (27,'Julia','Raphaely','Child',114);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (28,'Woody','Russell','Child',145);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (29,'Alec','Partners','Child',146);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (30,'Sandra','Taylor','Child',176);

SET IDENTITY_INSERT dependents OFF;

--TASK 1
--1)WRITE A QUERY FOR  SELECT STATEMENTS :-

-- A. To get data from all the rows and columns in the employees table:
Select * from employees

--B. select data from the employee id, first name, last name and hire date of all rows in the employee table 
SELECT employee_id, first_name, last_name, hire_date
FROM employees;

--C.to get the first name, last name, salary, and new salary:
--D.Increase the salary two times and named as New_SALARY from employees table
-- Add a new column named new_salary to the employees table
ALTER TABLE employees
ADD new_salary DECIMAL(8, 2);

-- Update the new_salary column with double the original salary
UPDATE employees
SET new_salary = salary * 2;

select first_name, last_name, salary, new_salary
from employees;


--2)WRITE A QUERY FOR ORDER BY  STATEMENTS :-
--A.	returns the data from the employee id, first name, last name, hire date, and salary column of the employees table:
SELECT employee_id, first_name, last_name, hire_date, salary
FROM employees;

--B.	to sort employees by first names in alphabetical order:
SELECT employee_id, first_name, last_name, hire_date, salary
FROM employees
ORDER BY first_name;

--C.	to sort the employees by the first name in ascending order and the last name in descending order:
SELECT employee_id, first_name, last_name, hire_date, salary
FROM employees
ORDER BY first_name ASC, last_name DESC;

--D.	to sort employees by salary from high to low:
SELECT employee_id, first_name, last_name, hire_date, salary
FROM employees
ORDER BY salary Desc;

--E.	to sort the employees by values in the hire_date column from:
SELECT employee_id, first_name, last_name, hire_date, salary
FROM employees
ORDER BY hire_date ASC;

--F.	sort the employees by the hire dates in descending order:
SELECT employee_id, first_name, last_name, hire_date, salary
FROM employees
ORDER BY hire_date Desc;

--3)WRITE A QUERY FOR DISTINCT  STATEMENTS :-
--A.	selects the salary data from the salary column of the employees table and sorts them from high to low:
SELECT salary
FROM employees
ORDER BY salary DESC;

--B.	select unique values from the salary column of the employees table:
SELECT DISTINCT salary
FROM employees;

--C.	selects the job id and salary from the employees table:
select job_id, salary
from employees;

--D.	to remove the duplicate values in job id and salary:
select distinct job_id, salary
from employees;

--E.	returns the distinct phone numbers of employees
select distinct phone_number
from employees;

--4)WRITE A QUERY FOR TOP N  STATEMENTS :-
--A.	returns all rows in the employees table sorted by the first_name column.
select * from employees
order by first_name;

--B.	to return the first 5 rows in the result set returned by the SELECT clause:
select top 5 * from employees;

--C.	to return five rows starting from the 4th row:
SELECT *
FROM employees
ORDER BY employee_id
OFFSET 3 ROWS
FETCH NEXT 5 ROWS ONLY;

--D.	gets the top five employees with the highest salaries.
select top 5 * from employees
order by salary desc;

--E.	to get employees who have the 2nd highest salary in the company
SELECT *
FROM employees
ORDER BY salary DESC
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY;

--5)WRITE A QUERY FOR WHERE  CLAUSE and COMPARISON OPERATORS :-
--A.	query finds employees who have salaries greater than 14,000 and sorts the results sets based on the salary in descending order.
select * from employees
where salary > 14000
order by salary desc;

--B.	query finds all employees who work in the department id 5.
select * from employees
where department_id = 5;

--C.	query finds the employee whose last name is Chen
select * from employees
where last_name = 'chen';

--D.	To get all employees who joined the company after January 1st, 1999
select * from employees
where hire_date > '1999-01-01';

--E.	to find the employees who joined the company in 1999,
select * from employees
where hire_date > '1999-01-01' and hire_date < '2000-01-01';

--F.	statement finds the employee whose last name is Himuro
select * from employees
where last_name = 'Himuro';

--G.	the query searches for the string Himuro in the last_name column of the employees table.
SELECT *
FROM employees
WHERE last_name LIKE '%Himuro%';


--H.	to find all employees who do not have phone numbers:
select * from employees
where phone_number is null;

--I.	returns all employees whose department id is not 8.
select * from employees
where department_id <> '8';

--J.	finds all employees whose department id is not eight and ten.

--I.	returns all employees whose department id is not 8.
select * from employees
where department_id <> '8' and department_id <> '10';

--K.	to find the employees whose salary is greater than 10,000,
select * from employees
where salary > '10000';

--L.	finds employees in department 8 and have the salary greater than 10,000:
select * from employees
where department_id = '8' and  salary > '10000';

--M.	the statement below returns all employees whose salaries are less than 10,000:
select * from employees
where salary < '10000';

--N.	finds employees whose salaries are greater than or equal 9,000:
select * from employees
where salary >= '9000';

--O.	finds employees whose salaries are less than or equal to 9,000:
select * from employees
where salary <= '9000';

--6)WRITE A QUERY FOR:-
create table courses (
course_id int IDENTITY(1,1) PRIMARY KEY,
course_name varchar (25)  DEFAULT NULL);

--A.	adds a new column named credit_hours to the courses table.
alter table courses
add credit_hours int;

--B.	adds the fee and max_limit columns to the courses table and places these columns after the course_name column.



--C.	changes the attribute of the fee column to NOT NULL.
ALTER TABLE courses
ALTER COLUMN fee DECIMAL(10, 2) NOT NULL;

--D.	to remove the fee column of the courses table
ALTER TABLE courses
DROP COLUMN fee;

--E.	removes the max_limit and credit_hours of the courses table.
ALTER TABLE courses
DROP COLUMN max_limit,
             credit_hours;

--6)WRITE A QUERY FOR:-
--SQL foreign key constraint

CREATE  TABLE  projects (
    project_id  INT  PRIMARY KEY,
    project_name  VARCHAR(255),
    start_date  DATE  NOT NULL,
    end_date  DATE  NOT NULL
);

CREATE  TABLE  project_milestones(
    milestone_id  INT  PRIMARY KEY,
    project_id   INT,
    milestone_name VARCHAR(100)
);


--TASK 2:
--1)WRITE A QUERY FOR  LOGICAL OPERATORS and OTHER ADVANCED OPERATORS:-
--Part 1:-
--A.	finds all employees whose salaries are greater than 5,000 and less than 7,000:
select * from employees
where salary in (5000, 7000);

--B.	finds employees whose salary is either 7,000 or 8,000:
select * from employees
where salary in (7000, 8000);

--C.	finds all employees who do not have a phone number:
select * from employees
where phone_number is null;



--D.	finds all employees whose salaries are between 9,000 and 12,000.
select * from employees
where salary in (9000, 12000);

--E.	finds all employees who work in the department id 8 or 9.
select * from employees
where department_id in (8,9);

--F.	finds all employees whose first name starts with the string jo
SELECT *
FROM employees
WHERE first_name LIKE 'jo%';


--G.	finds all employees with the first names whose the second character is  h
SELECT *
FROM employees
WHERE first_name LIKE '_%h';
--H.	finds all employees whose salaries are greater than all salaries of employees in the department 8:
SELECT *
FROM employees
WHERE salary > ALL (SELECT salary FROM employees WHERE department_id = 8);


--Part 2:- 
--A.	finds all employees whose salaries are greater than the average salary of every department:
SELECT *
FROM employees e
WHERE salary > (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id);


--B.	finds all employees who have dependents:
SELECT *
FROM employees
WHERE employee_id IN (SELECT DISTINCT employee_id FROM dependents);

--C.	to find all employees whose salaries are between 2,500 and 2,900:
select * from employees
where salary between '2500' and '2900';

--D.	to find all employees whose salaries are not in the range of 2,500 and 2,900:
select * from employees
where salary not between '2500' and '2900';

--E.	to find all employees who joined the company between January 1, 1999, and December 31, 2000:
select * from employees
where hire_date between '1999-01-01' and '2000-12-31';

--F.	to find employees who have not joined the company from January 1, 1989 to December 31, 1999:
select * from employees
where hire_date not between '1989-01-01' and '1999-12-31';

--G.	to find employees who joined the company between 1990 and 1993:
select * from employees
where hire_date between '1990' and '1993';


--Part 3:-

--A.	to find all employees whose first names start with Da
select * from employees
where first_name like 'da%';

--B.	to find all employees whose first names end with er
select * from employees
where first_name like '%er';

--C.	to find employees whose last names contain the word an:
select * from employees
where last_name like '%an%';


--D.	retrieves employees whose first names start with Jo and are followed by at most 2 characters:
SELECT *
FROM employees
WHERE first_name LIKE 'Jo_';


--E.	to find employees whose first names start with any number of characters and are followed by at most one character:
SELECT *
FROM employees
WHERE first_name LIKE '_%_';


--F.	to find all employees whose first names start with the letter S but not start with Sh:
select * from employees 
where first_name like 'S%' and first_name not like 'Sh%';


--Part 4:-
--A.	retrieves all employees who work in the department id 5.
select* from employees
where department_id = '5'; 

--B.	To get the employees who work in the department id 5 and with a salary not greater than 5000.
select* from employees
where department_id = '5'and salary <= '5000'; 


--C.	statement gets all the employees who are not working in the departments 1, 2, or 3.
select * from employees
where department_id not in ('1','2','3');

--D.	retrieves all the employees whose first names do not start with the letter D.
select * from employees
where first_name not like 'D%';

--E.	to get employees whose salaries are not between 5,000 and 1,000.
select * from employees
where salary not between '1000' and '5000';

--Part 5:
--A.	Write a query to get the employees who do not have any dependents by above image
--B.	To find all employees who do not have the phone numbers
select * from employees
where phone_number is null;

--C.	To find all employees who have phone numbers
select * from employees
where phone_number is not null;


--TASK 3:
--JOINS
-- SQL Inner Join Clause
--1)	Write a Query to 
--A.	To get the information of the department id 1,2, and 3
Select * from departments
where department_id in (1,2,3)

--B.	To get the information of employees who work in the department id 1, 2 and 3
SELECT *
FROM Employees e
INNER JOIN Departments d ON e.Department_ID = d.Department_ID
WHERE e.Department_ID IN (1, 2, 3);

select * from employees
--C.    Write a Query to get the first name, last name, job title, and department name of employees who work in department id 1, 2, and 3.
SELECT e.first_name, e.last_name,j.job_title, d.department_name
from employees e
inner join jobs j on e.job_id = j.job_id
inner join departments d on e.department_ID = d.department_id
WHERE e.department_id IN (1, 2, 3);


--SQL Left Join Clause
--Write a Query :--
--A.	To query the country names of US, UK, and China
select country_name from countries
where country_name in ('United Kingdom','United States of America','china')

--B.	query retrieves the locations located in the US, UK and China:
select * from locations l
inner join countries c on l.country_ID = c.country_id
where country_name in ('United Kingdom','United States of America','china')

--C.	To join the countries table with the locations table
select * from countries c 
inner join locations l on c.country_id = l.country_id

--D.	to find the country that does not have any locations in the locations table
SELECT c.country_name
FROM Countries c
LEFT JOIN Locations l ON c.country_id = l.country_id
WHERE l.country_id IS NULL;

--Write a query to join 3 tables: regions, countries, and locations
select * from regions r
inner join countries c on r.region_id = c.region_id
inner join locations l on c.country_id = l.country_id

--SQL Self join
--The manager_id column specifies the manager of an employee. Write a query  
--statement to  joins the employees table to itself to query the information of who reports to whom.
SELECT 
    e.employee_id AS Employee_ID,
    e.first_name AS EmployeeFirstName,
    e.last_name AS EmployeeLastName,
    m.employee_id AS ManagerID,
    m.first_name AS ManagerFirstName,
    m.last_name AS ManagerLastName
FROM 
    employees e
LEFT JOIN 
    employees m ON e.manager_id = m.employee_id;


--task 4
--Group by clause
--Write a  Query 
--to group the values in department_id column of the employees table:
SELECT 
    department_id,
    COUNT(*) AS NumberOfEmployees
FROM 
    employees
GROUP BY 
    department_id;

--to count the number of employees by department:
select department_Id,
 COUNT(*) as employeeno
 from employees
 group by department_id

--returns the number of employees by department
SELECT 
    d.department_name,
    e.department_id,
    COUNT(*) AS NumberOfEmployees
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
GROUP BY 
    e.department_id, d.department_name;

--to sort the departments by headcount:
SELECT 
    department_id,
    COUNT(*) AS NumberOfEmployees
FROM 
    employees
GROUP BY 
    department_id
ORDER BY 
    NumberOfEmployees DESC;

--to find departments with headcounts are greater than 5:
SELECT 
    department_id,
    COUNT(*) AS NumberOfEmployees
FROM 
    employees
GROUP BY 
    department_id
HAVING 
    COUNT(*) > 5;

--returns the minimum, maximum and average salary of employees in each department.

select department_id,
 MIN(salary) As minimumsalary,
 MAX(salary) As maximumsalary,
 AVG(salary) AS AverageSalary
from employees
group by department_id;

--To get the total salary per department,
SELECT 
    department_id,
    SUM(salary) AS TotalSalary
FROM 
    employees
GROUP BY 
    department_id;

--groups rows with the same values both department_id and job_id columns in the same group then return the rows for each of these groups
SELECT 
    department_id,
    job_id,
    COUNT(*) AS NumberOfEmployees
FROM 
    employees
GROUP BY 
    department_id, 
    job_id;

--Write a Query 
--To get the managers and their direct reports, and  to group employees by the managers and to count the direct reports.
--Query to get the managers and their direct reports:
SELECT 
    m.employee_id AS ManagerID,
    m.first_name AS ManagerFirstName,
    m.last_name AS ManagerLastName,
    e.employee_id AS EmployeeID,
    e.first_name AS EmployeeFirstName,
    e.last_name AS EmployeeLastName
FROM employees e
JOIN 
    employees m ON e.manager_id = m.employee_id;

--Query to group employees by the managers and to count the direct reports:
SELECT 
    m.employee_id AS ManagerID,
    m.first_name AS ManagerFirstName,
    m.last_name AS ManagerLastName,
    COUNT(e.employee_id) AS DirectReportsCount
FROM 
    employees e
JOIN 
    employees m ON e.manager_id = m.employee_id
GROUP BY 
    m.employee_id, m.first_name, m.last_name;

--To find the managers who have at least five direct reports

SELECT 
    m.employee_id AS ManagerID,
    m.first_name AS ManagerFirstName,
    m.last_name AS ManagerLastName,
    COUNT(e.employee_id) AS DirectReportsCount
FROM 
    employees e
JOIN 
    employees m ON e.manager_id = m.employee_id
GROUP BY 
    m.employee_id, m.first_name, m.last_name
HAVING 
    COUNT(e.employee_id) >= 5;


--calculates the sum of salary that the company pays for each department and selects only the departments with the sum of salary between 20000 and 30000.
select department_id,
SUM(salary) As total_salary
from employees
group by department_id
having
SUM(salary)
between 20000 and 30000;

--To find the department that has employees with the lowest salary greater than 10000
select department_id
from employees
group by department_id
having MIN(salary) > 10000;

--To find the departments that have the average salaries of employees between 5000 and 7000
select department_id
from employees
group by department_id
having 
AVG(salary) 
between 5000 and 7000;

--task 5 
--SQL Union Operator 
--Write a Query to combine the first name and last name of employees and dependents 
--(Note:Union is used to remove duplicates and get combined values but in the same query if we use Union all it will incluide duplicate as well))
SELECT 
    employee_id AS ID,
    CONCAT(first_name, ' ', last_name) AS FullName,
    'Employee' AS Type
FROM 
    employees
UNION
SELECT 
    dependent_id AS ID,
    CONCAT(first_name, ' ', last_name) AS FullName,
    'Dependent' AS Type
FROM 
    dependents;

--SQL Intersect Operator
--Write a Query to  Applies the INTERSECT operator to the A and B tables and sorts the combined result set by the id column in descending order.
Select
employee_id As ID
 from employees
Intersect
select department_id as ID
 from departments
order by ID desc;

--SQL Exit operator
--finds all employees who have at least one dependent.
select distinct e.*
from employees e
join dependents d on e.employee_id = d.employee_id;

--finds employees who do not have any dependents:
SELECT *
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM dependents d
    WHERE e.employee_id = d.employee_id
);

--SQL Case Expression
--Suppose the current year is 2000. How to  use the simple CASE expression to get the work anniversaries of employees by 
select
employee_id, first_name, Last_name,
case
when YEAR(hire_date) = 2000
then 'Work Anniversary'
else null
end as anniversarytype
from employees;

-- Write a Query  If the salary is less than 3000, the CASE expression returns “Low”. If the salary is between 3000 and 5000, 
--it returns “average”. When the salary is greater than 5000, the CASE expression returns “High”.
select salary,
case
when salary < 3000 then 'low'
when salary between 3000 and 5000 then 'Average'
else 'High'
end as salaryrating
from employees;


--SQL Update statement:
--Write a Query to update Sarah’s last name from  Bell to Lopez
update employees
set last_name = 'Lopez'
where first_name = 'sarah' and last_name = 'bell';

--Combine below two queries using subquery inorder find all departments located at the location whose id is 1700 and find all employees that belong to
--the location 1700 by using the department id list of the previous query
SELECT 
    *
FROM
    departments
WHERE
    location_id = 1700;

	SELECT 
    employee_id, first_name, last_name
FROM
    employees
WHERE
    department_id IN (1 , 3, 8, 10, 11)
ORDER BY first_name , last_name;

-- Find all departments at location 1700
SELECT department_id
FROM departments
WHERE location_id = 1700;

-- Find all employees in the departments located at location 1700
SELECT employee_id, first_name, last_name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location_id = 1700
)
ORDER BY first_name, last_name;

--to find all employees who do not locate at the location 1700:
SELECT employee_id, first_name, last_name
FROM employees
WHERE department_id not in(
select department_id
from departments
where location_id = 1700
)
order by first_name, last_name;

--finds the employees who have the highest salary:
select employee_id, first_name, last_name, salary
from employees
where salary = (select MAX(salary) from employees);

--finds all employees who salaries are greater than the average salary of all employees:
select employee_id, first_name, last_name, salary
from employees
where salary > (SElect AVG(salary) from employees)
order by salary desc;

--finds all departments which have at least one employee with the salary is greater than 10,000:
SELECT DISTINCT department_id
FROM employees
WHERE salary > 10000;

--finds all departments that do not have any employee with the salary greater than 10,000:
select distinct department_ID
from employees
where department_id not in
(select distinct department_id
from employees
where salary >10000);

--to find the lowest salary by department:
select department_id,
MIN(salary) as lowest_salary from employees
group by department_id;

--finds all employees whose salaries are greater than the lowest salary of every department:
select FIRST_name, last_name, salary
from employees
where salary > (select MIN(salary) from employees);

--finds all employees whose salaries are greater than or equal to the highest salary of every department
select FIRST_name, last_name, salary
from employees
where salary >= (select Max(salary) from employees);

--returns the average salary of every department
select department_ID, AVG(salary) as avg_salary
from employees
group by department_id;

--to calculate the average of average salary of departments :
select AVG(department_avg) as avg_of_avg_salaries
from (
select AVG(salary) as department_avg
from employees
group by department_id)
AS department_averages;

--finds the salaries of all employees, their average salary, and the difference between the salary of each employee and the average salary.
select employee_id, first_name, last_name, salary, 
(SELECT AVG(salary) FROM employees) AS average_salary,
    salary - (SELECT AVG(salary) FROM employees) AS salary_difference
FROM employees;

