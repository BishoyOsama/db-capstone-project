DELIMITER //
/*CREATE PROCEDURE CheckBooking(Date DATE, TableNumber INT)
BEGIN
	DECLARE ExistsCount INT;
    SELECT COUNT(TableNo)
    INTO ExistSCount
    FROM Bookings
    WHERE BookingDate= Date AND TableNo= TableNumber;
    
    IF ExistsCount > 0 THEN
		SELECT CONCAT("Table ", TableNumber, " is already booked") AS BookingStatus;
	ELSE
		SELECT CONCAT("Booking at table ", TableNumber, " is available") AS BookingStatus;
    END IF;    
END //
*/
DELIMITER ;

#CALL CheckBooking("2022-11-12", 3)