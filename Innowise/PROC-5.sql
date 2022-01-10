alter PROCEDURE AddMoney 
	@SOCID INT,
	@SUM DECIMAL
 
AS
BEGIN
UPDATE ClientsBank
 SET ClientsBank.Balance = ClientsBank.Balance + @SUM
 FROM 
	(SELECT Clients.SocialStatId, ClientsBank.Balance, Clients.Id  
	FROM  Clients 
		JOIN ClientsBank ON ClientsBank.ClientId = Clients.Id
		WHERE Clients.SocialStatId = @SOCID) AS SELECTED
	WHERE SELECTED.Id = ClientsBank.ID
END;