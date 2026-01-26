select * 
from parks_and_recreation.employee_demographics;

#PEMDAS is priority order for MySQL
select age + 10
from parks_and_recreation.employee_demographics;

select (age+10) *10
from parks_and_recreation.employee_demographics;


select first_name, last_name, birth_date
from parks_and_recreation.employee_demographics;


select distinct gender
from parks_and_recreation.employee_demographics;