-- ========================================================
--  SQL PRACTICE SCRIPT (Annotated)
--  Author: Madhu
--  Description: Contains database setup, sample data, and
--  30 beginner-level SQL questions with solutions.
-- ========================================================


-- DATABASE CREATION

CREATE DATABASE IF NOT EXISTS sql_practice;
USE sql_practice;


-- TABLE CREATION

CREATE TABLE emp(
id INT PRIMARY KEY,
name VARCHAR(50),
dept VARCHAR(50),
salary INT,
city VARCHAR(225),
join_date DATE
);


-- INSERTING VALUES

INSERT INTO emp(id, name, dept, salary, city, join_date)
VALUES
(1, 'Rohan Das', 'HR', 40000, 'Delhi', '2020-03-12'),
(2, 'Priya Singh', 'IT', 55000, 'Mumbai', '2021-06-25'),
(3, 'Arjun Mehta', 'Finance', 60000, 'Delhi', '2019-02-10'),
(4, 'Neha Jain', 'IT', 45000, 'Bangalore', '2022-01-04'),
(5, 'Rahul Roy', 'HR', 38000, 'Chennai', '2021-10-16'),
(6, 'Sneha Patel', 'Finance', 70000, 'Mumbai', '2018-09-09'),
(7, 'Aditya Verma', 'IT', 50000, 'Pune', '2020-12-01'),
(8, 'Simran Kaur', 'HR', 42000, 'Delhi', '2023-04-21'),
(9, 'Karan Malhotra', 'Marketing', 48000, 'Kolkata', '2020-05-20'),
(10, 'Anjali Sharma', 'Finance', 62000, 'Bangalore', '2019-11-15'),
(11, 'Deepak Joshi', 'IT', 53000, 'Delhi', '2022-08-18'),
(12, 'Pooja Reddy', 'HR', 41000, 'Hyderabad', '2020-06-30'),
(13, 'Vikas Yadav', 'Finance', 68000, 'Pune', '2017-12-10'),
(14, 'Sakshi Nair', 'IT', 47000, 'Mumbai', '2023-02-12'),
(15, 'Manish Gupta', 'Marketing', 52000, 'Chennai', '2021-07-08'),
(16, 'Aditi Rao', 'Finance', 59000, 'Bangalore', '2022-05-10'),
(17, 'Ritika Sen', 'HR', 43000, 'Kolkata', '2023-01-11'),
(18, 'Aman Kumar', 'IT', 61000, 'Delhi', '2021-04-19'),
(19, 'Mehul Jain', 'Marketing', 49000, 'Mumbai', '2020-09-23'),
(20, 'Tanvi Das', 'Finance', 72000, 'Pune', '2018-11-04'),
(21, 'Lakshmi Pillai', 'HR', 45000, 'Hyderabad', '2021-03-14'),
(22, 'Harsh Vora', 'Finance', 75000, 'Delhi', '2017-07-07'),
(23, 'Nisha Roy', 'IT', 54000, 'Kolkata', '2019-08-25'),
(24, 'Arun Iyer', 'Marketing', 46000, 'Chennai', '2022-12-01'),
(25, 'Tanya Kapoor', 'Finance', 70000, 'Bangalore', '2020-02-29');


--RETRIEVE ALL RECORDS FROM THE EMP TABLE.
SELECT * FROM emp;
    
--SHOW NAMES AND DEPARTMENTS OF ALL EMPLOYEES.
SELECT name, dept FROM emp;
    
--FIND EMPLOYEES WHO WORK IN THE IT DEPARTMENT.
SELECT * FROM emp
WHERE dept = 'IT';
    
--GET EMPLOYEES WITH SALARY GREATER THAN 50,000.
SELECT * FROM emp
WHERE salary > 50000;

--LIST EMPLOYEES WHO JOINED AFTER 1ST JANUARY 2021.
SELECT * FROM emp 
WHERE join_date > '2021-01-01';
    
--SHOW DISTINCT CITIES WHERE EMPLOYEES WORK.
SELECT DISTINCT dept FROM emp;
    
--COUNT TOTAL NUMBER OF EMPLOYEES.
SELECT COUNT(name) 
FROM emp;
    
--FIND THE AVERAGE SALARY OF ALL EMPLOYEES.
SELECT AVG(salary) FROM emp;
    
--GET THE NUMBER OF EMPLOYEES IN EACH DEPARTMENT.
SELECT COUNT(name) AS 'no of emp', dept FROM emp
GROUP BY dept;
    
--FIND EMPLOYEES WHOSE NAME STARTS WITH ‘S’.
SELECT * FROM emp 
WHERE name LIKE 'S%';
	
