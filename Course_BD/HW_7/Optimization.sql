DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
  id serial ,
  table_name varchar(50),
  primary_id int not null,
  fill_name varchar(255),
  date_create datetime default now(),
) COMMENT = 'Таблица логов' ENGINE = Archive;

CREATE DEFINER=`root`@`localhost` TRIGGER `catalogs_log` AFTER INSERT ON `catalogs` FOR EACH ROW begin
	insert into logs(table_name, primary_id, fill_name)
	values ('catalogs', new.id, new.name);
end

CREATE DEFINER=`root`@`localhost` TRIGGER `logs_products` AFTER INSERT ON `products` FOR EACH ROW begin 
	insert into logs(table_name, primary_id, fill_name)
	values ('products', new.id, new.name);
end

CREATE DEFINER=`root`@`localhost` TRIGGER `user_log` AFTER INSERT ON `users` FOR EACH ROW begin
	insert into logs(table_name, primary_id, fill_name)
	values ('users', new.id, new.name);
end