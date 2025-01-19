USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_EliminarCategoria') 
	BEGIN
		DROP PROCEDURE usp_EliminarCategoria;
	END
GO

CREATE PROCEDURE usp_EliminarCategoria
(
	@pIdCategoria INT,
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE Categoria SET Estado = 0 WHERE Id = @pIdCategoria

			SET @codigo = 'OK';
			SET @msj = 'Se elimino la categoria de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		ROLLBACK TRANSACTION;
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
	END CATCH
END