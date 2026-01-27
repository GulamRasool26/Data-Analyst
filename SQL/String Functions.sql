-- STRING fUNCTIONS

SELECT LENGHT('SKYFALL');

SELECT first_name, length(first_name)
FROM employee_demographics
order by 2;

-- upper lower func

SELECT upper('SKYFALL');
SELECT Lower('SKYFALL');

SELECT first_name, upper(first_name)
FROM employee_demographics;


-- TRIM DEAL SPACES
SELECT TRIM('     SKY     ');
SELECT LTRIM('     SKY     ');
SELECT RTRIM('     SKY     ');

-- SUBSTRINGS 

select first_name, LEFT(first_name,4) #it give only four char from left
FROM employee_demographics;

select first_name, Right(first_name,4) #it give only four char from left
FROM employee_demographics;

select first_name, 
LEFT(first_name,4),
Right(first_name,4),
Substring(first_name,3,2) #it split at 3rd position and take 2 char
FROM employee_demographics;

select first_name, 
LEFT(first_name,4),
Right(first_name,4),
Substring(first_name,3,2),
birth_date,
Substring(birth_date,6,2) as birth_month #it split at 3rd position and take 2 char
FROM employee_demographics;

-- replace 

SELECT first_name , replace(first_name, 'a', 'z') as new_name 
# replace every 'a' in first name with 'z'
FROM employee_demographics;

-- locate 

Select first_name , Locate('a', first_name) as location
From employee_demographics;

-- concatenation 

SELECT first_name, last_name, 
concat(first_name,' ' ,last_name) as full_name
From employee_demographics;
