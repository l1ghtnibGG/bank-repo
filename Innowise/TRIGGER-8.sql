USE Bank
GO
CREATE TRIGGER verification ON ClientsBank
INSTEAD OF UPDATE
AS 

DECLARE @bal_kart INT
DECLARE @bal_bank INT

	SELECT @bal_kart = CardBalance.Balance
		FROM CardBalance 


	SELECT @bal_bank = ClientsBank.Balance
		FROM ClientsBank


IF @bal_bank < @bal_kart
BEGIN 
ROLLBACK TRAN
RAISERROR('—умма на счЄте не может быть меньше чем суммы на картах', 16, 1)
END


