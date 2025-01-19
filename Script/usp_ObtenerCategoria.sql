USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerCategoria') 
	BEGIN
		DROP PROCEDURE usp_ObtenerCategoria;
	END
GO

CREATE PROCEDURE usp_ObtenerCategoria
(
	@pTermino VARCHAR(250)
)
AS
BEGIN
	SELECT 
		CAT.Id AS [ID],
		CAT.Descripcion AS [DESCRIPCION],
		CAT.FechaCreacion AS [FECHA_CREACION],
		(CASE CAT.Estado
			WHEN 1 THEN 'Activo' 
			WHEN 0 THEN 'Inactivo' END) AS [ESTADO],
		CONCAT(USU_CREA.Nombre, ' ', USU_CREA.ApellidoPaterno, ' ', USU_CREA.ApellidoMaterno) AS [USUARIO_CREACION],
		CAT.FechaActualizacion AS [FECHA_ACTUALIZACION],
		CONCAT(USU_ACTU.Nombre, ' ', USU_ACTU.ApellidoPaterno, ' ', USU_ACTU.ApellidoMaterno) AS [USUARIO_ACTUALIZACION]
	FROM Categoria CAT
	LEFT JOIN Usuario USU_CREA ON USU_CREA.Id = CAT.IdUsuarioCreacion
	LEFT JOIN Usuario USU_ACTU ON USU_ACTU.Id = CAT.IdUsuarioActualizacion
	WHERE 
		(CAT.Descripcion LIKE CONCAT(@pTermino,'%') OR 
		(@pTermino IS NULL OR @pTermino = ''))
END