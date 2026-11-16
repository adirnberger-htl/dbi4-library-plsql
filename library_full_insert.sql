-- Media Types
INSERT INTO library_media_type (id, media_type, base_fee) VALUES (1, 'Hardcover', 2.50);
INSERT INTO library_media_type (id, media_type, base_fee) VALUES (2, 'Paperback', 1.50);
INSERT INTO library_media_type (id, media_type, base_fee) VALUES (3, 'Audiobook', 3.00);
INSERT INTO library_media_type (id, media_type, base_fee) VALUES (4, 'Ebook', 1.00);

-- Languages
INSERT INTO Library_Language (id, language_short, language) VALUES (1, 'EN', 'English');
INSERT INTO Library_Language (id, language_short, language) VALUES (2, 'DE', 'German');
INSERT INTO Library_Language (id, language_short, language) VALUES (3, 'FR', 'French');

-- Genres
INSERT INTO Library_Genre (id, genre) VALUES (1, 'Fiction');
INSERT INTO Library_Genre (id, genre) VALUES (2, 'Crime');
INSERT INTO Library_Genre (id, genre) VALUES (3, 'Thriller');
INSERT INTO Library_Genre (id, genre) VALUES (4, 'Romance');
INSERT INTO Library_Genre (id, genre) VALUES (5, 'Children');
INSERT INTO Library_Genre (id, genre) VALUES (6, 'Science');
INSERT INTO Library_Genre (id, genre) VALUES (7, 'Politics');
INSERT INTO Library_Genre (id, genre) VALUES (8, 'Young Adult');

-- Authors
INSERT INTO Library_Author (id, first_name, last_name, date_of_birth, date_of_death) VALUES (1, 'Harper', 'Lee', DATE '1926-04-28', DATE '2016-02-19');
INSERT INTO Library_Author (id, first_name, last_name, date_of_birth, date_of_death) VALUES (2, 'George', 'Orwell', DATE '1903-06-25', DATE '1950-01-21');
INSERT INTO Library_Author (id, first_name, last_name, date_of_birth, date_of_death) VALUES (3, 'Jane', 'Austen', DATE '1775-12-16', DATE '1817-07-18');
INSERT INTO Library_Author (id, first_name, last_name, date_of_birth, date_of_death) VALUES (4, 'F. Scott', 'Fitzgerald', DATE '1896-09-24', DATE '1940-12-21');
INSERT INTO Library_Author (id, first_name, last_name, date_of_birth, date_of_death) VALUES (5, 'J.K.', 'Rowling', DATE '1965-07-31', NULL);
INSERT INTO Library_Author (id, first_name, last_name, date_of_birth, date_of_death) VALUES (6, 'Markus', 'Zusak', DATE '1975-06-23', NULL);
INSERT INTO Library_Author (id, first_name, last_name, date_of_birth, date_of_death) VALUES (7, 'Suzanne', 'Collins', DATE '1962-08-10', NULL);

-- Books
INSERT INTO Library_Book (author, title, ISBN, serial_number, book_language, book_genre, media_type, shelf) VALUES (1, 'To Kill a Mockingbird', '9780061120084', Library_Book_Serial.NEXTVAL, 1, 1, 1, 'A1');
INSERT INTO Library_Book (author, title, ISBN, serial_number, book_language, book_genre, media_type, shelf) VALUES (2, '1984', '9780451524935', Library_Book_Serial.NEXTVAL, 2, 3, 2, 'A2');
INSERT INTO Library_Book (author, title, ISBN, serial_number, book_language, book_genre, media_type, shelf) VALUES (3, 'Pride and Prejudice', '9780141439518', Library_Book_Serial.NEXTVAL, 1, 4, 1, 'A3');
INSERT INTO Library_Book (author, title, ISBN, serial_number, book_language, book_genre, media_type, shelf) VALUES (4, 'The Great Gatsby', '9780743273565', Library_Book_Serial.NEXTVAL, 1, 1, 2, 'A4');
INSERT INTO Library_Book (author, title, ISBN, serial_number, book_language, book_genre, media_type, shelf) VALUES (5, 'Harry Potter and the Goblet of Fire', '9780439139601', Library_Book_Serial.NEXTVAL, 1, 5, 1, 'B1');
INSERT INTO Library_Book (author, title, ISBN, serial_number, book_language, book_genre, media_type, shelf) VALUES (6, 'Der Bücherdieb', '9780375842207', Library_Book_Serial.NEXTVAL, 2, 5, 2, 'B2');
INSERT INTO Library_Book (author, title, ISBN, serial_number, book_language, book_genre, media_type, shelf) VALUES (7, 'The Hunger Games', '9780439023528', Library_Book_Serial.NEXTVAL, 1, 8, 1, 'B3');
INSERT INTO Library_Book (author, title, ISBN, serial_number, book_language, book_genre, media_type, shelf) VALUES (2, 'Animal Farm', '9780451526342', Library_Book_Serial.NEXTVAL, 3, 2, 2, 'B4');
INSERT INTO Library_Book (author, title, ISBN, serial_number, book_language, book_genre, media_type, shelf) VALUES (5, 'Harry Potter und der Gefangene von Azkaban', '9780439136365', Library_Book_Serial.NEXTVAL, 2, 5, 1, 'C1');
INSERT INTO Library_Book (author, title, ISBN, serial_number, book_language, book_genre, media_type, shelf) VALUES (6, 'I Am the Messenger', '9780375836671', Library_Book_Serial.NEXTVAL, 1, 1, 2, 'C2');

