USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_AsignarRol') 
	BEGIN
		DROP PROCEDURE usp_AsignarRol;
	END
GO

CREATE PROCEDURE usp_AsignarRol
(
	@pIdRol INT,
	@pIdUsuario INT,
	@pFechaActualizacion DATETIME,
	@pUsuarioActualizacion INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE Usuario
				SET IdRol = @pIdRol,
					IdUsuarioActualizacion = @pUsuarioActualizacion,
					FechaActualizacion = @pFechaActualizacion
				WHERE Id = @pIdUsuario

			SET @codigo = 'OK';
			SET @msj = 'Se asigno el rol de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END