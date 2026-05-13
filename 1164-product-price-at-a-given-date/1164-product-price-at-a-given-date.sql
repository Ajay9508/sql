# Write your MySQL query statement below
select p.product_id,
COALESCE((
    SELECT pr.new_price
    from Products pr
    where pr.product_id = p.product_id
    and pr.change_date <= '2019-08-16'
    order by pr.change_date desc
    limit 1
),10) as price
from Products p
group by p.product_id
order by p.product_id asc;