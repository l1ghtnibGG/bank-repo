alter PROCEDURE AddMoney 
AS
BEGIN
	SELECT Clients.LastName, Clients.FirstName, ClientsBank.Balance + 10   
	FROM  Clients 
		JOIN ClientsBank ON ClientsBank.ClientId = Clients.Id
	WHERE Clients.SocialStatId = 1
END;