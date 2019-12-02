drop database youtube;
create database youtube;
use youtube;

create table `users`(
	id serial primary key,
	firstname varchar(30),
	lastname varchar(30),
	email varchar(30) unique,
	index users_firstname_lastname_idx(firstname)
);

insert into `users` (firstname, lastname, email)
values ('Tommy', 'Gun', 'T.Gun@gmail.com'),
('Jimmy', 'Rearm', 'J.Rearm@gmail.com'),
('Charles', 'Darvin', 'C.Darvin@gmail.com'),
('James', 'Uat', 'J.Uat@gmail.com'),
('Bob', 'Dilan', 'B.Dilan@gmail.com'),
('Chak', 'Berry', 'C.Berry@gmail.com'),
('Jimmy', 'Hendrix', 'J.Hendrix@gmail.com'),
('Led', 'Zeppelin', 'L.Zeppelin@gmail.com'),
('Ray', 'Charles', 'R.Charles@gmail.com'),
('Sam', 'Kuk', 'S.Kuk@gmail.com'),
('Pink', 'Floyd', 'P.Floyd@gmail.com');

drop table if exists `profiles`;
create table `profiles`(
	user_id serial primary key,
	user_login varchar(20),
	user_password varchar(20),
	gender char(1),
	birthday date,
	photo_id bigint unsigned null,
	data_registration datetime default now(),
	country varchar(30),
	foreign key (user_id) references `users`(id)
	 	on update cascade
	 	on delete cascade
);

insert into `profiles`(user_login, user_password, gender, birthday, country)
values ('T.Gun', '12345', 'M', '1996-11-27', 'USA'),
('J.Rearm', '23456', 'M', '1995-10-20', 'Andorra'),
('C.Darvin', '45678', 'M', '1969-05-10', 'Australia'),
('J.Uar', '13555', 'F', '1970-12-11', 'Austria'),
('B.Dilan', '1948', 'M', '1987-11-20', 'Barbados'),
('C.Berry', '193330', 'M', '1990-01-01', 'Canada'),
('J.Hendrix', '19788', 'M', '1976-09-08', 'Chile'),
('L.Zeppelin', '287282', 'M', '1991-04-04', 'France'),
('R.Charles', '289283', 'M', '1999-09-09', 'Egypt'),
('S.Kuk', '987234', 'M', '1986-03-21', 'Finland'),
('P.Floyd', '184736', 'M', '1987-05-29', 'Italy');

drop table if exists categories;
create table categories(
	id serial primary key,
	category_name varchar(50) unique
);

insert into categories(category_name)
values('Music'),
('Sport'),
('VideoGames'),
('Cinema'),
('News'),
('fashion');

drop table if exists videos;
create table videos(
	id serial primary key,
	user_id bigint unsigned not null,
	video_name varchar(255),
	created_at datetime default now(),
	category bigint unsigned,
	`like` bigint default 0,
	`dislike` bigint default 0,
	`views` bigint default 0,
	index video_name_idx(video_name),
	foreign key (category) references categories(id),
	foreign key (user_id) references `users`(id)
		on update cascade
		on delete cascade
);

insert into videos(user_id, video_name)
values(1 , '��� 2019 ������� ����������� (23.11.2019) ���� ������� Full HD'),
(1 , '15 ������� ������ � ������� �� �� �������������'),
(2 , '��� ���� 2019'),
(2 , '���������� �� ����� � �������� ��������'),
(2 , '����������� ������� �� ��������'),
(4 , '10 ��������� ��� �������'),
(4 , 'ice backet challendge'),
(5 , '��� ����� �������������'),
(6 , '10 �������� ��������� ��� Python'),
(6 , '1 ���� �� ����� ����������'),
(6 , '��� ��������� ������ �� �����'),
(6 , '��� ��������� ���� �������� �� 10% �����������'),
(7 , '��� ����� ����� � �������� �������'),
(7 , '�� ��� ������ ������ �� ����������� �������'),
(8 , '����� �������� ���������'),
(8 , '��� ����� ������ � ����'),
(10 , '������ ��� ��� �����������'),
(11 , '10 ����, ������� ������ ��������� ������'),
(11 , '��� ������� ������ ����� ������');

