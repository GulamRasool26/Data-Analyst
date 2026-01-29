-- Trigger n Events

#check tables data
SELECT *
FROM employee_salary;

SELECT *
FROM employee_demographics;

#Create Trigger
DELIMITER $$
CREATE TRIGGER employee_insert 
	AFTER insert ON employee_salary
    FOR EACH ROW 
BEGIN
INSERT INTO employee_demographics(employee_id,first_name,last_name)
VALUES(NEW .employee_id,NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

#Check Trigger
INSERT INTO employee_salary(employee_id,first_name, last_name,occupation,
salary, dept_id)
VALUES (13,'Gualm ', 'Rasool','Data Analyst','100000',NULL);

-- EVENTS
SELECT *
FROM employee_demographics;

#Create Events
DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
    FROM employee_demographics
    WHERE age>=60;
END $$
DELIMITER ;

SELECT * 
FROM employee_demographics
WHERE age>=60;

#Check Event Scheduler
SHOW variables LIKE 'event%';

