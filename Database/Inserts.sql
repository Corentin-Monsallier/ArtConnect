USE artconnect;

INSERT INTO User_ (name_user, email, birth_year, phone, city, password_user, role_user) VALUES
('Alice Dupont', 'alice@example.com', 1985, '0600000001', 'Paris', 'alice123', 'MEMBER'),
('Marc Leroy', 'marc@example.com', 1990, '0600000002', 'Lyon', 'marc123', 'ARTIST'),
('Sophie Martin', 'sophie@example.com', 1998, '0600000003', 'Marseille', 'sophie123', 'MEMBER'),
('John Becker', 'john@example.com', 1982, '0600000004', 'Berlin', 'john123', 'ARTIST'),
('Emma Rossi', 'emma@example.com', 1995, '0600000005', 'Rome', 'emma123', 'MEMBER'),
('Paul Durand', 'paul@example.com', 2000, '0600000006', 'Paris', 'paul123', 'MEMBER'),
('Laura Chen', 'laura@example.com', 1997, '0600000007', 'Paris', 'laura123', 'ARTIST'),
('Hugo Bernard', 'hugo@example.com', 1988, '0600000008', 'Lille', 'hugo123', 'MEMBER'),
('Nina Kovac', 'nina@example.com', 1993, '0600000009', 'Zagreb', 'nina123', 'ARTIST'),
('Carlos Mendez', 'carlos@example.com', 1987, '0600000010', 'Madrid', 'carlos123', 'MEMBER'),

('Julia Stein', 'julia@example.com', 1994, '0600000011', 'Vienna', 'julia123', 'ARTIST'),
('Tom Richards', 'tom@example.com', 1991, '0600000012', 'London', 'tom123', 'MEMBER'),
('Mia Lopez', 'mia@example.com', 1999, '0600000013', 'Barcelona', 'mia123', 'MEMBER'),
('Louis Petit', 'louis@example.com', 2001, '0600000014', 'Paris', 'louis123', 'MEMBER'),
('Sarah Kim', 'sarah@example.com', 1996, '0600000015', 'Seoul', 'sarah123', 'ARTIST'),
('Ivan Petrov', 'ivan@example.com', 1984, '0600000016', 'Moscow', 'ivan123', 'ARTIST'),
('Elena Costa', 'elena@example.com', 1992, '0600000017', 'Lisbon', 'elena123', 'MEMBER'),
('David Green', 'david@example.com', 1989, '0600000018', 'Dublin', 'david123', 'MEMBER'),
('Yuki Tanaka', 'yuki@example.com', 1997, '0600000019', 'Tokyo', 'yuki123', 'ARTIST'),
('Anna Müller', 'anna@example.com', 1993, '0600000020', 'Munich', 'anna123', 'ADMIN');

INSERT INTO Artist(bio, website_artist, is_active, id_user) VALUES
('Abstract painter', 'https://alice-art.com', TRUE, 1),
('Metal sculptor', 'https://marc-sculpt.com', FALSE, 2),
('Digital artist', 'https://sophie-digital.com', TRUE, 3),
('Street photographer', 'https://john-photo.com', TRUE, 4),
('Ceramic artist', 'https://emma-ceramics.com', FALSE, 5),
('Mixed media creator', 'https://paul-mixed.com', FALSE, 6),
('Illustrator', 'https://laura-illustration.com', TRUE, 7),
('Glass sculptor', 'https://hugo-glass.com', TRUE, 8),
('AI art researcher', 'https://nina-aiart.com', TRUE, 9),
('Experimental painter', 'https://carlos-exp.com', TRUE, 10);

INSERT INTO Member_(membership_type, id_user) VALUES
('premium', 11),
('standard', 12),
('premium', 13),
('standard', 14),
('premium', 15),
('standard', 16),
('premium', 17),
('standard', 18),
('premium', 19),
('standard', 20);

INSERT INTO Discipline(name_discipline) VALUES
('Painting'),
('Sculpture'),
('Digital Art'),
('Photography'),
('Mixed Media'),
('Ceramics'),
('Illustration'),
('Glass Art'),
('AI Art'),
('Street Art');

INSERT INTO Artist_Discipline(id_artist, id_discipline) VALUES
(1,1),(1,5),
(2,2),
(3,3),(3,9),
(4,4),(4,10),
(5,6),
(6,5),
(7,7),
(8,8),
(9,9),
(10,1),(10,10);

INSERT INTO Tag(name) VALUES
('abstract'),
('nature'),
('portrait'),
('modern'),
('experimental'),
('urban'),
('minimalist'),
('vibrant'),
('monochrome'),
('surreal');

