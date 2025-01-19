USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerIngresos') 
	BEGIN
		DROP PROCEDURE usp_ObtenerIngresos;
	END
GO

CREATE PROCEDURE usp_ObtenerIngresos
(
	@pTermino VARCHAR(10),
	@pFecha VARCHAR(20),
	@pIdCategoria INT
)
AS
BEGIN
	SELECT 
		MOV.Id AS [ID],
		MOV.Descripcion AS [DESCRIPCION],
		MOV.Monto AS [MONTO],
		MOV.Fecha AS [FECHA],
		(CASE MOV.TipoMovimiento
			WHEN 'I' THEN 'Ingreso'
			WHEN 'E' THEN 'Engreso' 
		END) AS [TIPO],
		CAT.Descripcion AS [CATEGORIA]
	FROM Movimiento MOV
	LEFT JOIN Categoria CAT ON CAT.Id = MOV.IdCategoria
	WHERE 
		MOV.TipoMovimiento = 'I' AND
		((MOV.Descripcion LIKE CONCAT(@pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = '')) AND
		(CAST(MOV.Fecha AS DATE) = CAST(@pFecha AS DATE) OR 
		(@pFecha IS NULL OR @pFecha = '')) AND
		(MOV.IdCategoria = @pIdCategoria OR 
		(@pIdCategoria IS NULL OR @pIdCategoria = '')))
END