USE [Innowise]
GO
/****** Object:  StoredProcedure [dbo].[Trans]    Script Date: 22.12.2021 04:07:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Trans] 
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
