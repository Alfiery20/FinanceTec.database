USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ModificarTelefono') 
	BEGIN
		DROP PROCEDURE usp_ModificarTelefono;
	END
GO

CREATE PROCEDURE usp_ModificarTelefono
(
	@pidUsuario INT,
	@ptelefono VARCHAR(9),
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE Usuario SET Telefono = @ptelefono WHERE Id = @pidUsuario

			SET @codigo = 'OK';
			SET @msj = 'Se realizo el cambio de Nro. telefonico con exito.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
			SET @codigo = 'EX';
			SET @msj = 'El cambio de Nro. telefonico ocurrio con error.';
		ROLLBACK TRANSACTION
	END CATCH
END