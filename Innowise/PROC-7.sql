USE [Innowise]
GO
/****** Object:  StoredProcedure [dbo].[Trans]    Script Date: 19.12.2021 14:45:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Trans] 
AS
BEGIN
BEGIN TRANSACTION
    UPDATE Банки SET [Баланс аккаунта] = [Баланс аккаунта] - 100 WHERE Id = 1;
	UPDATE Карточки SET Баланс = Баланс + 100 WHERE idКлиента = 1;
	COMMIT;
END;
