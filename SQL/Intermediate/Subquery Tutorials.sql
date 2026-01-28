-- Subqueries

SELECT *
from employee_demographics
where employee_id IN 
				(SELECT employee_id 
						FROM employee_salary
                        WHERE dept_id = 1);
-- Subquery in SELECT
SELECT first_name, salary, 
(select avg(salary)
FROM employee_salary) 
FROM employee_salary;


-- SUBQUERY IN from 
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
group by gender;


SELECT *
from(SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
group by gender) AS AGG_Tablee;

-- Calling Column from Subquery
SELECT  AVG(`MAX(age)`)
from(SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
group by gender) AS AGG_Tablee;

-- Using Alais to call column 
SELECT  AVG(max_age)
from(SELECT gender,
AVG(age) as avg_age,
MAX(age) as max_age,
MIN(age) as min_age,
COUNT(age) as num_age
FROM employee_demographics
group by gender) AS AGG_Tablee;