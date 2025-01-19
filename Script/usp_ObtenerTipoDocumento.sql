USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerTipoDocumento') 
	BEGIN
		DROP PROCEDURE usp_ObtenerTipoDocumento;
	END
GO

CREATE PROCEDURE usp_ObtenerTipoDocumento
AS
BEGIN
	SELECT 
		Id AS [ID],
		Descripcion AS [DESCRIPCION],
		Abreviado AS [ABREVIADO],
		Longitud AS [LONGITUD]
	FROM TipoDocumento
END