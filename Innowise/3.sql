SELECT PERSON.LastName, PERSON.FirstName, BANK.BanksName, PERSON.Differents
FROM 
(SELECT Banks.BanksName, ClientsBank.ClientId
		FROM Banks JOIN ClientsBank ON ClientsBank.BankId = Banks.Id) AS BANK 

		JOIN (SELECT Clients.FirstName, Clients.LastName, DIFF.Differents, Clients.Id FROM Clients 
		JOIN (SELECT ClientsBank.ClientId, (SUM(ClientsBank.Balance) - SUM(CardBalance.Balance)) AS Differents
		FROM CardBalance
		JOIN ClientsBank ON CardBalance.ClientId = ClientsBank.ClientId and (ClientsBank.Balance - CardBalance.Balance) != 0
		group by ClientsBank.ClientId) AS DIFF ON Clients.Id = DIFF.ClientId

WHERE DIFF.Differents != 0) AS PERSON
ON PERSON.Id = BANK.ClientId;