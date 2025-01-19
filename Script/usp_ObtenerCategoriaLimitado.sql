USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerCategoriaLimitado') 
	BEGIN
		DROP PROCEDURE usp_ObtenerCategoriaLimitado;
	END
GO

CREATE PROCEDURE usp_ObtenerCategoriaLimitado
(
	@pTermino VARCHAR(250)
)
AS
BEGIN
	SELECT TOP 5
		CAT.Id AS [ID],
		CAT.Descripcion AS [DESCRIPCION]
	FROM Categoria CAT
	LEFT JOIN Usuario USU_CREA ON USU_CREA.Id = CAT.IdUsuarioCreacion
	LEFT JOIN Usuario USU_ACTU ON USU_ACTU.Id = CAT.IdUsuarioActualizacion
	WHERE 
		(CAT.Estado = 1) AND
		(CAT.Descripcion LIKE CONCAT(@pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = ''))
END