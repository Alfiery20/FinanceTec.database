USE FinanceTec;

IF EXISTS(SELECT * FROM sys.tables WHERE name = 'Rol')
	BEGIN
		DROP TABLE Rol;
	END

CREATE TABLE Rol
(
	Id INT IDENTITY(1, 1),
	Nombre VARCHAR(250),
	Estado BIT,
	IdUsuarioCreacion INT,
	FechaCreacion DATETIME,
	IdUsuarioActualizacion INT,
	FechaActualizacion DATETIME,
	CONSTRAINT pk_Rol
		PRIMARY KEY (Id)
)