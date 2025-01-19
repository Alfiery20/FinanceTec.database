USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_VerRoles') 
	BEGIN
		DROP PROCEDURE usp_VerRoles;
	END
GO

CREATE PROCEDURE usp_VerRoles
(
	@pIdRol INT
)
AS
BEGIN
	SELECT 
		ROL.Id AS [ID],
		ROL.Nombre AS [NOMBRE],
		ROL.Estado AS [ESTADO],
		ROL.FechaCreacion AS [FECHA_CREACION]
	FROM Rol ROL
	WHERE 
		ROL.Id = @pIdRol
END