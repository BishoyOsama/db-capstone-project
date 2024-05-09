/*CREATE PROCEDURE CancelBooking(IN booking_id INT)
BEGIN
	DECLARE affected_rows INT;
    DELETE FROM Bookings WHERE BookingID= booking_id;
    
    SELECT ROW_COUNT() INTO affected_rows;
    
    IF affected_rows > 0 THEN
		SELECT CONCAT("Booking ", booking_id, " Cancelled") AS Confirmation;
    ELSE
		SELECT CONCAT("Booking ", booking_id, " Cancelation failed") AS Issues;
    END IF;    
END //
*/
DELIMITER ;

#CALL CancelBooking(9)