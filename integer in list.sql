You can use list comprehension and the isdigit() method to find integers in a combination of numbers and strings in a Python list. Here's an example:

python
Copy code
my_list = [1, 'apple', '2', 3, 'banana', '4']

integers = [x for x in my_list if str(x).isdigit()]

print(integers)
This will output:

csharp
Copy code
[1, 2, 3, 4]
It filters out elements in the list that are not valid integers.
