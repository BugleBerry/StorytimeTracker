BEGIN TRANSACTION;

DROP TABLE IF EXISTS book_info, users, users_books CASCADE;

DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE book_info (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
	isbn BIGINT,
	difficulty int
);

CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	family_id varchar(255) NOT NULL,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	email varchar(255),
	username varchar(50) UNIQUE NOT NULL,
	password_hash varchar(255) NOT NULL,
	role varchar(50) NOT NULL,
	total_minutes int,
	points_balance int,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE users_books (
	user_id int NOT NULL,
	book_id int NOT NULL,
	minutes_read int,
	reading_format varchar (50) NOT NULL,
	times_read int,
	past_book boolean,
	current_book boolean,
	future_book boolean,
	notes varchar (150),
	CONSTRAINT PK_users_books PRIMARY KEY(user_id, book_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(book_id) REFERENCES book_info(book_id)

);

INSERT INTO users (username, family_id, first_name, last_name, email, password_hash, role, total_minutes, points_balance)
VALUES
	('user', 2, 'Amanda', 'Davis', 'cd@gmail.com','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_PARENT', 90, 100),
	('admin', 2, 'Aubrey', 'Tsai', 'nt@gmail.com','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_CHILD', 2450, 2100),
	('regreg', 2, 'Reginald', 'Arnedo', 'reg@hotmail.com', '$2a$10$D6LUTeihoDMiJTtw2zsWTuy8qaxS5MZkFA7sRwa538FDGu4/T/qOK', 'ROLE_CHILD', 20, 110),
	('indigowolf', 2, 'Kai Indigo', 'Wolf', 'kai.wolf@gmail.com', '$2a$10$CemCJcwUc/yxFjK20VKQS.7NxjkM/iR/liyQtzfXtgQjfBxV/EUgm', 'ROLE_PARENT', 40, 999),
	('niles', 2, 'Niles', 'Xavier', 'nx@aol.com', '$2a$10$afmIx5OHly1g2UlW0.iW0O6CBqy4.2STcOJapa97Jw3DjUyU40gke', 'ROLE_CHILD', 70, 1450),
	('lovely', 2, 'Piper', 'Lovelace', 'pip@gmail.com', '$2a$10$niS2RFa/pz/iGOOANcliBOogp30yhVf6P5xoVpPKoV5alItlu2Coq', 'ROLE_CHILD', 115, 1000),
	('jess', 2, 'Jessica', 'Wolf', 'jw@gmail.com', '$2a$10$i7jJUMMotAVXqGj.q22y8OiKILcBiP9pAgJZc8u1ilLz9jK9mvcxm' , 'ROLE-CHILD', 90, 150),
	('snape', 2, 'Severus', 'Snape', 'snape@slytherin.com', '$2a$10$Ud8pVA/eQWCFRwWJVhREbu9gDOLOBGv8BBQ6nuzw3RpWbNiaKUR1.', 'ROLE-CHILD', 20, 150),
	('fanofdepp', 2, 'Stella', 'Depp', 'sdepp@johnny.com', '$2a$10$52hZgsBIboDv/nje3saBXuIIcEAw2N5F5Aj5tbK/FQN/2getqNEwu', 'ROLE-CHILD', 150, 2000),
	('artguy', 2, 'Scout', 'Handford', 'scout@dreamworks.com', '$2a$10$Ud8pVA/eQWCFRwWJVhREbu9gDOLOBGv8BBQ6nuzw3RpWbNiaKUR1.', 'ROLE_PARENT', 90, 2090);


INSERT INTO book_info (title, author, isbn, difficulty)
VALUES
	('How to Play Your Best Golf All the Time', 'Tommy Armour', 9780684813790, 5),
	('The Rainbow Fish', 'J Alison James', 1558580093, 1),
	('1984', 'George Orwell', 9780140009729, 5),
	('The Boy Who Loved Math', 'Deborah Heiligman', 9781596433076, 4),
	('Macbeth', 'William Shakespeare', 9780333419991, 5),
	('If You Give a Mouse a Cookie', 'Felicia Bond', 9780064434096, 2),
	('Inside Out & Back Again', 'Thanhha Lai', 9780545508971, 3),
	('Where the Wild Things Are', 'Maurice Sendak', 9780064431781, 2),
	('The Giver', 'Louis Lowry', 9780395645666, 4),
	('Charlotte''s Web', 'Jennifer Frantz', 9780060882846, 3 ),
	('Atlas of Adventures: Wonders of the World', 'Ben Handicott', 9781786033444, 3),
	('The Very Hungry Caterpillar', 'Eric Carle', 9780399226908, 1),
	('Strictly No Elephants', 'Taeeun Yoo', 9781481416474, 2),
	('Harry Potter and the Deathly Hollows', 'J. K. Rowling', 9780545139700, 5),
	('Fancy Nancy: Poet Extraordinaire!', 'Jane O''Connor', 9780061896439, 3),
	('An Illustrated Book of Bad Arguments', 'Ali Almossawi', 9780989931205, 5),
	('We Are Grateful: Otsaliheliga', 'Traci Sorell', 9781580897723, 3),
	('Native Homes', 'Bobbie Kalman', 9780778703716, 4);


INSERT INTO users_books (user_id, book_id, minutes_read, reading_format, times_read, past_book, current_book, future_book, notes)
VALUES
	(1, 1, 30, '', 2, true, false, false, 'Definitely good for sleepy time.'),
	(1, 2, 30, '', 1, false, true, false, ''),
	(1, 5, 60, '', 1, true, true, false, ''),
	(1, 3, 60, '', 2, false, true, false, ''),
	(1, 6, 90, '', 3, false, true, false, ''),
	(1, 4, 90, '', 1, true, false, false, ''),
	(1, 8, 30, '', 1, true, false, false, ''),
	(1, 9, 60, '', 5, false, true, false, ''),
	(1, 7, 60, '', 2, false, true, false, ''),
    (1, 14, 90, '', 3, false, true, false, ''),
    (1, 13, 90, '', 1, true, false, false, ''),
    (1, 12, 30, '', 1, false, true, false, ''),
    (1, 11, 60, '', 2, false, true, false, ''),
    (1, 10, 90, '', 3, true, false, false, ''),
    (1, 15, 90, '', 1, true, false, false, ''),
    (1, 17, 30, '', 1, true, false, false, ''),
    (1, 18, 30, '', 1, true, false, false, ''),
    (1, 16, 30, '', 1, true, false, false, 'Definitely for older kids with difficult vocabulary and deep concepts.'),
	(2, 7, 60, '', 2, false, true, false, ''),
    (2, 14, 90, '', 3, false, true, false, ''),
    (2, 13, 90, '', 1, true, false, false, ''),
    (2, 12, 30, '', 1, false, true, false, ''),
    (2, 11, 60, '', 2, false, true, false, ''),
    (2, 10, 90, '', 3, true, false, false, ''),
    (2, 15, 90, '', 1, true, false, false, ''),
    (2, 17, 30, '', 1, true, false, false, ''),
    (2, 18, 30, '', 1, true, false, false, ''),
    (2, 16, 30, '', 1, true, false, false, ''),
	(3, 1, 30, '', 2, true, false, false, 'Zonked right out.'),
	(3, 2, 30, '', 1, false, true, false, ''),
	(3, 5, 60, '', 1, true, true, false, 'What a wordy book!'),
	(3, 3, 60, '', 2, false, true, false, ''),
	(3, 6, 90, '', 3, false, true, false, ''),
	(3, 4, 90, '', 1, true, false, false, ''),
	(3, 8, 30, '', 1, true, false, false, ''),
	(3, 9, 60, '', 5, false, true, false, 'A favorite for sure.'),
	(3, 7, 60, '', 2, false, true, false, ''),
    (3, 14, 90, '', 3, false, true, false, ''),
	(8, 1, 30, '', 2, true, false, false, 'Definitely good for sleepy time.'),
	(6, 2, 30, '', 1, false, true, false, ''),
	(7, 5, 60, '', 1, true, true, false, 'Why are the words so boring?'),
	(5, 3, 60, '', 2, false, true, false, ''),
	(4, 6, 90, '', 3, false, true, false, ''),
	(5, 4, 90, '', 1, true, false, false, ''),
	(4, 8, 30, '', 1, true, false, false, ''),
	(5, 9, 60, '', 5, false, true, false, 'Lets read this one again and again'),
	(4, 7, 60, '', 2, false, true, false, ''),
    (5, 14, 90, '', 3, false, true, false, ''),
	(5, 11, 60, '', 2, false, true, false, ''),
    (5, 10, 90, '', 3, true, false, false, ''),
    (6, 15, 90, '', 1, true, false, false, ''),
    (6, 17, 30, '', 1, true, false, false, ''),
    (7, 18, 30, '', 1, true, false, false, ''),
    (8, 16, 30, '', 1, true, false, false, 'Definitely for older kids with difficult vocabulary and deep concepts.'),
	(5, 7, 60, '', 2, false, true, false, ''),
    (4, 14, 90, '', 3, false, true, false, ''),
    (3, 13, 90, '', 1, true, false, false, ''),
    (8, 12, 30, '', 1, false, true, false, ''),
	(6, 1, 30, '', 2, true, false, false, 'Definitely good for sleepy time.'),
	(5, 2, 30, '', 1, false, true, false, ''),
	(6, 5, 60, '', 1, true, true, false, 'Not a fan.'),
	(8, 3, 60, '', 2, false, true, false, ''),
	(6, 6, 90, '', 3, false, true, false, ''),
	(8, 4, 90, '', 1, true, false, false, ''),
	(7, 8, 30, '', 1, true, false, false, ''),
	(7, 9, 60, '', 5, false, true, false, 'My favorite!!!!'),
	(8, 7, 60, '', 2, false, true, false, '');



--- USER SETUP (Do Not Modify)
DROP USER IF EXISTS final_capstone_owner;
DROP USER IF EXISTS final_capstone_appuser;

CREATE USER final_capstone_owner
WITH PASSWORD 'finalcapstone';

GRANT ALL
ON ALL TABLES IN SCHEMA public
TO final_capstone_owner;

GRANT ALL
ON ALL SEQUENCES IN SCHEMA public
TO final_capstone_owner;

CREATE USER final_capstone_appuser
WITH PASSWORD 'finalcapstone';

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO final_capstone_appuser;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO final_capstone_appuser;

COMMIT TRANSACTION;