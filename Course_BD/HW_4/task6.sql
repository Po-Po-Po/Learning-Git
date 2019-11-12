
 -- Exercise 1 	
 -- my user have id 1		
 select from_user_id 
 from messages 
 where to_user_id = 1 and from_user_id in (
			select id
			from users
			where id in ((select initiator_user_id
			from friend_requests
			where target_user_id = 1 and status = 'approved') union (select target_user_id
			from friend_requests
			where initiator_user_id = 1 and status = 'approved'))
 )
 group by from_user_id
 order by from_user_id
 limit 1;

-- Exercise 2

select count(*) as amount_likes
from likes
where user_id in (select user_id from profiles where timestampdiff(year, birthday, now()) < 10 );

-- Exercise 3

select count(*), 'm' as 'gender'
from likes 
where user_id in (select user_id from profiles where gender = 'm')
union
select count(*), 'f' as 'gender'
from likes 
where user_id in (select user_id from profiles where gender = 'f')
order by gender
limit 1;
