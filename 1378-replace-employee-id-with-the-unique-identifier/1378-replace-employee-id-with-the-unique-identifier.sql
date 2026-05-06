# Write your MySQL query statement below
select u.unique_id,E.name from Employees E
left join EmployeeUNI u on E.id=u.id;