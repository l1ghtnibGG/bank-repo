USE Bank
GO
alter PROCEDURE Trans 
AS
BEGIN

	DECLARE @ver INT
	SET @ver = (SELECT ClientsBank.Balance FROM ClientsBank WHERE ClientsBank.Id = 1);

	IF @ver >= 100 
	BEGIN
		BEGIN TRANSACTION
		UPDATE ClientsBank SET Balance = Balance - 100 WHERE Id = 1;
		UPDATE CardBalance SET Balance = Balance + 100 WHERE ClientId = 1;
		COMMIT;
		END;
END;
