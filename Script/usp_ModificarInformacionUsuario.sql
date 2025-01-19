USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ModificarInformacionUsuario') 
	BEGIN
		DROP PROCEDURE usp_ModificarInformacionUsuario;
	END
GO

CREATE PROCEDURE usp_ModificarInformacionUsuario
(
	@pidUsuario INT,
	@pnombre VARCHAR(100),
	@papellidoPaterno VARCHAR(100),
	@papellidoMaterno VARCHAR(100),
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE Usuario SET 
				Nombre = @pnombre,
				ApellidoPaterno = @papellidoPaterno,
				ApellidoMaterno = @papellidoMaterno
			WHERE Id = @pidUsuario

			SET @codigo = 'OK';
			SET @msj = 'Se actualizo la informacion de usuario con exito.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
			SET @codigo = 'EX';
			SET @msj = 'El cambio de la informacion de usuario con error.';
		ROLLBACK TRANSACTION
	END CATCH
END