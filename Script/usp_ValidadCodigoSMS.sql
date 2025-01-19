USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ValidadCodigoSMS') 
	BEGIN
		DROP PROCEDURE usp_ValidadCodigoSMS;
	END
GO

CREATE PROCEDURE usp_ValidadCodigoSMS
(
	@pIdUsuario INT,
	@pCodigoSms VARCHAR(6),
	@pFechaActual DATETIME,
	@codigo BIT OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		DECLARE @cantidad INT = 0;
			SELECT @cantidad = Id FROM CodigoSMS 
				WHERE IdUsuario = @pIdUsuario AND 
						Codigo = @pCodigoSms AND
						(@pFechaActual BETWEEN FechaCreacion AND FechaVencimiento)
			IF (@cantidad > 0)
				BEGIN
					SET @codigo = 1
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 0;
	END CATCH
END