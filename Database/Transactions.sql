USE artconnect;

-- Register a user to multiple workshops 
DELIMITER //
CREATE PROCEDURE Register_To_Multiple_Workshops(
    IN p_id_member INT,
    IN p_id_workshop1 INT,
    IN p_id_workshop2 INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
    CALL Register_Member_To_Workshop(p_id_member, p_id_workshop1);
    CALL Register_Member_To_Workshop(p_id_member, p_id_workshop2);
    COMMIT;
END //
DELIMITER ;