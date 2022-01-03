USE Bank
GO
CREATE TRIGGER verification ON Banks
INSTEAD OF UPDATE
AS 

DECLARE @bal_kart INT
DECLARE @bal_bank INT


SELECT @bal_kart = SUM(Cards.BalanceOfCard)
FROM Clients 
	JOIN Cards ON Cards.ClientId = Clients.Id
GROUP BY Clients.LastName, Clients.FirstName

SELECT @bal_bank = Banks.Balance
FROM Banks


IF @bal_bank < @bal_kart
BEGIN 
ROLLBACK TRAN
RAISERROR('—умма на счЄте не может быть меньше чем суммы на картах', 16, 1)
END


