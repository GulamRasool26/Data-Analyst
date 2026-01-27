-- Case statments 

select first_name,
last_name,
age,
CASE
	WHEN age<= 30 THEN 'Young'
END 
FROM employee_demographics;

-- multiple when

select first_name,
last_name,
age,
CASE
	WHEN age<= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'old'
	WHEN age >  50 THEN 'On Death Door'
END AS Age_Bracket
FROM employee_demographics;

-- Pay Increase AND bONUS
-- < 50000 =  5%
-- > 50000 = 7%
-- FINANCE = 10% Bonus
Select first_name ,
last_name,
salary,
CASE 
 WHEN salary < 50000 THEN salary + (salary * 0.05)
 WHEN salary > 50000 THEN salary + (salary * 0.07)
END AS increase_salary,
CASE 
 WHEN dept_id = 6 THEN salary *1.10
END AS BONUS
FROM employee_salary;
