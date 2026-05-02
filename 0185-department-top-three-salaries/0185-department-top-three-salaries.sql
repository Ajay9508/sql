# Write your MySQL query statement below
select  d.name as Department,
e.name as Employee,
e.salary as Salary
from Employee e
join Department d
on e.departmentId = d.id
where(

    select count(distinct e2.salary) from Employee e2
    where departmentId = e.departmentId
    and e2.salary>e.salary
    order by salary desc 
)<3
order  by department, salary desc;