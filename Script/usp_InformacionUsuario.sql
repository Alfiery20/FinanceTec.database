USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_InformacionUsuario') 
	BEGIN
		DROP PROCEDURE usp_InformacionUsuario;
	END
GO

CREATE PROCEDURE usp_InformacionUsuario
(
	@pIdUsuario INT
)
AS
BEGIN
	
	SELECT 
		Usu.Id AS [ID],
		Usu.IdTipoDocumento AS [TIPO_DOCUMENTO],
		Usu.NumeroDocumento AS [NUMERO_DOCUMENTO],
		Usu.Nombre AS [NOMBRE],
		Usu.ApellidoPaterno AS [APELLIDO_PATERNO],
		Usu.ApellidoMaterno AS [APELLIDO_MATERNO],
		Usu.Telefono AS [TELEFONO],
		Usu.Correo AS [CORREO],
		Usu.Estado AS [ESTADO]
	FROM Usuario Usu
	WHERE Usu.Id = @pIdUsuario
END