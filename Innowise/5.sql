EXEC AddMoney 1, 10

SELECT Clients.LastName, Clients.FirstName, ClientsBank.Balance, Clients.SocialStatId   
	FROM  Clients 
		JOIN ClientsBank ON ClientsBank.ClientId = Clients.Id