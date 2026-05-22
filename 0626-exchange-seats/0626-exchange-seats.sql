# Write your MySQL query statement below
select 
case 
    when id%2 = 1 and id+1 <=(select count(*) from Seat)
    then id+1
when id%2 = 0
    then id-1 
    else id
    end id, student from Seat
    order by id;