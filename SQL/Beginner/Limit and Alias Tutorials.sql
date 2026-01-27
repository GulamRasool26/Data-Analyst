-- limit & aliasing 
SELECT * 
FROM employee_demographics
ORDER BY age DESC
limit 3;
-- START WITH END 
SELECT * 
FROM employee_demographics
ORDER BY age DESC
limit 2,1;

-- ALIAS

SELECT occupation, avg(salary) AS AVERAGE
FROM employee_salary
GROUP BY occupation;
