-- STORED PROCEDURES

SELECT *
FROM employee_salary
WHERE salary >= 50000;

# creating proc
CREATE procedure LARGE_SALARIES()
SELECT *
FROM employee_salary
WHERE salary >= 50000;
#calling proc
CALL LARGE_SALARIES();

#create multiple queries
CREATE procedure LARGE_SALARIES2()
SELECT *
FROM employee_salary
WHERE salary >= 50000;
SELECT *
FROM employee_salary
WHERE salary >= 10000; #will not work due to semicolon

#add delimiter for multiple query
DELIMITER %%
CREATE procedure LARGE_SALARIES2()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END %%
DELIMITER ;

CALL LARGE_SALARIES2();


#adding parameters
DELIMITER %%
CREATE procedure LARGE_SALARIES3(p_id INT)
BEGIN
	SELECT salary
	FROM employee_salary
	WHERE employee_id = id ;
END %%
DELIMITER ;

CALL LARGE_SALARIES3(1)

