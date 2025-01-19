USE FinanceTec;

IF EXISTS(SELECT * FROM sys.tables WHERE name = 'Categoria')
	BEGIN
		DROP TABLE Categoria;
	END

CREATE TABLE Categoria
(
	Id INT IDENTITY(1, 1),
	Descripcion VARCHAR(250),
	IdUsuarioCreacion INT,
	FechaCreacion DATETIME,
	IdUsuarioActualizacion INT,
	FechaActualizacion DATETIME,
	Estado BIT,
	CONSTRAINT pk_Categoria 
		PRIMARY KEY (Id)
)