drop table if exists videos_likes;
create table videos_likes (
	id serial primary key,
	video_id bigint unsigned not null,
	like_user_id bigint unsigned not null,
	`like` enum('like'),
	`dislike` enum('dislike'),
	`views` enum('1') default '1',
	foreign key (video_id) references videos(id)
);


drop table if exists channels;
create table channels (
	id serial primary key,
	`admin` bigint unsigned not null,
	channel_name varchar(255),
	subscribers bigint unsigned default 0,
	created_at datetime default now(),
	index channel_name_idx(channel_name),
	foreign key (`admin`) references `users`(id)
);

insert into channels(`admin`, channel_name)
values (1, 'BodyMania'),
(2 , 'BBS'),
(3 , 'Discover'),
(4 , 'Developer'),
(5 , 'Animal world'),
(6 , 'Rap and hip-hop'),
(7 , 'Bull-x TV'),
(8 , 'GoPro'),
(9 , 'TechZone'),
(10 , 'EA Sport'),
(11 , 'Mori cinema');

drop table if exists comments;
create table comments(
	id serial primary key,
	video_id bigint unsigned not null,
	user_id bigint unsigned not null,
	body text,
	created_at datetime default now(),
	index comments_from_user_idx(user_id),
	foreign key (user_id) references `users`(id),
	foreign key (video_id) references videos(id)
);

insert into comments(video_id, user_id, body)
values(5, 1, '�������� �����'),
(4, 1, '�� �������� �����'),
(7, 3, '��� �����������, ���������� ����'),
(10, 5, 'This is kinda video that no one searches for it but cant resist clicking it when it pops up in the suggestions'),
(2, 5, 'surprised the size of their balls didn�t weight them down'),
(6, 11, 'Why not just put out a salt lick nearby for them.'),
(3, 7, 'Wow. What you are doing really matters. Keep up the good work!!!'),
(9, 7, 'I love this video. Good facts'),
(1, 8, 'Sir your video very good i love your video'),
(15, 8, 'Who else didnt faint'),
(14, 8, 'I mean 10% was funny, the other 90 was just cruel'),
(1, 6, 'Poor horse with obese woman and Chubby kid on its back..it was trying to buck them off but couldn�t because of the weight..'),
(18, 6, 'The hyena is apparently injured otherwise it could have run.'),
(17, 9, 'imaging starting a fight with this guy and he brings his "squad"'),
(2, 9, 'Im not afraid of dogs anymore because they dont eat people.');

drop table if exists user_subscribers;
create table user_subscribers(
	id serial primary key,
	user_id bigint unsigned not null,
	channel_id bigint unsigned not null,
	index channel_idx(channel_id),
	foreign key (user_id) references `users`(id),
	foreign key (channel_id) references channels(id)
);

insert into user_subscribers(user_id, channel_id)
values(6, 5);

drop table if exists notifications;
create table notifications(
	id serial primary key,
	user_id bigint unsigned not null,
	body text,
	date_created datetime default now(),
	foreign key (user_id) references `users`(id)
);

insert into notifications(user_id, body)
values(1, 'Добрый день!'),
(2, 'Добрый вечер'),
(1, 'Вышло новое видео на канале Animal world!'),
(1, 'Вышло новое видео на канале BBS'),
(4, 'Вышло новое видео на канале Discover'),
(4, 'Вышло новое видео на канале Bull-x TV'),
(7, 'Вышло новое видео на канале BBS'),
(7, 'Вышло новое видео на канале Mori cinema'),
(7, 'Вышло новое видео на канале Rap and hip-hop'),
(5, 'Вышло новое видео на канале BodyMania'),
(5, 'Обновите профиль!'),
(5, 'Поздравляем!На вашем канале n-ое количество подписчиков'),
(5, 'Вышло новое видео на канале BBS'),
(10, 'Добрый день!'),
(10, 'Советуем подписаться на канал Animal world!'),
(10, 'Вышло новое видео на канале GoPro');

drop table if exists user_history;
create table user_history(
	id serial primary key,
	user_id bigint unsigned not null,
	video_id bigint unsigned not null,
	date_view datetime not null default now(),
	foreign key (user_id) references `users`(id),
	foreign key (video_id) references videos(id)
);

