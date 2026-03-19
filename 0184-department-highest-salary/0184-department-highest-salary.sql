# Write your MySQL query statement below
SELECT d.name AS department ,
e.name AS Employee,
e.salary AS Salary FROM Employee e
JOIN Department d
ON e.DepartmentId = d.id
WHERE e.salary =(SELECT MAX(salary) FROM Employee WHERE DepartmentId = e.DepartmentId);