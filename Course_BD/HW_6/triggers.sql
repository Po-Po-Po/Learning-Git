-- triggers, function, procedure
-- Exer 1

drop function if exists hello;
create function hello()
returns text deterministic
begin
DECLARE res text;
if (time(now()) < '12:00:00' && time(now()) > '06:00:00') then
set res = 'Доброе утро';
end if;
if (time(now()) < '18:00:00' && time(now()) > '12:00:00') then
set res = 'Добрый день';
end if;
if (time(now()) < '24:00:00' && time(now()) > '18:00:00') then
set res = 'Добрый вечер';
end if;
if (time(now()) < '06:00:00' && time(now()) > '00:00:00') then
set res = 'Доброй ночи';
end if;
return res;
end//

-- Exer 2
drop trigger if exists check_products//
create trigger check_products before insert on products
for each row
begin
	if (new.name is null && new.description is null) then
		signal sqlstate '45001' set message_text = 'INSERT canceled';
	end if;
	set new.name = new.name;
	set new.description = new.description;
end//

-- Exer 3
drop function if exists my_fibonacci;
create function my_fibonacci(input_number int)
returns int deterministic
begin 
	declare counter, one, two int;
	set two = 1;
	if input_number = 1 then 
		set two = 1;
	end if;
	if input_number = 0 then 
		set two = 0;
	end if;
	if input_number > 2 then 
		set counter = 3;
		set one = 1;
		while input_number >= counter do
			set two = one + two;
			set one = two - one;
			set counter = counter + 1;
		end while;
	end if;
	return two;
end//
