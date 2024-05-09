DELIMITER //
/*CREATE PROCEDURE AddBooking(Booking_id INT, Customer_id INT, TableNumber INT, Date DATE)
BEGIN
	DECLARE affected_rows INT;
	INSERT INTO Bookings(BookingID, TableNo, CustomerID, Time, StaffID, BookingDate)
	VALUES(Booking_id, TableNumber, Customer_id, "19:00:00",1, Date);
    
    SELECT ROW_COUNT() INTO affected_rows;
    
    IF affected_rows > 0 THEN
		SELECT "New booking added" AS Confirmation;
    ELSE
		SELECT "addition error" AS Issue;
    END IF;    
END //
*/
DELIMITER ;

#CALL AddBooking(9,3,4,"2022-12-30");