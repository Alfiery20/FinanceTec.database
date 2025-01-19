USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_CrearCategoria') 
	BEGIN
		DROP PROCEDURE usp_CrearCategoria;
	END
GO

CREATE PROCEDURE usp_CrearCategoria
(
	@pNombreCategoria VARCHAR(250),
	@pFechaCreacion DATETIME,
	@pUsuarioCreacion INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO Categoria(Descripcion, FechaCreacion, IdUsuarioCreacion, Estado)
			VALUES(@pNombreCategoria, @pFechaCreacion, @pUsuarioCreacion, 1)

			SET @codigo = 'OK';
			SET @msj = 'Se registró la categoria de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END