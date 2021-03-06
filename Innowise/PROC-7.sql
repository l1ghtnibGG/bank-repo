USE Bank
GO
CREATE PROCEDURE Trans 
	@CLIENTID INT,
	@SUM DECIMAL
AS
BEGIN

	DECLARE @verif INT

	SET @verif = (SELECT ClientsBank.Balance FROM ClientsBank WHERE ClientsBank.Id = @CLIENTID);

	IF @verif >= @SUM 
	BEGIN
		BEGIN TRANSACTION
		UPDATE ClientsBank SET Balance = Balance - @SUM WHERE ClientId = @CLIENTID;
		UPDATE CardBalance SET Balance = Balance + @SUM WHERE ClientId = @CLIENTID;
		COMMIT;
		END;
END;
