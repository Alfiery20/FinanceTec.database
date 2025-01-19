USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ActualizarRol') 
	BEGIN
		DROP PROCEDURE usp_ActualizarRol;
	END
GO

CREATE PROCEDURE usp_ActualizarRol
(
	@pIdRol INT,
	@pNombreRol VARCHAR(100),
	@pFechaActualizacion DATETIME,
	@pUsuarioActualizacion INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE Rol 
				SET Nombre = @pNombreRol,
					FechaActualizacion = @pFechaActualizacion,
					IdUsuarioActualizacion = @pUsuarioActualizacion
				WHERE Id = @pIdRol

			SET @codigo = 'OK';
			SET @msj = 'Se actualizo el rol de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END