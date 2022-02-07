INSERT INTO
	car (car_id, make, model, on_the_market, year_, miles)
VALUES 
	(2, 'Ford', 'Fiesta', 'False', 2010, 20000),
	(3, 'Ford', 'Mustang', 'True', 2016, 0),
	(4, 'Ford', 'Explorer', 'False', 2020, 0),
	(5, 'Ford', 'Transit', 'True', 2019, 0),
    (6, 'Ford', 'Escape', 'True', 2014, 60000),
	(7, 'Ford', 'Flex', 'False', 2013, 90000);

SELECT *
FROM car

INSERT INTO
	customer
VALUES
	(1, 'Daffy', 'Duck', 5),
	(2, 'Ryan', 'Hannedy', 2),
	(4, 'Josh', 'Ryan', 4),
	(7, 'Bacon', 'Eggs', 7);
	
SELECT *
FROM customer

INSERT INTO 
	staff
VALUES
	(1, 'sales', 'Michael', 'Scott'),
	(2, 'mechanic', 'Paul', 'Walker');
	
SELECT *
FROM staff
	
INSERT INTO	
	car_market
VALUES
	(1, 50000,1,5,1,'New'),
	(12, 40000,2,1,2,'New');
	
	
SELECT *
FROM car_market
	
INSERT INTO
	service_ticket
VALUES
	(1,2,2),
	(2,4,4),
	(3,7,7);
	
SELECT *
FROM service_ticket
	
INSERT INTO
	service
VALUES
	(1,'Oil change', null, 1),
	(2,'Tire Change', 'Front tires', 2),
	(3,'Cosmetic', 'Flame Stickers',3);
	
SELECT *
FROM service

------------------
-- Added functions
------------------

CREATE OR REPLACE FUNCTION add_car(
	_car_id INTEGER,
	_make VARCHAR,
	_model VARCHAR,
	_on_the_market VARCHAR,
	_year INTEGER,
	_miles NUMERIC
)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO car(car_id,make,model,on_the_market,year_,miles)
	VALUES(_car_id,_make,_model,_on_the_market,_year,_miles);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_car(27,'Toyota','Corolla','True',1999,80000)

SELECT *
FROM car

--Hire staff function

CREATE OR REPLACE FUNCTION hire_staff(
	_staff_id INTEGER,
	_staff_type VARCHAR,
	_first_name VARCHAR,
	_last_name VARCHAR
)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO staff(staff_id,staff_type,first_name,last_name)
	VALUES(_staff_id,_staff_type,_first_name,_last_name);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT hire_staff(3,'Sign Spinner Guy', 'Albert', 'Albertson')

SELECT *
FROM staff


