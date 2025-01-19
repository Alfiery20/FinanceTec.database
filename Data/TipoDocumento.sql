INSERT INTO TipoDocumento(Descripcion, Abreviado, Longitud, IdUsuarioCreacion, FechaCreacion)
	VALUES
		('Documento Nacional de Identidad', 'DNI', 8, 1, GETDATE()),
		('Registro Único de Contribuyentes', 'RUC', 11, 1, GETDATE()),
		('Pasaporte', 'Pasaporte', 20, 1, GETDATE()),
		('Partida de Nacimiento', 'Partida Nacimiento', 20, 1, GETDATE()),
		('Carnet de Extranjeria', 'Carnet de Extranjeria', 20, 1, GETDATE())