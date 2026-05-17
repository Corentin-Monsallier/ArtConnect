USE artconnect;

CREATE INDEX idx_artwork
ON Artwork(id_artwork);

CREATE INDEX idx_artist
ON Artist(id_artist);

CREATE INDEX idx_member
ON Member_(id_member);

CREATE INDEX idx_ar_member  
ON Artwork_Reservation(id_member);

CREATE INDEX idx_ar_artwork 
ON Artwork_Reservation(id_artwork);
 
