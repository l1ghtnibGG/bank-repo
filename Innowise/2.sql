SELECT Clients.LastName, Clients.FirstName, Clients.Patronymic, BankBalance.Balance, BankBalance.BankName
FROM Clients 
	JOIN (SELECT CardBalance.Balance as Balance, Banks.BankName, CardBalance.ClientId
			FROM CardBalance
			JOIN Banks ON CardBalance.BankId = Banks.Id) AS BankBalance
ON Clients.Id = BankBalance.ClientId;