--FIND THE HIGHEST SALARY FROM THE EMPLOYEE TABLE.
SELECT MAX(salary) FROM emp;
    
--LIST EMPLOYEES WHO EARN MORE THAN THE AVERAGE SALARY.
SELECT * FROM emp
WHERE salary > (SELECT AVG(salary) FROM emp);
    
--FIND HOW MANY EMPLOYEES ARE FROM EACH CITY, BUT ONLY SHOW CITIES WITH MORE THAN 1 EMPLOYEE.
SELECT COUNT(name), city FROM emp
GROUP BY city
HAVING COUNT(name) > 1;
    
--SHOW DEPARTMENTS WHERE THE TOTAL SALARY IS MORE THAN 1,00,000.
SELECT dept, SUM(salary) FROM emp
GROUP BY dept
HAVING SUM(salary) > 100000;
    
--DISPLAY THE EMPLOYEE(S) WHO JOINED EARLIEST IN EACH DEPARTMENT.
SELECT name, dept, join_date 
FROM emp
WHERE join_date IN (
	SELECT MIN(join_date) FROM emp
	GROUP BY dept
);
             
--FIND EMPLOYEES WHOSE NAMES CONTAIN BOTH LETTERS ‘A’ AND ‘N’.
SELECT * FROM emp
WHERE name LIKE '%a%' 
AND name LIKE '%n%';
          
--LIST EMPLOYEES WHO DO NOT WORK IN IT OR HR.
SELECT * FROM emp
WHERE dept NOT IN ('IT', 'HR');

--FIND THE EMPLOYEE(S) WITH THE HIGHEST SALARY IN EACH DEPARTMENT.
SELECT name, dept, salary FROM emp
WHERE (dept, salary) IN (
	SELECT dept, MAX(salary) FROM emp
	GROUP BY dept
);
                
--SHOW EMPLOYEES WHO JOINED BETWEEN 2020 AND 2022 (INCLUSIVE).
SELECT * FROM emp 
WHERE YEAR(join_date) BETWEEN 2020 AND 2022;
    
--GET THE DEPARTMENT WITH THE LOWEST AVERAGE SALARY.
SELECT salary, dept FROM emp
WHERE (dept, salary) IN (
	SELECT dept, MIN(salary) FROM emp
	GROUP BY dept
)
ORDER BY salary;
    
--FIND ALL EMPLOYEES WHOSE SALARY IS BETWEEN 40,000 AND 60,000.
SELECT * FROM emp
WHERE salary BETWEEN 40000 AND 60000;
    
--LIST NAMES AND DEPARTMENTS OF EMPLOYEES WHO WORK IN DELHI OR MUMBAI.
SELECT name, dept, city FROM emp
WHERE city IN ('Delhi','Mumbai')
ORDER BY city ASC;
    
--COUNT EMPLOYEES WHO JOINED AFTER 2020.
SELECT COUNT(name) FROM emp
WHERE YEAR(join_date) > 2020;
    
--GET DEPARTMENT-WISE AVERAGE SALARY ROUNDED TO 2 DECIMALS.
SELECT dept, ROUND(AVG(salary), 2) AS avg_salary
FROM emp
GROUP BY dept;

--LIST EMPLOYEES WHOSE NAME ENDS WITH ‘A’.
SELECT * FROM emp
WHERE name LIKE '%a';

--FIND THE HIGHEST SALARY AND THE EMPLOYEE(S) EARNING IT.
SELECT name, dept, salary
FROM emp e
WHERE salary = (
	SELECT MAX(salary)
	FROM emp
	WHERE dept = e.dept
);
    
--COUNT HOW MANY EMPLOYEES EACH DEPARTMENT HAS, AND SHOW ONLY DEPARTMENTS WITH MORE THAN 2 EMPLOYEES.
SELECT COUNT(name), dept FROM emp
GROUP BY dept
HAVING COUNT(name) > 2;
    
--LIST EMPLOYEES WHO JOINED IN THE SAME YEAR (SHOW NAME, DEPT, YEAR).
SELECT name, dept, YEAR(join_date) AS join_year FROM emp
ORDER BY YEAR(join_date);
    
--SHOW EMPLOYEES WHO ARE NOT FROM MUMBAI OR DELHI.
SELECT * FROM emp
WHERE city NOT IN ('Mumbai','Delhi');

--FIND EMPLOYEES WHO HAVE A SALARY GREATER THAN THE AVERAGE SALARY OF THEIR CITY.
SELECT e.name, e.city, e.salary
FROM emp e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM emp
    WHERE city = e.city
)
ORDER BY CITY;

-- END OF SCRIPT
