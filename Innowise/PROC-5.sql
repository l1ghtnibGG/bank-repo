USE Innowise
GO
ALTER PROCEDURE AddMoney AS
BEGIN

SELECT Clients.LastName, Clients.FirstName, Banks.NameOfBank, Banks.Balance + 10   
FROM  Banks 
	JOIN Clients ON Clients.Id = Banks.Id
WHERE Clients.Status = 'Трудоспособный'
 
END