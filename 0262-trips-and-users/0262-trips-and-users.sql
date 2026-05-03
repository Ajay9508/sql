# Write your MySQL query statement below
select t.request_at as Day,
round(
    sum(if(t.status != 'completed',1,0))/
    count(*),
    2
) as "Cancellation Rate"
 from Trips t
 join Users c on t.client_id = c.users_id and c.banned ='No' 
join Users u on t.driver_id = u.users_id AND u.banned = 'No'
where t.request_at between '2013-10-01' and '2013-10-03'
group by t.request_at;