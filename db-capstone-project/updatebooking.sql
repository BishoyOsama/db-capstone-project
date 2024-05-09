DELIMITER //
/*CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN booking_date DATE)
BEGIN
	DECLARE affected_rows INT;
    UPDATE Bookings SET BookingDate= booking_date WHERE BookingID= booking_id;
    
    SELECT ROW_COUNT() INTO affected_rows;
    
    IF affected_rows > 0 THEN
		SELECT CONCAT("Booking ", booking_id, " Updated") AS Confirmation;
    ELSE
		SELECT CONCAT("Booking ", booking_id, " Failed") AS Issues;
    END IF;    
END //
*/
DELIMITER ;

#CALL UpdateBooking(9,"2022-12-18")