INSERT INTO Artwork(title_art, creation_year, type, medium, dimensions, description, price, status, id_artist) VALUES
('Blue Horizon', 2020, 'painting', 'oil', '80x60', 'Abstract blue landscape', 1200, 'available', 1),
('Steel Rebirth', 2021, 'sculpture', 'metal', '150x50x50', 'Recycled steel sculpture', 3500, 'sold', 2),
('Neon Dreams', 2023, 'digital', 'digital print', '1920x1080', 'AI neon cityscape', 600, 'available', 3),
('Urban Shadows', 2019, 'photo', 'digital', '4000x3000', 'Street photography', 400, 'available', 4),
('Clay Echoes', 2022, 'ceramic', 'clay', '30x30', 'Handmade ceramic bowl', 250, 'sold', 5),
('Color Storm', 2021, 'painting', 'acrylic', '100x70', 'Vibrant abstract', 1500, 'reserved', 1),
('Glass Bloom', 2020, 'sculpture', 'glass', '40x40x40', 'Glass flower sculpture', 2000, 'available', 8),
('AI Mirage', 2023, 'digital', 'AI render', '1920x1080', 'AI surreal landscape', 700, 'available', 9),
('Ink Whispers', 2022, 'illustration', 'ink', 'A4', 'Minimalist ink drawing', 300, 'available', 7),
('Red Pulse', 2024, 'painting', 'oil', '90x70', 'Experimental red tones', 1800, 'available', 10);

INSERT INTO Artwork_Tag(id_artwork, id_tag) VALUES
(1,1),(1,8),
(2,2),
(3,4),(3,5),
(4,6),(4,9),
(5,2),
(6,1),(6,8),
(7,7),
(8,10),
(9,7),
(10,4),(10,5);

INSERT INTO City(city, code, country) VALUES
('Paris',75000,'France'),
('Lyon',69000,'France'),
('Berlin',10115,'Germany'),
('Rome',100,'Italy'),
('Madrid',28000,'Spain'),
('Vienna',1010,'Austria'),
('London',1000,'UK'),
('Tokyo',100,'Japan'),
('Lisbon',1100,'Portugal'),
('Munich',80000,'Germany');

INSERT INTO Address(number, street, id_city) VALUES
(12,'Rue de Rivoli',1),
(5,'Avenue Lumière',2),
(44,'Unter den Linden',3),
(8,'Via Roma',4),
(22,'Calle Mayor',5),
(19,'Ringstrasse',6),
(101,'Baker Street',7),
(3,'Shibuya Crossing',8),
(77,'Rua Augusta',9),
(55,'Marienplatz',10);

INSERT INTO Gallery(name_gallery, rating, website_gallery, address_id) VALUES
('Galerie Lumière',5,'https://galerie1.com',1),
('ModernArt Space',4,'https://gallery2.com',2),
('Berlin Art Hub',5,'https://gallery3.com',3),
('Roma Creativa',3,'https://gallery4.com',4),
('Madrid Vision',4,'https://gallery5.com',5),
('Vienna Kunst',5,'https://gallery6.com',6),
('London Modern',4,'https://gallery7.com',7),
('Tokyo NeoArt',5,'https://gallery8.com',8),
('Lisbon Colors',4,'https://gallery9.com',9),
('Munich Studio',3,'https://gallery10.com',10);

INSERT INTO Gallery_Hours(id_gallery, day_of_week, open_time, close_time) VALUES
(1,'Monday','10:00','18:00'),
(1,'Tuesday','10:00','18:00'),
(2,'Wednesday','11:00','19:00'),
(3,'Thursday','10:00','20:00'),
(4,'Friday','09:00','17:00'),
(5,'Saturday','11:00','21:00'),
(6,'Sunday','12:00','18:00'),
(7,'Monday','10:00','18:00'),
(8,'Tuesday','10:00','18:00'),
(9,'Wednesday','11:00','19:00');

INSERT INTO Exhibition(title_exhib, curator_name, start_date, end_date, theme, description, id_gallery) VALUES
('Shades of Blue','Claire Monet','2024-03-01','2024-04-15','Color','Blue tones',1),
('Future Visions','Hans Weber','2024-05-10','2024-06-20','Digital','Tech art',2),
('Urban Pulse','Maria Rossi','2024-02-01','2024-03-10','Street','Urban scenes',3),
('Clay Stories','Luca Bianchi','2024-01-05','2024-02-28','Ceramics','Clay works',4),
('Glass Universe','Anna Schmidt','2024-04-01','2024-05-30','Glass','Glass sculptures',5),
('AI Horizons','Nina Kovac','2024-06-01','2024-07-15','AI','AI artworks',6),
('Red Spectrum','Carlos Mendez','2024-07-01','2024-08-20','Color','Red tones',7),
('Minimal Lines','Laura Chen','2024-03-15','2024-04-30','Minimalism','Ink drawings',8),
('Organic Forms','Emma Rossi','2024-05-01','2024-06:10','Nature','Organic shapes',9),
('Digital Dreams','Sophie Martin','2024-08-01','2024-09-15','Digital','AI and digital art',10);

