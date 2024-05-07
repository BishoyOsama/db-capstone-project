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
SELECT * FROM OrdersView