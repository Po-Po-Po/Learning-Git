DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;

create table users(
	id serial primary key,
	name varchar(20)
);