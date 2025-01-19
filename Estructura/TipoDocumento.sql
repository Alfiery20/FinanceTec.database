USE FinanceTec;

IF EXISTS(SELECT * FROM sys.tables WHERE name = 'TipoDocumento')
	BEGIN
		DROP TABLE TipoDocumento;
	END

CREATE TABLE TipoDocumento
(
	Id INT IDENTITY(1, 1),
	Descripcion VARCHAR(100),
	Abreviado VARCHAR(100),
	Longitud INT,
	IdUsuarioCreacion INT,
	FechaCreacion DATETIME,
	IdUsuarioActualizacion INT,
	FechaActualizacion INT,
	CONSTRAINT pk_TipoDocumento
		PRIMARY KEY (Id)
)