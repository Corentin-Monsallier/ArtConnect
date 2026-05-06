USE artconnect;

-- ==============================
-- TEST 1: SUCCESSFUL TRANSACTION
-- ==============================
-- 1. Check bookings for member 5
SELECT 'Before Test 1' AS Status;
SELECT * FROM Booking WHERE id_member = 5;

-- 2. Execute the workshop registration
CALL Register_To_Multiple_Workshops(5, 1, 2);

-- 3. Verify that bookings exist
SELECT 'After Test 1 (Success)' AS Status;
SELECT * FROM Booking WHERE id_member = 5;


-- ==============================
-- TEST 2: FAILURE & ROLLBACK
-- ==============================
-- 1. Check bookings for member 6
SELECT * FROM Booking WHERE id_member = 6;

-- 2. Execute the workshop registration
CALL Register_To_Multiple_Workshops(6, 3, 999); 

-- 3. Verify that bookings don't exist
SELECT * FROM Booking WHERE id_member = 6;