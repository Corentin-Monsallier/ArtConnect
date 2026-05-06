USE artconnect;

CREATE INDEX idx_artwork
ON Artwork(id_artwork);

CREATE INDEX idx_artist
ON Artist(id_artist);

CREATE INDEX idx_member
ON Member_(id_member);