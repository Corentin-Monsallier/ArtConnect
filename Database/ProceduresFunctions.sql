USE artconnect;

-- Return the number of participant for a workshop
DELIMITER // 
CREATE FUNCTION F_Nb_Participants_Count(p_id_workshop INT) 
RETURNS INT 
DETERMINISTIC 
BEGIN 
    DECLARE f_total INT; 
    SELECT COUNT(*) 
    INTO f_total 
    FROM Booking 
    WHERE id_workshop = p_id_workshop 
      AND payment_status != 'cancelled';
    RETURN f_total; 
END // 
DELIMITER ;

-- Creation of a workshop
DELIMITER //
CREATE PROCEDURE Create_Workshop (
    IN p_title VARCHAR(100),
    IN p_date DATETIME,
    IN p_duration INT,
    IN p_max_participants INT,
    IN p_price DECIMAL(10,2),
    IN p_level VARCHAR(50),
    IN p_location VARCHAR(50),
    IN p_description TEXT,
    IN p_id_artist INT
)
BEGIN
    INSERT INTO Workshop (
        title_workshop, 
        date_workshop, 
        duration_minutes, 
        max_participants, 
        price, 
        level, 
        location, 
        description, 
        id_artist
    )
    VALUES (
        p_title, 
        p_date, 
        p_duration, 
        p_max_participants, 
        p_price, 
        p_level, 
        p_location, 
        p_description, 
        p_id_artist
    );
END //
DELIMITER ;

-- Creation of an exibition
DELIMITER //
CREATE PROCEDURE Create_Exhibition (
    IN p_title_exhib VARCHAR(100),
    IN p_curator_name VARCHAR(50),
    IN p_start_date DATE,
    IN p_end_date DATE,
    IN p_theme VARCHAR(50),
    IN p_description TEXT,
    IN p_id_gallery INT
)
BEGIN
    INSERT INTO Exhibition (
        title_exhib, 
        curator_name, 
        start_date, 
        end_date, theme, 
        description, 
        id_gallery
    )
    VALUES (
        p_title_exhib, 
        p_curator_name, 
        p_start_date, 
        p_end_date, 
        p_theme, 
        p_description, 
        p_id_gallery
    );
END //
DELIMITER ;

-- Count remaining spots in workshop
DELIMITER //
CREATE PROCEDURE Check_Workshop_Capacity(IN p_id_workshop INT)
BEGIN
    DECLARE p_max INT;
    DECLARE p_current INT;
    -- max capacity of the workshop 
    SELECT COUNT(*) 
    INTO p_current 
    FROM Booking 
    WHERE id_workshop = p_id_workshop 
    AND payment_status != 'cancelled';
    -- current booked participants 
    SELECT COUNT(*) 
    INTO p_current 
    FROM Booking 
    WHERE id_workshop = p_id_workshop 
    AND payment_status != 'cancelled';
    -- remaining spots
    SELECT 
        p_max AS Capacity, 
        p_current AS Booked, 
        (p_max - p_current) AS Spots_Left;
END //
DELIMITER ;

-- Register a member in a workshop 
DELIMITER //
CREATE PROCEDURE Register_Member_To_Workshop(
    IN p_id_member INT,
    IN p_id_workshop INT
)
BEGIN
    DECLARE p_current_participants INT;
    DECLARE p_max_places INT;
    -- current booked participants 
    SELECT COUNT(*) 
    INTO p_current_participants 
    FROM Booking 
    WHERE id_workshop = p_id_workshop 
    AND payment_status != 'cancelled';
    -- maximum participants
    SELECT max_participants INTO p_max_places 
    FROM Workshop 
    WHERE id_workshop = p_id_workshop;
    IF p_current_participants < p_max_places THEN
        INSERT INTO Booking(id_member, id_workshop, booking_date, payment_status)
        VALUES(p_id_member, p_id_workshop, NOW(), 'pending');
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Operation Error: no available places left for this workshop!';
    END IF;
END //
DELIMITER ;