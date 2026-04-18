# Write your MySQL query statement below
select s.name from SalesPerson s left join Orders o
on s.Sales_id =o.Sales_id and o.com_id =
(select com_id from Company where name='RED')
where o.Sales_id is  null;