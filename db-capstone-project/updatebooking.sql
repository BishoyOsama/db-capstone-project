DELIMITER //
/*CREATE PROCEDURE UpdateBooking(IN TableNumber INT, IN booking_date DATE)
BEGIN
    UPDATE Bookings SET BookingDate= booking_date WHERE TableNo= TableNumber;
END //
*/
DELIMITER ;

#CALL UpdateBooking(9,"2022-12-18")