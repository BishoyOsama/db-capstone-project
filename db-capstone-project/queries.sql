#SELECT Customers.CustomerID, CONCAT(Customers.FirstName, " ", Customers.LastName) AS FullName,
#Orders.OrderID, Orders.TotalCost, Menus.Cuisine, MenuItems.Name
#FROM Bookings INNER JOIN Customers ON Customers.CustomerID = Bookings.CustomerID
#INNER JOIN Orders ON  Bookings.BookingID = Orders.BookingID
#INNER JOIN Menus ON Menus.MenuID = Orders.MenuID
#INNER JOIN MenuItems ON Menus.ItemID = MenuItems.ItemID
#ORDER BY Orders.TotalCost

#SELECT Cuisine FROM Menus WHERE MenuID = ANY (SELECT MenuID FROM Orders WHERE Quantity > 2) 

#CREATE PROCEDURE GetMaxQuantity()
#SELECT MAX(Quantity) AS "Max Quantity in Order" FROM Orders

#CALL GetMaxQuantity()

#PREPARE GetBookingDetail FROM "SELECT * FROM Bookings WHERE CustomerID= ?"
#SET @id= 1;
#EXECUTE GetBookingDetail USING @id;

DELIMITER //
#CREATE PROCEDURE CancelOrder(IN id INT)
#BEGIN
#DELETE FROM Orders WHERE OrderID= id;
#SELECT CONCAT("Order ", id, " is cancelled") AS Confirmation;
#END //


DELIMITER ;

#CALL CancelOrder(5)
#SELECT BookingID,BookingDate ,TableNo, CustomerID FROM Bookings LIMIT 4

DELIMITER //
#CREATE PROCEDURE CheckBooking(Date DATE, TableNumber INT)
#BEGIN
#	DECLARE ExistsCount INT;
#    SELECT COUNT(TableNo)
#    INTO ExistSCount
#    FROM Bookings
#    WHERE BookingDate= Date AND TableNo= TableNumber;
    
#    IF ExistsCount > 0 THEN
#		SELECT CONCAT("Table ", TableNumber, " is already booked") AS BookingStatus;
#	ELSE
#		SELECT CONCAT("Booking at table ", TableNumber, " is available") AS BookingStatus;
#    END IF;    
#END //

DELIMITER ;

#CALL CheckBooking("2022-11-12", 3)


DELIMITER //
/*CREATE PROCEDURE AddValidBooking(Date DATE, TableNumber INT,Customer INT)
BEGIN
	DECLARE Counter INT;
	START TRANSACTION;
    
    INSERT INTO Bookings(TableNo, BookingDate, CustomerID, StaffID, Time)
    VALUES(TableNumber, Date, Customer, 1, "19:00:00");
    
    SELECT COUNT(TableNo)
    INTO Counter
    FROM Bookings
    WHERE BookingDate= Date AND TableNo= TableNumber;
    
    IF Counter > 1 THEN
		ROLLBACK;
        SELECT CONCAT("Table ", TableNumber, " is already booked - booking cancelled") AS BookingStatus;
    ELSE
		COMMIT;
		SELECT CONCAT("Table ", TableNumber, " booked successfully") AS BookingStatus;
    END IF;    
END //
*/
DELIMITER ;

#CALL AddValidBooking("2022-12-17", 6, 5)

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

DELIMITER //
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
