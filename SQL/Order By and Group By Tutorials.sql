-- GROUP BY

SELECT GENDER , AVG(age)
FROM employee_demographics
group by GENDER;

SELECT OCCUPATION 
FROM employee_salary
group by occupation;


-- AGGREGATRE FUNC
SELECT 
    GENDER, AVG(age),MAX(age)
FROM
    employee_demographics
GROUP BY GENDER;

SELECT 
    GENDER, AVG(age),MAX(age), count(AGE)
FROM
    employee_demographics
GROUP BY GENDER;


-- order by
SELECT *
FROM employee_demographics
ORDER BY first_name;

-- combine order by 
SELECT *
FROM employee_demographics
ORDER BY gender, age ;

-- order by column number
SELECT *
FROM employee_demographics
ORDER BY 5, 4 ;

