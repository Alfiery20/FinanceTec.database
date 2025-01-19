USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_ObtenerUsuario') 
	BEGIN
		DROP PROCEDURE sp_ObtenerUsuario;
	END
GO

CREATE PROCEDURE sp_ObtenerUsuario
(
	@pemail VARCHAR(250),
	@pclave VARCHAR(MAX)
)
AS
BEGIN
	SELECT 
		USU.Id AS [ID],
		USU.Nombre AS [NOMBRE],
		USU.ApellidoPaterno AS [APELLIDO_PATERNO],
		USU.ApellidoMaterno AS [APELLIDO_MATERNO],
		ROL.Id AS [ID_ROL],
		ROL.Nombre AS [NOMBRE_ROL]
	FROM Usuario USU
	LEFT JOIN Rol ROL ON ROL.Id = USU.IdRol
	WHERE 
		USU.Correo = @pemail 
		AND USU.Clave = @pclave 
		AND USU.Estado = 'A'
END