USE FinanceTec;
GO
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'usp_ObtenerRoles') 
	BEGIN
		DROP PROCEDURE usp_ObtenerRoles;
	END
GO

CREATE PROCEDURE usp_ObtenerRoles
(
	@pNombreRol VARCHAR(250)
)
AS
BEGIN
	SELECT 
		ROL.Id AS [ID],
		ROL.Nombre AS [NOMBRE],
		(CASE WHEN ROL.Estado = 1 THEN 'Activo' ELSE 'Inactivo' END)  AS [ESTADO],
		ROL.FechaCreacion AS [FECHA_CREACION],
		CONCAT(USUARIO_CREACION.Nombre, ' ' , 
				USUARIO_CREACION.ApellidoPaterno, ' ', 
				USUARIO_CREACION.ApellidoMaterno) AS [USUARIO_CREACION],
		ROL.FechaActualizacion AS [FECHA_ACTUALIZACION],
		CONCAT(USUARIO_ACTUALIZACION.Nombre, ' ' , 
				USUARIO_ACTUALIZACION.ApellidoPaterno, ' ', 
				USUARIO_ACTUALIZACION.ApellidoMaterno) AS [USUARIO_CREACION]
	FROM Rol ROL
	LEFT JOIN Usuario USUARIO_CREACION ON USUARIO_CREACION.Id = ROL.IdUsuarioCreacion
	LEFT JOIN Usuario USUARIO_ACTUALIZACION ON USUARIO_ACTUALIZACION.Id = ROL.IdUsuarioActualizacion
	WHERE 
		(ROL.Nombre LIKE CONCAT(@pNombreRol,'%') OR 
		(@pNombreRol IS NULL OR @pNombreRol = ''))
END