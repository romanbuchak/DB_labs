USE itunes;

-- 1 show bonus_value which are higher than 5%

SELECT bonus_value, user_card_id from card_has_bonus where bonus_value > 5;

-- 2 show name and gender which is not null

select name, gender from author where gender is not null;

-- 3 show all data where name of musical_lables is 'mamamusic'

select * from musical_lables where name = 'mamamusic';

-- 4 show name of song using genre id

select name from genre as g join song as s on s.id=g.id;

-- 5 show the name of song where genre is 'rock'

select genre_id, name from song as s join genre as gr on s.id = gr.id where gr.type = 'rock';

-- 6 show name of card where bonus_value = 10

select type from user_card as us join card_has_bonus as chb on us.id = chb.user_card_id where bonus_value = 10;

-- 7 show name of author which have name and surname

select name, surname from author where name is not null and surname is not null;

-- 8 show email adres which whous have a surname

select email from author where surname is not null;

-- 9 show name of song whwrw id of genre >=5

select name from song where genre_id >=5;

-- 10 show min and max price of download

select MIN(price), MAX(price) from download;
