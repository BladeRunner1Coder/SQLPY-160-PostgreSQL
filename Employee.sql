CREATE TABLE IF NOT EXISTS Employee (
	employee_id SERIAL PRIMARY KEY,
	employee_name VARCHAR(80) NOT null,
	department VARCHAR(80),
	manager integer
);

ALTER TABLE Employee 
ADD CONSTRAINT fk_employee_manager
FOREIGN KEY (manager) REFERENCES Employee(employee_id);
