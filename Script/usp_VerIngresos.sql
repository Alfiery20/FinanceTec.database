USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_VerIngresos') 
	BEGIN
		DROP PROCEDURE usp_VerIngresos;
	END
GO

CREATE PROCEDURE usp_VerIngresos
(
	@pIdIngreso INT
)
AS
BEGIN
	SELECT 
		MOV.Id AS [ID],
		MOV.Descripcion AS [DESCRIPCION],
		MOV.Monto AS [MONTO],
		MOV.Fecha AS [FECHA],
		CAT.Id AS [CATEGORIA]
	FROM Movimiento MOV
	LEFT JOIN Categoria CAT ON CAT.Id = MOV.IdCategoria
	WHERE 
		MOV.TipoMovimiento = 'I' AND
		MOV.Id = @pIdIngreso
END