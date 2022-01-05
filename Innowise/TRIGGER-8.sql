USE Bank
GO
alter TRIGGER verification ON ClientsBank
INSTEAD OF UPDATE
AS 

DECLARE @bal_kart INT
DECLARE @bal_bank INT
DECLARE @iterater INT 

select @iterater = CardBalance.BankId 
	FROM CardBalance



WHILE(@iterater != 0)
BEGIN

	SELECT @bal_kart = CardBalance.Balance
		FROM CardBalance 
		WHERE CardBalance.ClientId = @iterater


	SELECT @bal_bank = ClientsBank.Balance
		FROM ClientsBank
		WHERE ClientsBank.ClientId = @iterater


IF @bal_bank < @bal_kart
BEGIN 
ROLLBACK TRAN
RAISERROR('—умма на счЄте не может быть меньше чем суммы на картах', 16, 1)
END
 
 SET @iterater = @iterater - 1;
END


