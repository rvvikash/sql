CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    manager_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);


INSERT INTO employees (employee_id, first_name, last_name, manager_id, salary) VALUES
(1, 'John', 'Doe', NULL, 150000.00),   -- CEO, no manager
(2, 'Jane', 'Smith', 1, 120000.00),    -- Manager, reports to John
(3, 'Alice', 'Johnson', 1, 110000.00), -- Manager, reports to John
(4, 'Bob', 'Brown', 2, 90000.00),      -- Employee, reports to Jane
(5, 'Charlie', 'Davis', 2, 95000.00),  -- Employee, reports to Jane
(6, 'Eva', 'White', 3, 85000.00),      -- Employee, reports to Alice
(7, 'Frank', 'Green', 3, 88000.00);    -- Employee, reports to Alice

select * from employees

who is the ceo ?

select concat(first_name,' ',last_name) from employees where manager_id is null

who is the manger of bob brown.

wrong see why ?--select b.concat(first_name,' ',last_name) from employees a
inner join employees b
on a.employee_id=b.manager_id
where a.concat(first_name,' ',last_name)='Bob Brown'--wrong see why ?

SELECT CONCAT(b.first_name, ' ', b.last_name) AS manager_name
FROM employees a
INNER JOIN employees b ON a.manager_id = b.employee_id
WHERE CONCAT(a.first_name, ' ', a.last_name) = 'Bob Brown';


full outer join concept imported video
https://www.youtube.com/watch?v=KQfWd6V3IB8&ab_channel=AnkitBansal

Cross Join:

The comma , between orders and order_counts in the FROM clause performs a cross join (Cartesian product). 
In a cross join, each row from the first table (orders in this case) is combined with each row from the
second table (order_counts).


Well, by writing p1.topping_name < p2.topping_name, it ensures that the second topping's name (p2.topping_name) '
comes after first topping's name (p1.topping_name). Isn't this cool? 

Where Clause (WHERE a.topping_name < b.topping_name):
SELECT a.*, b.*
FROM pizza_toppings a
CROSS JOIN pizza_toppings b,
pizza_toppings c
WHERE a.topping_name < b.topping_nam

This condition filters the results to ensure that only combinations where a.topping_name is less than b.topping_name are included in the result set. This helps to prevent duplicate combinations
where toppings are swapped (e.g., Pepperoni, Sausage and Sausage, Pepperoni).


INNER JOIN = CROSS JOIN + Matched Rows




