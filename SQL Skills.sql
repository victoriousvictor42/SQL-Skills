-- Write a SQL query to create WORKER Table
CREATE TABLE worker(
worker_id INT NOT NULL PRIMARY KEY,
first_name VARCHAR(25),
last_name VARCHAR(25),
salary INT,
joining_date DATETIME,
department VARCHAR(25));

-- Write a SQL Query to insert values in WORKER Table
INSERT INTO worker (
worker_id, first_name, last_name, salary, joining_date, department) VALUES
(1, 'Siddharth', 'Singh', 80000, '2019-03-20 09:00:00', 'HR'),
(2, 'Lavesh', 'Ahir', 300000, '2019-07-11 09:00:00', 'Admin'),
(3, 'Abhishek', 'Midha', 500000, '2019-03-20 09:00:00', 'HR'),
(4, 'Rahul', 'Mahar',200000, '2019-03-20 09:00:00', 'Admin'),
(5, 'Saurabh', 'Madavi', 90000, '2019-07-11 09:00:00', 'Admin'),
(6, 'Aman', 'Nain', 75000, '2019-07-11 09:00:00','Account'),
(7, 'Vaibhav', 'Varshney', 100000, '2019-02-20 09:00:00', 'Account'),
(8, 'Farhaan', 'Majied', 500000, '2019-05-11 09:00:00', 'Admin');

-- Write a SQL Query to create table Title which has WORKER_REF_ID 
-- as foreign key
CREATE TABLE title(
worker_ref_id INT NOT NULL PRIMARY KEY,
worker_title VARCHAR(25),
affected_from DATETIME,
FOREIGN KEY (worker_ref_id)
REFERENCES worker(worker_id)
 ON DELETE CASCADE);

-- Write a SQL Query to insert values in TITLE Table
INSERT INTO title(
worker_ref_id, worker_title, affected_from) VALUES
(1, 'Manager', '2021-02-20 00:00:00'),
(2, 'Executive', '2021-06-11 00:00:00'),
(8, 'Executive', '2021-06-11 00:00:00'),
(5, 'Manager', '2021-06-11 00:00:00'),
(4, 'Asst. Manager', '2021-06-11 00:00:00'),
(7, 'Executive', '2021-06-11 00:00:00'),
(6, 'Lead', '2021-06-11 00:00:00'),
(3, 'Lead', '2021-06-11 00:00:00');

-- Write a SQL Query to insert values in JOB GRADE Table
CREATE TABLE job_grade(
grade_level VARCHAR(25),
lowest_sal INT,
highest_sal INT);

-- Write a SQL Query to insert values in JOB GRADE Table
INSERT INTO job_grade (
grade_level, lowest_sal, highest_sal) VALUES
('A', 10000, 75999),
('B', 76000, 80999),
('C', 81000, 99999),
('D', 100000, 199999),
('E', 200000, 299999),
('F', 300000, 600000);

-- Write a SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT upper(first_name) 
FROM worker;

-- Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT department
FROM worker;

-- Write a SQL query to print the FIRST_NAME from Worker table after replacing 'a' with 'A'
SELECT REPLACE(first_name,'a','A')
FROM worker;

-- Write a SQL query to print the FIRST_NAME and LAST_NAME
-- from Worker table into a single column COMPLETE_NAME. A
-- space char should separate them.
SELECT CONCAT(first_name, ' ', last_name)
FROM worker;

-- Write a SQL query to print all Worker details from the Worker table
-- order by FIRST_NAME Ascending.
SELECT * 
FROM worker
ORDER BY first_name ASC;

-- Write a SQL query to print all Worker details from the
-- Worker table order by FIRST_NAME Ascending and
-- DEPARTMENT Descending.
SELECT *
FROM worker
ORDER BY first_name ASC, department DESC;

-- Write a SQL query to print details for Workers with the first
-- name as “Rahul” and “Lavesh” from Worker table.
SELECT *
FROM worker
WHERE first_name = 'Rahul' OR first_name = 'Lavesh';

-- Write a SQL query to print details of workers excluding first
-- names, “Rahul” and “Lavesh” from Worker table.
SELECT *
FROM worker
WHERE first_name NOT IN ('Rahul', 'Lavesh');

