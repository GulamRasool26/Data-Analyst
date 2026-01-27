-- having vs where
select gender, AVG(age)
FROM  employee_demographics
Group By gender
Having avg(age) > 40;

select occupation, avg(salary)
from employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
having avg(salary) > 75000;