-- joins

Select *
FROM employee_demographics;

Select *
FROM employee_salary;
-- INNER JOIN BY DEFAULT 
Select *
FROM employee_demographics 
INNER JOIN employee_salary
	on employee_demographics.employee_id = employee_demographics.employee_id;

-- ALIAS WITH JOINS
Select *
FROM employee_demographics as dem
INNER JOIN employee_salary as sl
	on dem.employee_id = sl.employee_id;
    
-- select column from joins
Select dem.employee_id , age , occupation
FROM employee_demographics as dem
INNER JOIN employee_salary as sl
	on dem.employee_id = sl.employee_id;
    
-- left outer joins
Select *
FROM employee_demographics as dem
LEFT JOIN employee_salary as sl
	on dem.employee_id = sl.employee_id;

-- right outer join
Select *
FROM employee_demographics as dem
RIGHT JOIN employee_salary as sl
	on dem.employee_id = sl.employee_id;

-- self join
SELECT * 
FROM employee_salary emp1
 JOIN employee_salary emp2
	on emp1.employee_id = emp1.employee_id;
    
SELECT * 
FROM employee_salary emp1
JOIN employee_salary emp2
	on emp1.employee_id + 1 = emp2.employee_id;
    
SELECT emp1.employee_id AS emp_santa,
 emp1.first_name AS first_name_santa,
  emp1.last_name AS last_name_santa,
  emp2.employee_id AS emp_name,
 emp2.first_name AS first_name_emp,
  emp2.last_name AS last_name_emp
FROM employee_salary emp1
JOIN employee_salary emp2
	on emp1.employee_id + 1 = emp2.employee_id;
    
-- joining multiple tables
Select *
FROM employee_demographics as dem
INNER JOIN employee_salary as sl
	on dem.employee_id = sl.employee_id
INNER JOIN parks_departments as pd
	ON  sl.dept_id = pd.department_id;
SELECT * 
FROM parks_departments;