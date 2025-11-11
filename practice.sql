-- ========================================================
--  SQL PRACTICE SCRIPT (Annotated)
--  Author: Madhu
--  Description: Contains database setup, sample data, and
--  30–35 beginner-level SQL questions with solutions.
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



SELECT * FROM emp;
    

SELECT name, dept FROM emp;
    

SELECT * FROM emp
WHERE dept = 'IT';
    

SELECT * FROM emp
WHERE salary > 50000;


SELECT * FROM emp 
WHERE join_date > '2021-01-01';
    

SELECT city FROM emp
GROUP BY city;
    

SELECT COUNT(name) 
FROM emp;
    

SELECT AVG(salary) FROM emp;
    

SELECT COUNT(name) AS 'no of emp', dept FROM emp
GROUP BY dept;
    

SELECT * FROM emp 
WHERE name LIKE 'S%';
	

SELECT MAX(salary) FROM emp;
    

SELECT * FROM emp
WHERE salary > (SELECT AVG(salary) FROM emp);
    

SELECT COUNT(name), city FROM emp
GROUP BY city
HAVING COUNT(name) < 1;
    

SELECT dept, SUM(salary) FROM emp
GROUP BY dept
HAVING SUM(salary) > 100000;
    

SELECT name, dept, join_date 
FROM emp
WHERE join_date IN (
	SELECT MIN(join_date) FROM emp
	GROUP BY dept
);
             

WHERE name LIKE '%a%' 
AND name LIKE '%n%';
          

SELECT * FROM emp
WHERE dept NOT IN ('IT', 'HR');


SELECT name, dept, salary FROM emp
WHERE (dept, salary) IN (
	SELECT dept, MAX(salary) FROM emp
	GROUP BY dept
);
                

SELECT * FROM emp 
WHERE YEAR(join_date) BETWEEN 2020 AND 2022;
    

SELECT salary, dept FROM emp
WHERE (dept, salary) IN (
	SELECT dept, MIN(salary) FROM emp
	GROUP BY dept
)
ORDER BY salary;
    

SELECT * FROM emp
WHERE salary BETWEEN 40000 AND 60000;
    

SELECT name, dept, city FROM emp
WHERE city IN ('Delhi','Mumbai')
ORDER BY city ASC;
    

SELECT COUNT(name) FROM emp
WHERE YEAR(join_date) > 2020;
    

SELECT dept, salary FROM emp
WHERE salary IN (
	SELECT AVG(salary), dept FROM emp
	GROUP BY dept
);
    

SELECT dept, ROUND(AVG(salary), 2) AS avg_salary
FROM emp
GROUP BY dept;


SELECT * FROM emp
WHERE name LIKE '%a';
    

SELECT DISTINCT dept FROM emp;
    

SELECT name, dept, salary
FROM emp e
WHERE salary = (
	SELECT MAX(salary)
	FROM emp
	WHERE dept = e.dept
);
    

SELECT COUNT(name), dept FROM emp
GROUP BY dept
HAVING COUNT(name) > 2;
    
    
SELECT name, dept, YEAR(join_date) AS join_year FROM emp
ORDER BY YEAR(join_date);
    

SELECT * FROM emp
WHERE city NOT IN ('Mumbai','Delhi');

-- END OF SCRIPT