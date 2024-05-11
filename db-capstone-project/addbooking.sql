DELIMITER //
/*CREATE PROCEDURE AddBooking(Booking_id INT, Customer_id INT, TableNumber INT, Date DATE)
BEGIN
	INSERT INTO Bookings(BookingID, TableNo, CustomerID, Time, StaffID, BookingDate)
	VALUES(Booking_id, TableNumber, Customer_id, "19:00:00",1, Date);
END //
*/
DELIMITER ;

#CALL AddBooking(9,3,4,"2022-12-30");
