USE artconnect;

DELIMITER //

CREATE PROCEDURE RegisterToMultipleWorkshops(
    IN p_id_member INT,
    IN p_id_workshop1 INT,
    IN p_id_workshop2 INT
)
BEGIN
    START TRANSACTION;
    CALL RegisterMemberToWorkshop(p_id_member, p_id_workshop1);
    CALL RegisterMemberToWorkshop(p_id_member, p_id_workshop2);
    COMMIT;
END //

DELIMITER ;