INSERT INTO Exhibition_Artwork(id_artwork, id_exhibition) VALUES
(1,1),(6,1),
(3,2),(8,2),
(4,3),
(5,4),
(7,5),
(8,6),
(10,7),
(9,8),
(6,9),
(3,10),(8,10);

INSERT INTO Workshop(title_workshop, date_workshop, duration_minutes, max_participants, price, level, location, description, id_artist) VALUES
('Intro to Abstract', '2024-07-10 14:00',120,12,80,'beginner','Paris','Basics of abstract art',1),
('Metal Basics', '2024-08-05 10:00',180,8,120,'intermediate','Lyon','Metal sculpting',2),
('AI Art Creation', '2024-09-12 16:00',90,20,60,'all','Online','AI tools',3),
('Street Photo Walk', '2024-06-20 09:00',120,15,50,'all','Berlin','Street photography',4),
('Ceramic Workshop', '2024-05-15 14:00',150,10,70,'beginner','Rome','Clay basics',5),
('Mixed Media Lab', '2024-07-22 11:00',180,12,90,'intermediate','Paris','Mixed media',6),
('Ink Illustration', '2024-08-01 13:00',120,10,65,'beginner','Paris','Ink drawing',7),
('Glass Art Intro', '2024-09-05 10:00',180,8,150,'advanced','Lille','Glass sculpting',8),
('AI Landscapes', '2024-10-01 15:00',90,20,60,'all','Online','AI landscapes',9),
('Experimental Painting', '2024-11-10 10:00',150,12,100,'intermediate','Madrid','Experimental painting',10);

INSERT INTO Booking(id_member, id_workshop, booking_date, payment_status) VALUES
(1,1,'2024-06-01','paid'),
(2,1,'2024-06-02','pending'),
(3,2,'2024-07-01','paid'),
(4,3,'2024-08-01','paid'),
(5,4,'2024-06-10','paid'),
(6,5,'2024-05-01','cancelled'),
(7,6,'2024-07-10','paid'),
(8,7,'2024-07-20','pending'),
(9,8,'2024-08-15','paid'),
(10,9,'2024-09-20','paid');

INSERT INTO Member_Discipline(id_member, id_discipline) VALUES
(1,1),(1,3),
(2,2),
(3,4),
(4,1),(4,5),
(5,6),
(6,7),
(7,9),
(8,10),
(9,3),
(10,4);

INSERT INTO Review(id_member, id_artwork, rating, comment, review_date) VALUES
(1,1,5,'Amazing colors','2024-03-12'),
(2,2,4,'Great sculpture','2024-04-01'),
(3,3,5,'Inspiring digital art','2024-05-20'),
(4,4,3,'Nice photo','2024-06-02'),
(5,5,4,'Beautiful ceramics','2024-06-10'),
(6,6,5,'Vibrant and energetic','2024-07-01'),
(7,7,4,'Unique glass work','2024-07-15'),
(8,8,5,'AI masterpiece','2024-08-01'),
(9,9,4,'Minimalist and elegant','2024-08-20'),
(10,10,5,'Bold and experimental','2024-09-01');

INSERT INTO Artist_Social(platform, link, id_artist) VALUES
('Instagram', 'https://instagram.com/alice.art', 1),
('Twitter', 'https://twitter.com/alice_art', 1),
('Instagram', 'https://instagram.com/marc.sculpt', 2),
('YouTube', 'https://youtube.com/marcsculptor', 2),
('Instagram', 'https://instagram.com/sophie.digital', 3),
('Behance', 'https://behance.net/sophie-martin', 3),
('Instagram', 'https://instagram.com/john.photo', 4),
('Flickr', 'https://flickr.com/johnbecker', 4),
('Instagram', 'https://instagram.com/emma.ceramics', 5),
('Instagram', 'https://instagram.com/paul.mixedmedia', 6),
('Pinterest', 'https://pinterest.com/paulmixed', 6),
('Instagram', 'https://instagram.com/laura.illustration', 7),
('Behance', 'https://behance.net/laura-chen', 7),
('Instagram', 'https://instagram.com/hugo.glass', 8),
('Instagram', 'https://instagram.com/nina.aiart', 9),
('LinkedIn', 'https://linkedin.com/in/nina-kovac', 9),
('Instagram', 'https://instagram.com/carlos.experimental', 10),
('YouTube', 'https://youtube.com/carlosmendezart', 10);
