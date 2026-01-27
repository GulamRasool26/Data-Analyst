-- Unions

Select age, gender
FROM employee_demographics
UNION 
Select first_name, last_name
FROM employee_salary;#bad union

-- Union Distinct
Select first_name, last_name
FROM employee_demographics
UNION #by default Union is distinct
Select first_name, last_name
FROM employee_salary;

-- Union ALL
Select first_name, last_name
FROM employee_demographics
UNION ALL
Select first_name, last_name
FROM employee_salary;


-- Multiple Union with labels
Select first_name, last_name, 'Old MAN' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'male'
UNION
Select first_name, last_name, 'Old Lady' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
Select first_name, last_name, 'Highly paid Employee' AS Label
FROM employee_salary
WHERE salary >70000;

Select first_name, last_name, 'Old MAN' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'male'
UNION
Select first_name, last_name, 'Old Lady' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
Select first_name, last_name, 'Highly paid Employee' AS Label
FROM employee_salary
WHERE salary >70000
Order By first_name, last_name
;