copy the data format without copying data


new_table is the name of the new table you want to create.
original_table is the name of the original table whose structure you want to copy.

SELECT * selects all columns from the original table.
WHERE 1 = 0 

ensures that no rows are selected (since 1 is never equal to 0), but the structure of the selected columns remains intact.
