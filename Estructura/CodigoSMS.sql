USE FinanceTec;

IF EXISTS(SELECT * FROM sys.tables WHERE name = 'CodigoSMS')
	BEGIN
		DROP TABLE CodigoSMS;
	END

CREATE TABLE CodigoSMS
(
	Id INT IDENTITY(1, 1),
	Codigo VARCHAR(250),
	IdUsuario INT,
	FechaCreacion DATETIME,
	FechaVencimiento DATETIME,
	Estado BIT,
	CONSTRAINT pk_CodigoSMS
		PRIMARY KEY (Id),
	CONSTRAINT fk_codigoSMS_usuario
		FOREIGN KEY (IdUsuario)
		REFERENCES Usuario(Id)
)