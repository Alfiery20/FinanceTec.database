USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ModificarMovimiento') 
	BEGIN
		DROP PROCEDURE usp_ModificarMovimiento;
	END
GO

CREATE PROCEDURE usp_ModificarMovimiento
(
	@pidMovimiento INT,
	@pdescripcion VARCHAR(100),
	@pmonto DECIMAL(10,2),
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE Movimiento SET 
				Descripcion = @pdescripcion,
				Monto = @pmonto
			WHERE Id = @pidMovimiento

			SET @codigo = 'OK';
			SET @msj = 'Se actualizo el movimiento con exito.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
			SET @codigo = 'EX';
			SET @msj = 'El cambio del movimento con error.';
		ROLLBACK TRANSACTION
	END CATCH
END