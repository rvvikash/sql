



-- Create employees table
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

-- Insert some sample data into employees table
INSERT INTO employee (employee_id, name, salary)
VALUES (1, 'John Doe', 50000),
       (2, 'Jane Smith', 60000),
       (3, 'Alice Johnson', 70000);

-- Create new_employees table
CREATE TABLE new_employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

-- Insert some sample data into new_employees table
INSERT INTO new_employees (employee_id, name, salary)
VALUES (2, 'Jane Doe', 65000),
       (4, 'Bob Johnson', 75000);
	   
	   
	   
	   -- Perform the MERGE action
MERGE INTO employees AS target
USING new_employees AS source
ON target.employee_id = source.employee_id
WHEN MATCHED THEN
    UPDATE SET target.name = source.name, target.salary = source.salary
WHEN NOT MATCHED THEN
    INSERT (employee_id, name, salary)
    VALUES (source.employee_id, source.name, source.salary);


