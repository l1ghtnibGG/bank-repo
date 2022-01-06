alter PROCEDURE AddMoney 
AS
BEGIN

DECLARE @SUM INT
SET @SUM = 10;

	SELECT Clients.LastName, Clients.FirstName, ClientsBank.Balance + @SUM   
	FROM  Clients 
		JOIN ClientsBank ON ClientsBank.ClientId = Clients.Id
	WHERE Clients.SocialStatId = 1
END;