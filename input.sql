USE itunes;

INSERT INTO `card_bonus` VALUES 
(1,'student'),
(2,'pension'),
(3,'student'),
(4,'student'),
(5,'pension'),
(6,'student'),
(7,'student'),
(8,'student'),
(9,'student'),
(10,'student');

INSERT INTO `user_card` VALUES 
(1,'Visa'),
(2,'MasterCard'),
(3,'PayPal'),
(4,'MasterCard'),
(5,'Visa'),
(6,'PayPal'),
(7,'MasterCard'),
(8,'Visa'),
(9,'MasterCard'),
(10,'Visa');

INSERT INTO `genre` VALUES 
(1,'Rock'),
(2,'Pop'),
(3,'Rep'),
(4,'Pop'),
(5,'Rock'),
(6,'Electronic music'),
(7,'Rock'),
(8,'Electronic music'),
(9,'Rep'),
(10,'Pop');

INSERT INTO `song` VALUES 
(1,'Плакала',2),
(2,'Злива',4),
(3,'Коляда',6),
(4,'Як ти?',5),
(5,'Дике поле',3),
(6,'Досить',1),
(7,'Діти',7),
(8,'Місця щасливих людей',10),
(9,'Сонце',8),
(10,'KUPALA',9);

INSERT INTO `author` VALUES 
(1,'Go_A',NULL,NULL,'goa@gmail.com',9),
(2,'Жадан і Собаки',NULL,NULL,'hungrydogs@gmail.com',7),
(3,'Альона Альона',NULL,'W','aliona7aliona@gmail.com',10),
(4,'Go_A',NULL,NULL,'goa@gmail.com',3),
(5,'KAZKA',NULL,NULL,'kazka317@gmail.com',1),
(6,'Бумбокс',NULL,NULL,'booooombox@gmail.com',2),
(7,'The Hardkiss',NULL,NULL,'hardkiss@gmail.com',4),
(8,'Yarmak',NULL,'М','yarmakS@gmail.com',5),
(9,'Скрябін',NULL,'M','skriabin@gmail.com',8),
(10,'Олександр','Чемеров','М','chemerovS4@gmail.com',6);

INSERT INTO `album_of_song` VALUES 
(5,9,1,'Elecm_ua'),
(5,4,2,'biabooom'),
(7,2,3,'Family Бiзнес'),
(10,1,4,'bonesry'),
(11,10,5,'хвилі'),
(4,8,6,'stopWar'),
(5,6,7,'модель'),
(6,7,8,'happy_life'),
(7,3,9,'цейво'),
(10,5,10,'ganja');

INSERT INTO `musical_lables` VALUES 
(1,'Secret Service EA','Так',5),
(2,'Mozgi Group','Так',7),
(3,'Secret Service EA','Так',9),
(4,'mamamusic','Так',10),
(5,'mamamusic','Так',1),
(6,'Secret Service EA','Так',3),
(7,'Secret Service EA','Так',4),
(8,'mamamusic','Так',2),
(9,'mamamusic','Так',6),
(10,'Mozgi Group','Так',8);

INSERT INTO `region` VALUES 
('Dnipropetrovsk region'),
('Ivano-Frankivsk region'),
('Khmelnytskyi region'),
('Kirovohrad region'),
('Kyiv region'),
('Lviv region'),
('Odesa region'),
('Poltava region'),
('Vinnytsia region'),
('Zhytomyr region');

INSERT INTO `city` VALUES 
('Alexandria',6,'Kirovohrad region'),
('Ivano-Frankivsk',9,'Ivano-Frankivsk region'),
('Kremenchuk',2,'Poltava region'),
('Kryvyi Rih',8,'Dnipropetrovsk region'),
('Kyiv',7,'Kyiv region'),
('Lviv',1,'Lviv region'),
('Novograd-Volynskyi',10,'Zhytomyr region'),
('Odesa',4,'Odesa region'),
('Oleshyn',3,'Khmelnytskyi region'),
('Zhmerinka',5,'Vinnytsia region');

INSERT INTO `download` VALUES 
(1,5,1.5,45),
(2,1,1,100),
(3,2,1,235),
(4,4,2,12),
(5,10,3,444),
(6,6,1.2,235),
(7,8,2.1,87),
(8,9,1.7,94),
(9,3,3.2,499),
(10,7,0.75,397);

INSERT INTO `service_user` VALUES 
(1,'Ivan_B',5,9),
(2,'bib_bob',7,6),
(3,'nnnnnnnn',3,4),
(4,'fatily',1,2),
(5,'myhip',10,8),
(6,'bone',8,10),
(7,'cool_girl',2,1),
(8,'Masha',4,3),
(9,'Vlad_Vt',6,7),
(10,'gigant333',9,5);

INSERT INTO `card_has_bonus` VALUES 
(10.00,1,5,1),
(5.00,2,4,2),
(5.00,3,3,3),
(5.00,4,7,4),
(5.00,5,9,5),
(5.00,6,10,6),
(5.00,7,1,7),
(10.00,8,2,8),
(5.00,9,6,9),
(5.00,10,8,10);