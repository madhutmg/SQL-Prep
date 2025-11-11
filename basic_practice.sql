create table emp(
id int primary key,
name varchar(50),
dept varchar(50),
salary int,
city varchar(225),
join_date date);

insert into emp(id, name, dept, salary, city, join_date)
value(1, 'Rohan Das', 'HR', 40000, 'Delhi', '2020-03-12'),
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
    
    select * from emp;
    
    select name, dept from emp;
    
    select * from emp
    where dept = 'IT';
    
    select * from emp
    where salary > 50000;
    
    select * from emp 
    where join_date > '2021-01-01';
    
    select city from emp
    group by city;
    
    select count(name) 
    from emp;
    
    select avg(salary) from emp;
    
    select count(name)'no of emp', dept from emp
    group by dept;
    
    select * from emp 
    where name like 'S%';
	
    select max(salary) from emp;
    
    select * from emp
    where salary > (select avg(salary) from emp);
    
    select count(name), city from emp
    group by city
    having count(name) < 1;
    
	select dept , sum(salary) from emp
    group by dept
    having sum(salary) > 100000;
    
    select name , dept, join_date 
    from emp
    where join_date in (
			 select min(join_date) from emp
			 group by dept);
             
	select * from emp
    where name like '%a%' and 
		  name like '%n%';
          
	SELECT * FROM emp
	WHERE dept NOT IN ('IT', 'HR');

	select name, dept, salary from emp
    where (dept, salary) in (
				select  dept, max(salary) from emp
                group by dept);
                
	select * from emp 
    where year(join_date) between 2020 and 2022;
    
    select salary, dept from emp
    where (dept, salary) in (
				select dept, min(salary) from emp
                group by dept
    )
    order by salary;
    
    select * from emp
    where salary between 40000 and 60000;
    
    select name, dept, city from emp
    where city in ('Delhi','Mumbai')
    order by city asc;
    
    select count(name) from emp
    where year(join_date) > 2020;
    
    select dept, salary from emp
    where salary in (
			select avg(salary), dept  from emp
            group by dept
    );
    
	SELECT dept, ROUND(AVG(salary), 2) 'avg_salary'
	FROM emp
	GROUP BY dept;
    
    select * from emp
    where name like '%a';
    
    SELECT DISTINCT dept FROM emp;
    
    SELECT name, dept, salary
	FROM emp e
	WHERE salary = (
		SELECT MAX(salary)
		FROM emp
		WHERE dept = e.dept
	);
    
    select count(name), dept from emp
    group by dept
    having count(name)>2;
    
    select name, dept, year(join_date) from emp
    where year(join_date)
    order by year(join_date);
    
    select * from emp
    where city not in ('Mumbai','Delhi');