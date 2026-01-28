-- TEMPORARY TABLE

#create new temp table
CREATE temporary table temp_table
(first_name varchar(50),
last_name varchar(50),
favourite_movie varchar(100)
);
#showing empty table
SELECT *
FROM temp_table;
#inserting date into the temp table
INSERT INTO temp_table
VALUES('Gulam', 'Rasool', 'Spider Man');


SELECT *
FROM employee_salary;
#creating temporary table from existing table
CREATE TEMPORARY TABLE salary_over_50k
SELECT * 
FROM employee_salary
WHERE salary >=50000;
# will show data of the above the query
SELECT *
FROM salary_over_50k;