-- Clients
INSERT INTO Library_Client (id, first_name, last_name, email) VALUES (1, 'John', 'Doe', 'john.doe@email.com');
INSERT INTO Library_Client (id, first_name, last_name, email) VALUES (2, 'Jane', 'Smith', 'jane.smith@email.com');
INSERT INTO Library_Client (id, first_name, last_name, email) VALUES (3, 'Bob', 'Johnson', 'bob.johnson@email.com');
INSERT INTO Library_Client (id, first_name, last_name, email) VALUES (4, 'Sarah', 'Lee', 'sarah.lee@email.com');
INSERT INTO Library_Client (id, first_name, last_name, email) VALUES (5, 'Emma', 'White', 'emma.white@email.com');
INSERT INTO Library_Client (id, first_name, last_name, email) VALUES (6, 'Max', 'Braun', 'max.braun@email.com');
INSERT INTO Library_Client (id, first_name, last_name, email) VALUES (7, 'Laura', 'Stein', 'laura.stein@email.com');

-- ClientLanguage
INSERT INTO Library_clientlanguage (client_id, language_id) VALUES (1, 1);
INSERT INTO Library_clientlanguage (client_id, language_id) VALUES (2, 2);
INSERT INTO Library_clientlanguage (client_id, language_id) VALUES (3, 1);
INSERT INTO Library_clientlanguage (client_id, language_id) VALUES (4, 3);
INSERT INTO Library_clientlanguage (client_id, language_id) VALUES (5, 1);
INSERT INTO Library_clientlanguage (client_id, language_id) VALUES (6, 2);
INSERT INTO Library_clientlanguage (client_id, language_id) VALUES (7, 3);

-- Favorit_genre
INSERT INTO Library_Favorite_genre (client_id, genre_id) VALUES (1, 1);
INSERT INTO Library_Favorite_genre (client_id, genre_id) VALUES (2, 2);
INSERT INTO Library_Favorite_genre (client_id, genre_id) VALUES (3, 3);
INSERT INTO Library_Favorite_genre (client_id, genre_id) VALUES (4, 4);
INSERT INTO Library_Favorite_genre (client_id, genre_id) VALUES (5, 5);
INSERT INTO Library_Favorite_genre (client_id, genre_id) VALUES (6, 6);
INSERT INTO Library_Favorite_genre (client_id, genre_id) VALUES (7, 7);

