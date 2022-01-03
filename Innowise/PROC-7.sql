USE Bank
GO
CREATE PROCEDURE Trans 
AS
BEGIN

	DECLARE @ver INT
	SET @ver = (SELECT Banks.Balance FROM Banks WHERE Banks.Id = 1);

	IF @ver >= 100 
	BEGIN
		BEGIN TRANSACTION
		UPDATE Banks SET Balance = Balance - 100 WHERE Id = 1;
		UPDATE Cards SET BalanceOfCard = BalanceOfCard + 100 WHERE ClientId = 1;
		COMMIT;
		END;
END;
