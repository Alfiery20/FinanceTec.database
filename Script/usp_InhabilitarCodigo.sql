USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_InhabilitarCodigo') 
	BEGIN
		DROP PROCEDURE usp_InhabilitarCodigo;
	END
GO

CREATE PROCEDURE usp_InhabilitarCodigo
(
	@pidUsuario INT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE CodigoSMS SET Estado = 0 WHERE IdUsuario = @pidUsuario
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH
END