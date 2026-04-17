# Write your MySQL query statement below
select customer_id  from Customer c
join Product p 
on c.product_key=p.product_key
GROUP BY c.customer_id having count(distinct p.product_key)>=(SELECT COUNT(*) FROM Product);