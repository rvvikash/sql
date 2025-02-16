



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


-- Update existing records
UPDATE target
SET target.name = source.name,
    target.salary = source.salary
FROM target
JOIN new_employees source
ON target.employee_id = source.employee_id;

-- Insert new records
INSERT INTO target (employee_id, name, salary)
SELECT source.employee_id, source.name, source.salary
FROM new_employees source
LEFT JOIN target
ON source.employee_id = target.employee_id
WHERE target.employee_id IS NULL;




from delta.tables import DeltaTable

# Load the target table (existing employees)
target_table = DeltaTable.forPath(spark, "/mnt/data/employees")

# Load the source DataFrame (new updates & new employees)
source_df = spark.read.format("parquet").load("/mnt/data/new_employees")

# Perform the MERGE operation
target_table.alias("target").merge(
    source_df.alias("source"),
    "target.employee_id = source.employee_id"
).whenMatchedUpdate(set={
    "name": "source.name",
    "salary": "source.salary"
}).whenNotMatchedInsert(values={
    "employee_id": "source.employee_id",
    "name": "source.name",
    "salary": "source.salary"
}).execute()



