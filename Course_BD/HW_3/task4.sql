-- Zapolnenie BD Youtube

create databases youtube;
use youtube;

create table `users`(
	id serial primary key,
	firstname varchar(30),
	lastname varchar(30),
	email varchar(30) unique,
	phone varchar(50), 
    INDEX users_phone_idx(phone),
    INDEX users_firstname_lastname_idx(firstname, lastname)
);


INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `phone`) 
VALUES ('1', 'James', 'Taylor', 'J.Tayor@example.net', '+(100)111'),
('2', 'Nill', 'Yang', 'N.Yang@example.org', '+(100)222'),
('3', 'Elton', 'John', 'E.John@example.org', '+(100)333'),
('4', 'Vann', 'Morison', 'V.Morison@example.org', '+(100)444'),
('5', 'Fats', 'Domino', 'F.Domino@example.org', '+(100)555'),
('6', 'Johny', 'Cash', 'J.Cash@example.org', '+(100)666'),
('7', 'Jimmy', 'Hendrix', 'J.Hendrix@example.org', '+(100)777'),
('8', 'Michael', 'Jackson', 'M.Jackson@example.org', '+(100)888'),
('9', 'James', 'Brown', 'J.Brown@example.org', '+(100)999'),
('10', 'Al', 'Green', 'A.Green@example.org', '+(100)000')
;

CREATE TABLE `profiles` (
	user_id SERIAL PRIMARY KEY,
	user_login varchar(20),
	user_password varchar(20),
    gender CHAR(1),
    birthday DATE,
	photo_id BIGINT UNSIGNED NULL,
    data_registration DATETIME DEFAULT NOW(),
    country VARCHAR(30),
    FOREIGN KEY (user_id) REFERENCES users(id)
    	ON UPDATE CASCADE 
);

insert into `profiles` (user_id, user_login, user_password, gender, birthday, photo_id, data_registration, country)
values ('2', 'Nill.Ya', '123456789', 'M', '1968-01-11', 244562, now(), 'Argentina'),
('3', 'John.El', '123456789', 'M', '1956-10-22', 244345, now(), 'Colombia'),
('1', 'Taylor.J', '123456789', 'W', '1970-11-05', 111222, now(), 'Peru'),
('4', 'Morison.V', '123456789', 'M', '1980-08-02', 232312, now(), 'Chile'),
('5', 'Domino.F', '123456789', 'M', '1956-10-22', 244345, now(), 'Colombia'),
('6', 'Cash.J', '123456789', 'M', '1956-10-22', 244345, now(), 'Colombia'),
('7', 'Hendrix.J', '123456789', 'M', '1956-10-22', 244345, now(), 'Colombia'),
('8', 'Jackson.M', '123456789', 'M', '1956-10-22', 244345, now(), 'Colombia'),
('9', 'Brown.J', '123456789', 'M', '1956-10-22', 244345, now(), 'Colombia'),
('10', 'Green.Al', '123456789', 'M', '1956-10-22', 244345, now(), 'Colombia');

drop table if exists comments;
CREATE TABLE comments (
	id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL,
	video_id bigint unsigned not null,
    body TEXT,
    created_at DATETIME DEFAULT NOW(), 
    INDEX comments_from_user_idx(from_user_id),
    FOREIGN KEY (from_user_id) REFERENCES users(id),
    foreign key (video_id) references videos(video_id)
);

insert into comments(from_user_id, video_id, body)
values ('5', '1', '� ������ eminem\'a �� ������� � �����?! ������� �������'),
('7', '1', '� ��� ���������� �����!'),
('4', '2', '�������� �����, �������� �������� � ��� � ������� �� ��������'),
('6', '6', '����� ���, �� ����'),
('1', '4', '������ ����, ��� ����� ������� ������ Burj Khalifa');



drop table if exists videos;
create table videos(
	video_id serial primary key,
	name varchar(200) unique,
	date_of_create datetime default now(),
	user_id bigint unsigned not null,
	likes int unsigned default 0,
	dislikes int unsigned default 0,
	views bigint unsigned default 0,
	foreign key (user_id) references users(id)
);

insert into videos(name, user_id)
values ('���-���� 2018 ����', '2'),
('��� �������� ��������������', '3'),
('������ ������ � ������', '2'),
('�������� ����� ������� ������', '5'),
('������������� �������� � �������� �����', '4'),
('������������ ���������', '10');



drop table if exists channels;
create table channels(
	channel_id serial primary key,
	chanel_name varchar(100),
	date_of_create datetime default now(),
	video bigint unsigned not null,
	follows bigint unsigned,
	host_id bigint unsigned not null unique,
	foreign key (host_id) references users(id),
	foreign key (video) references videos(video_id)
);

