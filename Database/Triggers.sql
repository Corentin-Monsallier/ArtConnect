USE artconnect;

-- Rating between 1 and 5
DELIMITER // 
CREATE TRIGGER rating_range 
BEFORE INSERT ON review 
FOR EACH ROW 
BEGIN 
    IF NEW.rating > 5 OR NEW.rating < 1 THEN 
        SIGNAL SQLSTATE '45000'  
        SET MESSAGE_TEXT = 'Error: rating must be between 1 and 5!'; 
    END IF; 
END; // 
DELIMITER ; 

-- End date >= Start date 
DELIMITER // 
CREATE TRIGGER start_end_date 
BEFORE INSERT ON Exhibition 
FOR EACH ROW 
BEGIN 
    IF NEW.end_date < NEW.start_date THEN 
        SIGNAL SQLSTATE '45000'  
        SET MESSAGE_TEXT = 'Error: the end date must not be before the start date!'; 
    END IF; 
END; // 
DELIMITER ; 

-- Booking possible only if max_participant not reach 
DELIMITER // 
CREATE TRIGGER available_booking 
BEFORE INSERT ON Booking 
FOR EACH ROW 
BEGIN 
    DECLARE max_capacity INT; 
    DECLARE current_bookings INT; 
    -- max capacity of the workshop 
    SELECT max_participants 
    INTO max_capacity 
    FROM Workshop 
    WHERE id_workshop = NEW.id_workshop; 
    -- current booked participants 
    SELECT COUNT(*) 
    INTO current_bookings  
    FROM Booking 
    WHERE id_workshop = NEW.id_workshop 
    AND payment_status != 'cancelled'; 
    IF current_bookings >= max_capacity THEN 
        SIGNAL SQLSTATE '45000'  
        SET MESSAGE_TEXT = 'Error: no available places left for this workshop!'; 
    END IF; 
END; // 
DELIMITER ; 