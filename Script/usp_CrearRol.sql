USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_CrearRol') 
	BEGIN
		DROP PROCEDURE usp_CrearRol;
	END
GO

CREATE PROCEDURE usp_CrearRol
(
	@pNombreRol VARCHAR(250),
	@pFechaCreacion DATETIME,
	@pUsuarioCreacion INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO Rol(Nombre, Estado, FechaCreacion, IdUsuarioCreacion)
			VALUES(@pNombreRol, 1, @pFechaCreacion, @pUsuarioCreacion)

			SET @codigo = 'OK';
			SET @msj = 'Se registró el rol de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END