USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_CrearCodigoSMS') 
	BEGIN
		DROP PROCEDURE usp_CrearCodigoSMS;
	END
GO

CREATE PROCEDURE usp_CrearCodigoSMS
(
	@pCodigoSMS VARCHAR(6),
	@pIdUsuario INT,
	@pFechaCreacion DATETIME,
	@pFechaVencimiento DATETIME,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO CodigoSMS(Codigo, IdUsuario, FechaCreacion, FechaVencimiento, Estado)
			VALUES(@pCodigoSMS, @pIdUsuario, @pFechaCreacion, @pFechaVencimiento, 1)

			SET @codigo = 'OK';
			SET @msj = 'Codigo SMS listo para validacion.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
		ROLLBACK TRANSACTION
	END CATCH
END