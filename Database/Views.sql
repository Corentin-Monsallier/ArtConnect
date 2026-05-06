USE artconnect;

-- Artwork by artist 
CREATE VIEW V_Artwork_By_Artist AS
SELECT 
    a.id_artist,
    u.name_user AS artist_name,
    aw.id_artwork,
    aw.title_art,
    aw.creation_year,
    aw.type,
    aw.price,
    aw.status
FROM Artwork aw
JOIN Artist a ON aw.id_artist = a.id_artist
JOIN User_ u ON a.id_user = u.id_user
ORDER BY a.id_artist, aw.id_artwork;

-- Artworks by discipline 
CREATE VIEW V_Artworks_By_Discipline AS 
SELECT  
    d.id_discipline, 
    d.name_discipline, 
    a.id_artwork, 
    a.title_art 
FROM Discipline d 
JOIN Artist_Discipline ad ON d.id_discipline = ad.id_discipline 
JOIN Artist ar ON ad.id_artist = ar.id_artist 
JOIN Artwork a ON ar.id_artist = a.id_artist; 

-- Artworks by review
CREATE VIEW V_Artwork_By_Review  AS 
SELECT 
    a.id_artwork, 
    a.title_art, 
    a.creation_year, 
    a.type, 
    a.medium, 
    a.dimensions, 
    a.description, 
    a.price, 
    a.status, 
    r.rating, 
    r.comment, 
    r.review_date, 
    r.id_member, 
    u.name_user 
FROM Review r  
JOIN Artwork a ON r.id_artwork = a.id_artwork 
JOIN Member_ m ON r.id_member = m.id_member 
JOIN User_ u ON m.id_user = u.id_user
ORDER BY r.rating;

-- Average price of the artworks of an artist 
CREATE VIEW V_Avg_Artwork_Price AS
SELECT 
    a.id_artist,
    u.name_user AS artist_name,
    AVG(aw.price) AS avg_price,
    COUNT(aw.id_artwork) AS artwork_count
FROM Artist a
JOIN User_ u ON a.id_user = u.id_user
JOIN Artwork aw ON aw.id_artist = a.id_artist
GROUP BY a.id_artist
ORDER BY a.id_artist;

-- Reviews by artwork
CREATE VIEW V_Review_By_Artwork AS 
SELECT a.id_artwork, a.title_art, a.creation_year, a.type, a.medium, 
		a.dimensions, 
        a.description, 
        a.price, 
        a.status, 
        r.rating, 
        r.comment, 
        r.review_date, 
        r.id_member, 
        u.name_user 
FROM Review r  
JOIN Artwork a ON r.id_artwork = a.id_artwork 
JOIN Member_ m ON r.id_member = m.id_member 
JOIN User_ u ON m.id_user = u.id_user; 

-- Workshop by availability (booking) 
CREATE VIEW V_Workshop_Availability AS 
SELECT  
    w.id_workshop, 
    w.title_workshop, 
    w.max_participants, 
    COUNT(b.id_member) AS total_bookings, 
    (w.max_participants - COUNT(b.id_member)) AS remaining_spots, 
    CASE  
        WHEN COUNT(b.id_member) < w.max_participants THEN 'available' 
        ELSE 'full' 
    END AS availability_status 
FROM Workshop w 
JOIN Booking b  
    ON w.id_workshop = b.id_workshop 
    AND b.payment_status <> 'cancelled' 
GROUP BY  
    w.id_workshop, 
    w.title_workshop, 
    w.max_participants; 

-- Members in Workshop
CREATE VIEW V_Workshop_Participants AS
SELECT 
    w.id_workshop,
    w.title_workshop,
    m.id_member,
    u.name_user AS participant_name,
    b.payment_status,
    b.booking_date
FROM Booking b
JOIN Workshop w ON b.id_workshop = w.id_workshop
JOIN Member_ m ON b.id_member = m.id_member
JOIN User_ u ON m.id_user = u.id_user
WHERE b.payment_status <> 'cancelled';

-- Count workshops done already by 1 artist 
CREATE VIEW V_Artist_Workshop_Count  AS 
SELECT 
	a.id_artist,
    u.name_user AS artist_name,
    COUNT(w.id_workshop) AS past_workshops
FROM Artist a 
JOIN User_ u ON a.id_user = u.id_user 
JOIN Workshop w ON a.id_artist = w.id_artist AND w.date_workshop < NOW()
GROUP BY id_artist, u.name_user;

-- Artist by exhibition 
CREATE VIEW V_Artist_By_Exhibition AS
SELECT 
    e.id_exhibition,
    e.title_exhib,
    a.id_artist,
    u.name_user AS artist_name,
    COUNT(ea.id_artwork) AS artworks_in_exhibition
FROM Exhibition e
JOIN Exhibition_Artwork ea ON e.id_exhibition = ea.id_exhibition
JOIN Artwork aw ON ea.id_artwork = aw.id_artwork
JOIN Artist a ON aw.id_artist = a.id_artist
JOIN User_ u ON a.id_user = u.id_user
GROUP BY e.id_exhibition, a.id_artist
ORDER BY e.id_exhibition, a.id_artist;

-- Available exhibition by gallery 
CREATE VIEW V_Available_Exhibitions_By_Gallery  AS 
SELECT  
    g.id_gallery, 
    g.name_gallery, 
    e.id_exhibition, 
    e.title_exhib, 
    e.start_date, 
    e.end_date, 
    e.theme 
FROM Exhibition e 
JOIN Gallery g ON e.id_gallery = g.id_gallery 
WHERE CURDATE() BETWEEN e.start_date AND e.end_date; 

-- Artist associated with their social(s)
CREATE VIEW V_Artist_Social AS
SELECT 
    a.id_artist,
    u.name_user AS artist_name,
    s.platform,
    s.link AS social_link
FROM Artist a
JOIN User_ u ON a.id_user = u.id_user
JOIN Artist_Social s ON a.id_artist = s.id_artist;

-- Regroup info on users
CREATE VIEW V_User_Info  AS 
SELECT 
	u.id_user, 
    u.name_user, 
    u.email, 
    u.birth_year, 
    u.phone, 
    u.city, 
    m.membership_type,
    m.id_member 
FROM User_ u 
JOIN Member_ m ON u.id_user = m.id_user; 