-- CAR TABLE
CREATE TABLE car(
	car_id SERIAL PRIMARY KEY,
	make VARCHAR(100),
	model VARCHAR(100),	
	on_the_market VARCHAR(100),
	year_ INTEGER,
	miles NUMERIC(8,2)
);

-- CUSTOMER TABLE
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	car_id SERIAL,
	FOREIGN KEY(car_id) REFERENCES car(car_id)
);

CREATE TABLE staff(
	staff_id SERIAL PRIMARY KEY,
	staff_type VARCHAR(100),
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

CREATE TABLE car_market(
	sold_id SERIAL PRIMARY KEY,
	amount INTEGER,
	staff_id SERIAL,
	car_id SERIAL,
	customer_id SERIAL,
	used_or_new VARCHAR(100),
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE service_ticket(
	service_ticket_id SERIAL PRIMARY KEY,
	car_id SERIAL,
	customer_id SERIAL,
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE service(
	service_id SERIAL PRIMARY KEY,
	type_of_service VARCHAR(100),
	parts_added VARCHAR(100),
	service_ticket_id SERIAL,
	FOREIGN KEY(service_ticket_id) REFERENCES service_ticket(service_ticket_id)
);

ALTER TABLE service
DROP customer_id