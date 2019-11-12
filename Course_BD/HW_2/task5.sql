-- Задание 1 
-- Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем. 

drop table if exists users; 

create table users( 
id serial primary key, 
firstname varchar(50), 
lastname varchar(50), 
created_at datetime default now(), 
updated_at datetime default now() 
); 

insert into users (firstname, lastname, created_at, updated_at) 
values ('Jimmy', 'Hendriks', now(), now()), 
('Danny', 'Wolf', now(), now()); 

-- Задание 2 
-- Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них 
-- долгое время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, 
-- сохранив введеные ранее значения. 
drop table if exists users; 

create table users( 
id serial primary key, 
firstname varchar(50), 
lastname varchar(50), 
created_at varchar(50), 
updated_at varchar(50) 
); 


insert into users (firstname, lastname, created_at, updated_at) 
values ('Jimmy', 'Hendriks', '20.10.2017 10:50', default), 
('Bob', '1', '25.02.2018 10:50', default); 

update users 
set created_at = STR_TO_DATE(created_at , '%d.%m.%Y %k:%i') 
where created_at is not null; 

ALTER TABLE youtube.users MODIFY COLUMN created_at DATETIME DEFAULT CURRENT_TIMESTAMP; 
ALTER TABLE youtube.users MODIFY COLUMN updated_at DATETIME; 

-- Задание 3 
-- В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. 
-- Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей. 
drop table if exists valuess; 

create table valuess( 
id serial primary key, 
value int 
); 

insert into valuess(value) 
values (4), 
(-2), 
(3), 
(-1), 
(-5); 
 

select `value`, if(`value` > 0 , 0, 1) as formatted 
from `valuess` 
order by formatted, `value`; 

-- Задание 4 
-- Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий 
-- ('may', 'august') 

insert into users (firstname, lastname, created_at, updated_at) 
values ('Miky', '2', '2017-08-12 15:36', now()), 
('Franky', 'Perl', '2015-05-23 11:00', now()); 

select firstname, lastname 
from users 
where DATE_FORMAT(created_at, '%M') = 'May' or DATE_FORMAT(created_at, '%M') = 'August'; 

-- Задание 5 
-- Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
-- Отсортируйте записи в порядке, заданном в списке IN. 

select * 
from users 
where id in (3,1,2) 
order by field(id,3,1,2); 

-- Часть 2 Задание 1 
-- Подсчитайте средний возраст пользователей в таблице users 

select AVG(floor(to_days(now()) - to_days(created_at)) / 365.25) as avg_age 
from users; 

-- Задание 2 
-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения 

insert into users (firstname, lastname, created_at, updated_at) 
values('bobby', '4', '2011-04-15 20:00', now()), 
('Tommy', '5', '2010-11-01 11:00', now()); 

drop table if exists day_of_month;
create table day_of_month(
	id serial primary key,
	name_day varchar(50)
);

insert into day_of_month(name_day)
values ('0'),
('1'),
('2'),
('3'),
('4'),
('5'),
('6');

select count(*), date_format(created_at, '%W') as day_of_week, DATE_ADD(created_at, interval year(now()) - year(created_at) year) as final_date
from users 
group by date_format(final_date, '%W')
order by day_of_week; 

-- Задание 3 
-- Подсчитайте произведение чисел в столбце таблицы 

select (case 
			when 
				sum(case when value = 0 then 1 else 0 end) > 0 then 0
			else  
				round(exp(sum(log(abs(value))))) * if ((select count(*) from valuess where value < 0 ) % 2 = 1, -1 , 1 )
			end) as compos
from valuess;
