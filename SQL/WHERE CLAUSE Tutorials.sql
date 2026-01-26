-- where Clause

#for string
select *
FROM employee_salary
WHERE first_name = 'Leslie';

#Comparison Operators
select *
FROM employee_salary
WHERE salary >= 50000;

select *
FROM employee_salary
WHERE salary <= 50000;

#boolean Operators [NOT , AND, OR]
select *
FROM employee_demographics
WHERE gender != 'Female'; 

#Date Format
select *
FROM employee_demographics
WHERE birth_date > '1985-01-01';

select *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male';

select *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'male';

select *
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55;

-- LIKE 
-- (%) any
-- (_) something
select *
FROM employee_demographics
Where first_name LIKE 'a%';

select *
FROM employee_demographics
Where first_name LIKE 'a__';

select *
FROM employee_demographics
Where first_name LIKE 'a___';

select *
FROM employee_demographics
Where birth_date LIKE '1985%';