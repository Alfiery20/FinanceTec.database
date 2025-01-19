USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_CrearIngresos') 
	BEGIN
		DROP PROCEDURE usp_CrearIngresos;
	END
GO

CREATE PROCEDURE usp_CrearIngresos
(
	@pDescripcion VARCHAR(250),
	@pMonto DECIMAL(10,2),
	@pFecha DATETIME,
	@pUsuario INT,
	@pCategoria INT,
	@pTipo CHAR(1),
	@codigo VARCHAR(10) OUTPUT,
	@msj VARCHAR(500) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO Movimiento(Descripcion, Monto, Fecha, TipoMovimiento, IdUsuario, IdCategoria)
			VALUES(@pDescripcion, @pMonto, @pFecha, @pTipo, @pUsuario, @pCategoria)

			SET @codigo = 'OK';
			SET @msj = 'Se registró el ingreso de forma satisfactoria.';
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SET @codigo = 'EX';
		SET @msj = ERROR_MESSAGE();
		ROLLBACK TRANSACTION;
	END CATCH
END