-- CTE (COMMON TABLE EXPRESSIONS)
WITH CTE_Example AS 
(
SELECT gender, AVG(salary),
MAX(salary),
MIN(salary),
COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sl
 on dem.employee_id =  sl.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example;

-- CTE with Alias
WITH CTE_Example AS 
(
SELECT gender, AVG(salary) avg_sal,
MAX(salary) max_salary,
MIN(salary) min_salary,
COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sl
 on dem.employee_id =  sl.employee_id
GROUP BY gender
)
SELECT AVG(avg_sal)
FROM CTE_Example;

-- SubQuery VS CTE
select AVG(avg_sal)
FROM(
SELECT gender, AVG(salary) avg_sal,
MAX(salary) max_salary,
MIN(salary) min_salary,
COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sl
 on dem.employee_id =  sl.employee_id
GROUP BY gender
) as example;


-- Multiple CTE with JOINS
WITH CTE_Example AS 
(
SELECT employee_id,gender, birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS 
(
SELECT employee_id , salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2 
 on CTE_Example.employee_id = CTE_Example2.employee_id;
 
-- CTE WITH COLUMN DEFINITION 
WITH CTE_Example (GENDER,AG_SAL, MAX_SAL, MIN_SAL,COUNT_SAL)AS 
(
SELECT gender, 
AVG(salary),
MAX(salary),
MIN(salary),
COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sl
 on dem.employee_id =  sl.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example;
