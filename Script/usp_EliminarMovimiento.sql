USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_EliminarMovimiento') 
	BEGIN
		DROP PROCEDURE usp_EliminarMovimiento;
	END
GO

CREATE PROCEDURE usp_EliminarMovimiento
(
	@pidMovimiento INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DELETE FROM Movimiento WHERE Id = @pidMovimiento

			SET @codigo = 'OK';
			SET @msj = 'Se elimino el movimiento con exito.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
			SET @codigo = 'EX';
			SET @msj = 'La eliminacion del movimento sucedio con error.';
		ROLLBACK TRANSACTION
	END CATCH
END