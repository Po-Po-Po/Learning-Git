
-- Exercise 1


select name, id
from users
where id in (select user_id from orders);

-- Exercise 2


select name, description, (select name from catalogs where catalogs.id = products.catalog_id) as catalogs
from products;

-- Exercise 3


select finally.`name` as flights_from, cities.`name` as flights_to
from (select c.name, f.`from`, f.`to`
		from cities as c
		join flights as f on f.`from` = c.label) as finally
join cities on finally.`to` = cities.label;


