SELECT (SUM(ClientsBank.Balance) - SUM(CardBalance.Balance)) AS Differents
FROM CardBalance
	JOIN ClientsBank ON CardBalance.ClientId = ClientsBank.ClientId
WHERE (ClientsBank.Balance - CardBalance.Balance) != 0;