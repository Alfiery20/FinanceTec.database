USE FinanceTec;

IF EXISTS(SELECT * FROM sys.tables WHERE name = 'Usuario')
	BEGIN
		DROP TABLE Usuario;
	END

CREATE TABLE Usuario
(
	Id INT IDENTITY(1, 1),
	IdTipoDocumento INT,
	NumeroDocumento VARCHAR(20),
	Nombre VARCHAR(200),
	ApellidoPaterno VARCHAR(150),
	ApellidoMaterno VARCHAR(150),
	Telefono VARCHAR(20),
	Correo VARCHAR(250),
	Clave VARCHAR(MAX),
	Estado VARCHAR(10),
	IdRol INT,
	IdUsuarioCreacion INT,
	FechaCreacion DATETIME,
	IdUsuarioActualizacion INT,
	FechaActualizacion DATETIME,
	CONSTRAINT pk_Usuario
		PRIMARY KEY (Id),
	CONSTRAINT fk_Usuario_TipoDocumento
		FOREIGN KEY (IdTipoDocumento)
		REFERENCES TipoDocumento(Id),
	CONSTRAINT fk_Usuario_Rol
		FOREIGN KEY (IdRol)
		REFERENCES Rol(Id)
)