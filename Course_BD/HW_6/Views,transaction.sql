-- Transaction, Views
-- Exer 1

start transaction;

insert into sample.users (id, name , birthday_at)
select id, name , birthday_at
from shop.users
where id = 1;

commit;

-- Exer 2

start transaction;

select p.name, c.name
from products as p
join catalogs as c on p.catalog_id = c.id;

commit;

-- Exer 3


-- Exer 4

start transaction;


prepare stmt from "delete from products order by created_at limit ?";
set @cnt=(select count(*) - 5 from products);
execute stmt using @cnt;

select * from products order by created_at desc;
 
commit;

