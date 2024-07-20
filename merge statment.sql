



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




from pyspark.sql import SparkSession
from pyspark.sql.functions import col, when, coalesce

# Assuming SparkSession is already created
spark = SparkSession.builder \
    .appName("Merge Example") \
    .getOrCreate()

# Load target and source DataFrames
target = spark.table("employees")  # Replace with your actual target DataFrame
source = spark.table("new_employees")  # Replace with your actual source DataFrame

# Define the merge condition
merge_condition = target["employee_id"] == source["employee_id"]

# Perform the merge operation
merged_df = target.alias("target") \
    .join(source.alias("source"), merge_condition, "outer") \
    .selectExpr(
        "coalesce(target.employee_id, source.employee_id) AS employee_id",
        "coalesce(source.name, target.name) AS name",
        "coalesce(source.salary, target.salary) AS salary"
    ) \
    .withColumn("operation",
                when(target["employee_id"].isNull(), "INSERT")
                .when(source["employee_id"].isNull(), "DELETE")
                .otherwise("UPDATE")) \
    .orderBy("employee_id")

# Save the merged DataFrame back to the target table or another output
merged_df.write.mode("overwrite").saveAsTable("employees_merged")

# Stop the SparkSession (if not using interactive shell)
spark.stop()