-- Write a SQL query to print details of the Workers whose
-- FIRST_NAME starts with 'S'
SELECT *
FROM worker
WHERE first_name LIKE 'S%';

-- Write a SQL query to print details of the Workers whose
-- FIRST_NAME contains 'a'
SELECT *
FROM worker 
WHERE first_name LIKE '%a%';

-- Write a SQL query to print details of the Workers whose
-- FIRST_NAME ends with 'n’.
SELECT *
FROM worker
WHERE first_name LIKE '%n';

-- Write a SQL query to print details of the Workers whose
-- FIRST_NAME ends with ‘l’ and contains five alphabets.
SELECT *
FROM worker
WHERE first_name LIKE '____l';

-- Write a SQL query to print details of the Workers whose SALARY lies
-- between 100000 and 500000.
SELECT *
FROM worker
WHERE salary BETWEEN 100000 AND 500000;

-- Write a SQL query to print details of the Workers who have
-- joined in Mar’2019.
SELECT * 
FROM worker
WHERE year(joining_date) = 2019 and month(joining_date) = 3;

-- Write a SQL query to show the current date and time.
SELECT CURDATE(); -- Returns the current date
SELECT now(); -- returns the current date and time

-- Write a SQL query to fetch the count of employees working in the
-- department 'Admin'
SELECT COUNT(*)
FROM worker
WHERE department = 'Admin';

-- Write a SQL query to fetch the no. of workers for each
-- department in the descending order.
SELECT department, count(worker_id) no_of_workers
FROM worker
GROUP BY 1
ORDER BY no_of_workers DESC;

-- Write a SQL query to fetch departments along with the total
-- salaries paid for each of them.
SELECT department, SUM(salary) AS total_salary
FROM worker
GROUP BY 1;

-- Write a SQL query to show all departments along with the
-- number of people in there.
SELECT department, count(department) AS 'number of workers'
from worker
GROUP BY 1;

-- Write a SQL query to fetch the departments that have less than five
-- people in it.
SELECT department, count(worker_id) no_of_workers
FROM worker
GROUP BY 1
HAVING count(worker_id) < 5;

-- Write a SQL query to show one row twice in results from a
-- table with department 'HR'.
SELECT first_name, department
FROM worker AS w
WHERE w.department = 'HR'
UNION ALL
SELECT first_name, department
FROM worker AS w1
WHERE w1.department ='HR';

-- Write a SQL query to fetch the names of workers who earn
-- the highest salary.
SELECT first_name, salary 
FROM worker
WHERE salary = (
SELECT max(salary)
FROM worker);

-- Write a SQL query to show the second highest salary from a
-- table.
SELECT max(salary)
FROM worker
WHERE salary NOT IN  (
SELECT max(salary) 
FROM worker);

-- Write a SQL query to show the top n (say 5) records of a table
SELECT * 
FROM worker
ORDER BY salary DESC
LIMIT 5;

-- Write a SQL query to determine the nth (say n=3) highest
-- salary from a table.
SELECT salary
FROM worker
ORDER BY salary DESC
LIMIT 2,1;

-- Write a SQL query to print details of the Workers who are also
-- Managers.
SELECT DISTINCT w.first_name, t.worker_title
FROM worker w
INNER JOIN title t
ON w.worker_id = t.worker_ref_id
AND t.worker_title IN ('Manager');

-- Write a SQL query to find the first name, last name, salary,
-- and job grade for all employees.
SELECT w.first_name, w.last_name, w.salary, j.grade_level
FROM worker w
JOIN job_grade j
ON w.salary
BETWEEN j.lowest_sal AND j.highest_sal;

-- Write a SQL query to compute the average salary of
-- Workers for each job title.
SELECT worker_title, avg(salary)
FROM worker
JOIN title
ON worker.worker_id = title.worker_ref_id
GROUP BY worker_title;

-- Write a SQL query to print the name of employees having the
-- highest salary in each department
SELECT t.department,t.first_name,t.Salary 
FROM (
SELECT max(Salary) as TotalSalary, department
FROM Worker
group by department) as TempNew
INNER JOIN Worker t 
ON TempNew.department = t.department
and TempNew.TotalSalary = t.Salary;

-- Write a SQL query to create a view for those Worker
-- belonging to the Department 'HR'
CREATE VIEW hrstaff
AS SELECT *
FROM Worker
WHERE department = 'HR';