insert into user_history(user_id, video_id)
values (1, 10),
(1, 15),
(1, 13),
(1, 5),
(2, 6),
(2, 8),
(2, 2),
(2, 1),
(3, 9),
(3, 10),
(3, 12),
(4, 15),
(4, 16),
(4, 12),
(4, 7),
(5, 3),
(5, 2),
(5, 9),
(5, 6),
(6, 18),
(6, 14),
(6, 7),
(7, 1),
(7, 3),
(7, 8),
(8, 10),
(8, 11),
(8, 17),
(9, 3),
(9, 2),
(9, 5),
(10, 10),
(10, 6),
(10, 13);

drop table if exists `complaint`;
create table `complaint`(
	id serial primary key,
	user_id bigint unsigned not null,
	video_id bigint unsigned not null,
	constraint_text text,
	foreign key (user_id) references `users`(id),
	foreign key (video_id) references videos(id)
);

insert into `complaint` (user_id, video_id, constraint_text)
values (4, 15, 'Нарушние политики youtube'),
(6, 15, 'Запрещенное видео!'),
(10, 4, 'Видео слишком долгое'),
(1, 8, 'Нарушение авторских прав');

drop table if exists `translation`;
create table `translation`(
	id serial primary key,
	user_id bigint unsigned not null,
	`status` enum('online', 'offline'),
	start_translation datetime default now(),
	comments text,
	foreign key (user_id) references `users`(id)
);

insert into `translation`(user_id, `status`)
values(1, 'online'),
(5, 'online'),
(8, 'online'),
(10, 'online'),
(1, 'offline'),
(5, 'offline'),
(8, 'offline'),
(10, 'offline');


drop table if exists user_library;
create table user_library(
	id serial primary key,
	user_id bigint unsigned not null,
	video bigint unsigned not null,
	foreign key (user_id) references `users`(id),
	foreign key (video) references videos(id)
);

insert into user_library(user_id, video)
values (1, 5);

-- Список пользователей, оставивших больше 2 комментов

select u.firstname, u.lastname, count(*) as `sum`
from users as u
join comments as com on u.id = com.user_id
group by u.id
having `sum` > 2;

-- Вывод логинов пользователей и их жалобы на видео, принадлежащие каналу запрошенного пользователя.
select p.user_login as `admin`,v.video_name , c.constraint_text as `text`, (select `profiles`.user_login 
																		from `profiles` 
																		join users on `users`.id = `profiles`.user_id 
																		where `users`.id = c.user_id) as 'login' 
from `profiles` as p
join `users` as u on u.id = p.user_id
join videos as v on v.user_id = u.id 
join complaint as c on c.video_id = v.id
where u.id in (5,8);

-- Вывод логина пользователя и количество лайков под всеми видео соответствующего пользователя.
select p.user_login, sum(likes)
from `users` as u
join videos as v on u.id = v.user_id
join `profiles` as p on p.user_id = u.id
where u.id in (1,4,6)
group by u.firstname;

-- Запрос для получения количества подписчиков на канале пользователя, а также название канала и имя пользователя, владеющим этим каналом.
select ch.channel_name, CONCAT(u.firstname,' ',u.lastname) as `admin`, count(u_sub.user_id) as 'Amount_subs'
from `users` as u
join channels as ch on u.id = ch.admin
join user_subscribers as u_sub on u_sub.channel_id = ch.id
where u.id = 5;

-- Представления
-- Представляет информацию о пользователе
 
create view users_info (surname, name, login) as 
select u.lastname, u.firstname, p.user_login
from users as u 
join `profiles` as p on u.id = p.user_id 
order by u.lastname;

-- Показывает возраст пользователей и их жалобы
create view user_complaint (login, text, year) as 
select p.user_login, c.constraint_text, timestampdiff(year, p.birthday, now())
from `profiles` as p
join users as u on u.id = p.user_id
join complaint as c on c.user_id = u.id ;

-- Показывает трансляции, которые идут прямо сейчас
create view online_translation(`login`, `duration`) as 
select p.user_login, sec_to_time(unix_timestamp(now()) - unix_timestamp(t.start_translation))
from profiles as p
join users as u on u.id = p.user_id
join `translation` as t on t.user_id = u.id
where timestampdiff(year, p.birthday, now()) > 18 and t.user_id in (select user_id 
from `translation` as tr 
where tr.user_id not in (select user_id from `translation` where `status` = 'offline'));
