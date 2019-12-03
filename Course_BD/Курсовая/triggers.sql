-- Триггер, блокирующий жалобы от пользователей недостигших 18 лет(Если жалоба фиксируется , под видео инкрементируется счетчик дизлайков)
CREATE DEFINER=`root`@`localhost` TRIGGER `filter_complaint` AFTER INSERT ON `complaint` FOR EACH ROW begin
	set @age = (select timestampdiff(year, p.birthday, now()) 
				from profiles as p
				join users as u on u.id = p.user_id
				where u.id = new.user_id
	);

	if (@age >= 18) then 
	update videos 
	set dislikes = dislikes + 1
	where id = new.video_id;
	end if;
end

-- Триггер, обновляющий количество подписчиков
CREATE DEFINER=`root`@`localhost` TRIGGER `incr_subs_on_channel` AFTER INSERT ON `user_subscribers` FOR EACH ROW begin
	update channels 
	set subscribers = subscribers + 1
	where id = new.channel_id;
end
-- Триггер на добавление видео в библиотеку пользователя
CREATE DEFINER=`root`@`localhost` TRIGGER `add_on_user_library_like_video` AFTER INSERT ON `videos_likes` FOR EACH ROW begin 
	if (new.`like` = 'like') then
		insert into user_library(user_id, video)
		values(new.`like_user_id`, new.video_id);
		end if;
end
-- триггер, который обновляет количество просмотров под видео
CREATE DEFINER=`root`@`localhost` TRIGGER `add_views_on_videos` AFTER INSERT ON `videos_likes` FOR EACH ROW begin 
	update videos 
	set views = views + 1
	where id = new.video_id;
end