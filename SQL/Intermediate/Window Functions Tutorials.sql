-- window function 

SELECT gender, AVG(sl.salary) as avg_salary
FROM employee_demographics as dem 
Join employee_salary as sl
 on dem.employee_id = sl.employee_id
group by gender;

-- over Function
SELECT gender, AVG(sl.salary) OVER(partition by gender)
FROM employee_demographics as dem 
Join employee_salary as sl
 on dem.employee_id = sl.employee_id;
 
 SELECT dem.first_name,dem.last_name,gender, AVG(sl.salary) OVER(partition by gender)
FROM employee_demographics as dem 
Join employee_salary as sl
 on dem.employee_id = sl.employee_id;

-- SUM with Over
 SELECT dem.first_name,
dem.last_name,
gender,
SUM(sl.salary) OVER(partition by gender)
FROM employee_demographics as dem 
Join employee_salary as sl
 on dem.employee_id = sl.employee_id;
 
 -- OVER WITH ORDER BY 
SELECT 
dem.employee_id,
dem.first_name,
dem.last_name,
gender,
SUM(sl.salary) OVER(partition by gender ORDER BY dem.employee_id) as Rolling_Total
FROM employee_demographics as dem 
Join employee_salary as sl
 on dem.employee_id = sl.employee_id;
 
 -- rOW NUMBER WITH OVER ORDER BY
 SELECT 
dem.employee_id,
dem.first_name,
dem.last_name,
gender,
sl.salary,
row_number() OVER( partition by gender order by salary DESC)
FROM employee_demographics as dem 
Join employee_salary as sl
 on dem.employee_id = sl.employee_id;
 
-- Rank with Dense Rank 
 SELECT 
dem.employee_id,
dem.first_name,
dem.last_name,
gender,
sl.salary,
row_number() OVER( partition by gender order by salary DESC) AS row_num,
RANK() OVER(partition by gender order by salary desc) AS RANK_NUM ,
DENSE_RANK() OVER(partition by gender order by salary desc) AS DENSE_RANK_NUM
FROM employee_demographics as dem 
Join employee_salary as sl
 on dem.employee_id = sl.employee_id;
