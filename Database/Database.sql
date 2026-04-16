DROP DATABASE IF EXISTS artconnect;
CREATE DATABASE artconnect;
USE artconnect;

CREATE TABLE User_(
   id_user INT AUTO_INCREMENT,
   name_user VARCHAR(50),
   email VARCHAR(50),
   birth_year INT,
   phone VARCHAR(20),
   city VARCHAR(50),
   PRIMARY KEY(id_user)
);

CREATE TABLE Artist(
   id_artist INT AUTO_INCREMENT,
   bio TEXT,
   website_artist VARCHAR(100),
   is_active BOOLEAN DEFAULT TRUE,
   id_user INT NOT NULL,
   PRIMARY KEY(id_artist),
   UNIQUE(id_user),
   FOREIGN KEY(id_user) REFERENCES User_(id_user)
);

CREATE TABLE Member_(
   id_member INT AUTO_INCREMENT,
   membership_type ENUM('standard', 'premium'),
   id_user INT NOT NULL,
   PRIMARY KEY(id_member),
   UNIQUE(id_user),
   FOREIGN KEY(id_user) REFERENCES User_(id_user)
);

CREATE TABLE Discipline(
   id_discipline INT AUTO_INCREMENT,
   name_discipline VARCHAR(50),
   PRIMARY KEY(id_discipline)
);

CREATE TABLE Artwork(
   id_artwork INT AUTO_INCREMENT,
   title_art VARCHAR(100),
   creation_year INT,
   type VARCHAR(50),
   medium VARCHAR(50),
   dimensions VARCHAR(50),
   description TEXT,
   price DECIMAL(10,2),
   status ENUM('available', 'sold', 'reserved'),
   id_artist INT NOT NULL,
   PRIMARY KEY(id_artwork),
   FOREIGN KEY(id_artist) REFERENCES Artist(id_artist)
);

CREATE TABLE Tag(
   id_tag INT AUTO_INCREMENT,
   name VARCHAR(50),
   PRIMARY KEY(id_tag)
);

CREATE TABLE Workshop(
   id_workshop INT AUTO_INCREMENT,
   title_workshop VARCHAR(100),
   date_workshop DATETIME,
   duration_minutes INT,
   max_participants INT,
   price DECIMAL(10,2),
   level VARCHAR(50),
   location VARCHAR(50),
   description TEXT,
   id_artist INT NOT NULL,
   PRIMARY KEY(id_workshop),
   FOREIGN KEY(id_artist) REFERENCES Artist(id_artist)
);

CREATE TABLE Artist_Social(
   id_social INT AUTO_INCREMENT,
   platform VARCHAR(50),
   link VARCHAR(200),
   id_artist INT NOT NULL,
   PRIMARY KEY(id_social),
   FOREIGN KEY(id_artist) REFERENCES Artist(id_artist)
);

CREATE TABLE City(
   id_city INT AUTO_INCREMENT,
   city VARCHAR(50),
   code INT,
   country VARCHAR(50),
   PRIMARY KEY(id_city)
);

CREATE TABLE Address(
   address_id INT AUTO_INCREMENT,
   number INT,
   street VARCHAR(50),
   id_city INT NOT NULL,
   PRIMARY KEY(address_id),
   FOREIGN KEY(id_city) REFERENCES City(id_city)
);

CREATE TABLE Gallery(
   id_gallery INT AUTO_INCREMENT,
   name_gallery VARCHAR(50),
   rating INT CHECK (rating BETWEEN 1 AND 5),
   website_gallery VARCHAR(100),
   address_id INT NOT NULL,
   PRIMARY KEY(id_gallery),
   FOREIGN KEY(address_id) REFERENCES Address(address_id)
);

CREATE TABLE Gallery_Hours(
   id_gallery INT,
   day_of_week VARCHAR(20),
   open_time TIME,
   close_time TIME,
   PRIMARY KEY(id_gallery, day_of_week),
   FOREIGN KEY(id_gallery) REFERENCES Gallery(id_gallery)
);

CREATE TABLE Exhibition(
   id_exhibition INT AUTO_INCREMENT,
   title_exhib VARCHAR(100),
   curator_name VARCHAR(50),
   start_date DATE,
   end_date DATE,
   theme VARCHAR(50),
   description TEXT,
   id_gallery INT NOT NULL,
   PRIMARY KEY(id_exhibition),
   FOREIGN KEY(id_gallery) REFERENCES Gallery(id_gallery)
);

CREATE TABLE Artist_Discipline(
   id_artist INT,
   id_discipline INT,
   PRIMARY KEY(id_artist, id_discipline),
   FOREIGN KEY(id_artist) REFERENCES Artist(id_artist),
   FOREIGN KEY(id_discipline) REFERENCES Discipline(id_discipline)
);

CREATE TABLE Artwork_Tag(
   id_artwork INT,
   id_tag INT,
   PRIMARY KEY(id_artwork, id_tag),
   FOREIGN KEY(id_artwork) REFERENCES Artwork(id_artwork),
   FOREIGN KEY(id_tag) REFERENCES Tag(id_tag)
);

CREATE TABLE Exhibition_Artwork(
   id_artwork INT,
   id_exhibition INT,
   PRIMARY KEY(id_artwork, id_exhibition),
   FOREIGN KEY(id_artwork) REFERENCES Artwork(id_artwork),
   FOREIGN KEY(id_exhibition) REFERENCES Exhibition(id_exhibition)
);

CREATE TABLE Member_Discipline(
   id_member INT,
   id_discipline INT,
   PRIMARY KEY(id_member, id_discipline),
   FOREIGN KEY(id_member) REFERENCES Member_(id_member),
   FOREIGN KEY(id_discipline) REFERENCES Discipline(id_discipline)
);

CREATE TABLE Review(
   id_member INT,
   id_artwork INT,
   rating INT,
   comment TEXT,
   review_date DATETIME,
   PRIMARY KEY(id_member, id_artwork),
   FOREIGN KEY(id_member) REFERENCES Member_(id_member),
   FOREIGN KEY(id_artwork) REFERENCES Artwork(id_artwork)
);

CREATE TABLE Booking(
   id_member INT,
   id_workshop INT,
   booking_date DATETIME,
   payment_status ENUM('pending', 'paid', 'cancelled'),
   PRIMARY KEY(id_member, id_workshop),
   FOREIGN KEY(id_member) REFERENCES Member_(id_member),
   FOREIGN KEY(id_workshop) REFERENCES Workshop(id_workshop)
);