-- Library_Book_rentals (at least 20)
INSERT INTO Library_Book_rental (id, client_id, book_id, booking_time, return_date, fee, late_fee, amount_paid, all_paid) VALUES (1, 1, 1, DATE '2023-01-01', DATE '2023-01-15', 2.50, 0, 2.50, 1);
INSERT INTO Library_Book_rental (id, client_id, book_id, booking_time, return_date, fee, late_fee, amount_paid, all_paid) VALUES (2, 2, 2, DATE '2023-01-02', DATE '2023-01-16', 1.50, 0, 1.50, 1);
INSERT INTO Library_Book_rental (id, client_id, book_id, booking_time, return_date, fee, late_fee, amount_paid, all_paid) VALUES (3, 3, 3, DATE '2023-01-03', DATE '2023-01-17', 2.50, 0, 2.50, 1);
INSERT INTO Library_Book_rental (id, client_id, book_id, booking_time, return_date, fee, late_fee, amount_paid, all_paid) VALUES (4, 4, 4, DATE '2023-01-04', DATE '2023-01-18', 1.50, 0, 0, 0);
INSERT INTO Library_Book_rental (id, client_id, book_id, booking_time, return_date, fee, late_fee, amount_paid, all_paid) VALUES (5, 5, 5, DATE '2023-01-05', DATE '2023-01-19', 2.50, 0, 2.50, 1);
INSERT INTO Library_Book_rental (id, client_id, book_id, booking_time, return_date, fee, late_fee, amount_paid, all_paid) VALUES (6, 6, 6, DATE '2023-01-06', DATE '2023-01-20', 1.50, 0, 1.50, 1);
INSERT INTO Library_Book_rental (id, client_id, book_id, booking_time, return_date, fee, late_fee, amount_paid, all_paid) VALUES (7, 7, 7, DATE '2023-01-07', DATE '2023-01-21', 2.50, 0, 2.50, 1);
INSERT INTO Library_Book_rental (id, client_id, book_id, booking_time, return_date, fee, late_fee, amount_paid, all_paid) VALUES (8, 1, 8, DATE '2023-02-01', DATE '2023-02-19', 1.50, 2, 1.50, 0);
INSERT INTO Library_Book_rental (id, client_id, book_id, booking_time, return_date, fee, late_fee, amount_paid, all_paid) VALUES (9, 2, 9, DATE '2023-02-02', DATE '2023-02-16', 2.50, 0, 2.50, 1);
INSERT INTO Library_Book_rental (id, client_id, book_id, booking_time, return_date, fee, late_fee, amount_paid, all_paid) VALUES (10, 3, 10, DATE '2023-02-03', DATE '2023-02-17', 1.50, 0, 1.50, 1);
INSERT INTO Library_Book_rental (id, client_id, book_id, booking_time, return_date, fee, late_fee, amount_paid, all_paid) VALUES (11, 4, 1, DATE '2023-02-04', DATE '2023-02-18', 2.50, 0, 2.50, 1);
INSERT INTO Library_Book_rental (id, client_id, book_id, booking_time, return_date, fee, late_fee, amount_paid, all_paid) VALUES (12, 5, 2, DATE '2023-02-05', DATE '2023-02-19', 1.50, 0, 1.50, 1);
INSERT INTO Library_Book_rental (id, client_id, book_id, booking_time, return_date, fee, late_fee, amount_paid, all_paid) VALUES (13, 6, 3, DATE '2023-02-06', DATE '2023-02-20', 2.50, 0, 2.50, 1);
INSERT INTO Library_Book_rental (id, client_id, book_id, booking_time, return_date, fee, late_fee, amount_paid, all_paid) VALUES (14, 7, 4, DATE '2023-02-07', DATE '2023-02-21', 1.50, 0, 1.50, 1);
INSERT INTO Library_Book_rental (id, client_id, book_id, booking_time, return_date, fee, late_fee, amount_paid, all_paid) VALUES (15, 1, 5, DATE '2023-03-01', DATE '2023-03-15', 2.50, 0, 2.50, 1);
INSERT INTO Library_Book_rental (id, client_id, book_id, booking_time, return_date, fee, late_fee, amount_paid, all_paid) VALUES (16, 2, 6, DATE '2023-03-02', DATE '2023-03-16', 1.50, 0, 1.50, 1);
INSERT INTO Library_Book_rental (id, client_id, book_id, booking_time, return_date, fee, late_fee, amount_paid, all_paid) VALUES (17, 3, 7, DATE '2023-03-03', DATE '2023-03-17', 2.50, 0, 2.50, 1);
INSERT INTO Library_Book_rental (id, client_id, book_id, booking_time, return_date, fee, late_fee, amount_paid, all_paid) VALUES (18, 4, 8, DATE '2023-03-04', DATE '2023-03-18', 1.50, 0, 1.50, 1);
INSERT INTO Library_Book_rental (id, client_id, book_id, booking_time, return_date, fee, late_fee, amount_paid, all_paid) VALUES (19, 5, 9, DATE '2023-03-05', DATE '2023-03-19', 2.50, 0, 2.50, 1);
INSERT INTO Library_Book_rental (id, client_id, book_id, booking_time, return_date, fee, late_fee, amount_paid, all_paid) VALUES (20, 6, 10, DATE '2023-03-06', DATE '2023-03-20', 1.50, 0, 1.50, 1);

commit;
