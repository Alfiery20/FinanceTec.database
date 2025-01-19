USE FinanceTec;

IF EXISTS(SELECT * FROM sys.tables WHERE name = 'Movimiento')
	BEGIN
		DROP TABLE Movimiento;
	END

CREATE TABLE Movimiento
(
	Id INT IDENTITY(1, 1),
	Descripcion VARCHAR(100),
	Monto DECIMAL(10,2),
	Fecha DATETIME,
	TipoMovimiento VARCHAR(1),
	IdCategoria INT,
	IdUsuario INT,
	CONSTRAINT pk_Movimiento
		PRIMARY KEY (Id),
	CONSTRAINT fk_Movimiento_Categoria
		FOREIGN KEY (IdCategoria)
		REFERENCES Categoria(Id),
	CONSTRAINT fk_Movimiento_Usuario
		FOREIGN KEY (IdUsuario)
		REFERENCES Usuario(Id)
)