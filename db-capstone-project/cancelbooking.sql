DELIMITER //
/*CREATE PROCEDURE CancelBooking(IN TableNumber INT)
BEGIN
    DELETE FROM Bookings WHERE TableNo= TableNumber;
END //
*/
DELIMITER ;

#CALL CancelBooking(9)
