-- Crear la base de datos
CREATE DATABASE DB_TransportePublico;
GO

-- Usar la base de datos creada
USE DB_TransportePublico;
GO

--
select * from Usuarios

select * from Autobuses

select * from Rutas
--


-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------

CREATE PROCEDURE dbo.spUsuarios_GetAll
AS
BEGIN
	SELECT ID_Usuario, Nombre, Email, FechaRegistro FROM Usuarios;
END

EXEC dbo.spUsuarios_GetAll
-------------------------------------
EXEC sp_rename ' dbo.spProducts_GetById', 'dbo.spUsuarios_GetById';

CREATE PROCEDURE dbo.spUsuarios_GetById
@ID_Usuario Int
AS
BEGIN
	SELECT ID_Usuario, Nombre, Email, FechaRegistro FROM Usuarios
	WHERE ID_Usuario = @ID_Usuario;
END

EXEC  dbo.spUsuarios_GetById 2

select * from Usuarios

-------------------------------------

CREATE PROCEDURE dbo.spUsuarios_Insert
@Nombre NVARCHAR(100),
@Email NVARCHAR(100),
@FechaRegistro DATE
AS
BEGIN
	INSERT INTO Usuarios
	VALUES(@Nombre, @Email, @FechaRegistro)
END

exec dbo.spUsuarios_Insert 'Leo', 'leo@gmail.com', '2025-06-15'

-------------------------------------

CREATE PROCEDURE dbo.spUsuarios_Update
@Nombre NVARCHAR(100),
@Email NVARCHAR(100),
@FechaRegistro DATE,
@ID_Usuario INT
AS
BEGIN
	UPDATE Usuarios
	SET Nombre = @Nombre,
		Email = @Email,
		FechaRegistro = @FechaRegistro
	WHERE ID_Usuario = @ID_Usuario
END

EXEC dbo.spUsuarios_Update 'prue', 'prue@gmail.com', '2026-04-23', 1

select * from Usuarios

------------------------------------

CREATE PROCEDURE dbo.spUsuarios_Delete
@ID_Usuario INT
AS
BEGIN
	DELETE FROM Usuarios 
	WHERE ID_Usuario = @ID_Usuario
END

EXEC dbo.spUsuarios_Delete 3

select * from Usuarios

-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------

CREATE PROCEDURE dbo.spAutobuses_GetAll
AS
BEGIN
	SELECT ID_Autobus, Matricula, Marca, Modelo, Capacidad FROM Autobuses;
END

EXEC dbo.spAutobuses_GetAll

select * from Autobuses
-------------------------------------

CREATE PROCEDURE dbo.spAutobuses_GetById
@ID_Autobus Int
AS
BEGIN
	SELECT ID_Autobus, Matricula, Marca, Modelo, Capacidad FROM Autobuses
	WHERE ID_Autobus = @ID_Autobus;
END

EXEC  dbo.spAutobuses_GetById 1
-------------------------------------

CREATE PROCEDURE dbo.spAutobuses_Insert
@Matricula NVARCHAR(10),
@Marca NVARCHAR(50),
@Modelo NVARCHAR(50),
@Capacidad INT
AS
BEGIN
	INSERT INTO Autobuses
	VALUES(@Matricula, @Marca, @Modelo, @Capacidad)
END

EXEC dbo.spAutobuses_Insert '123D', 'YOTO', 'GGG', 1

SELECT * FROM Autobuses
-------------------------------------

CREATE PROCEDURE dbo.spAutobuses_Update
@Matricula NVARCHAR(10),
@Marca NVARCHAR(50),
@Modelo NVARCHAR(50),
@Capacidad INT,
@ID_Autobus INT
AS
BEGIN
	UPDATE Autobuses
	SET Matricula = @Matricula,
		Marca = @Marca,
		Modelo = @Modelo,
		Capacidad = @Capacidad
	WHERE ID_Autobus = @ID_Autobus
END

EXEC dbo.spAutobuses_Update 'AAAA', 'AAAA', 'AAA', 30, 3

select * from Autobuses
-------------------------------------

CREATE PROCEDURE dbo.spAutobuses_Delete
@ID_Autobus INT
AS
BEGIN
	DELETE FROM Autobuses 
	WHERE ID_Autobus = @ID_Autobus
END

EXEC dbo.spAutobuses_Delete 3

select * from Autobuses

-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------

-- Obtener todas las rutas
CREATE PROCEDURE dbo.spRutas_GetAll
AS
BEGIN
    SELECT ID_Ruta, Nombre, Origen, Destino, FechaViaje, ID_Usuario, ID_Autobus FROM Rutas;
END

EXEC dbo.spRutas_GetAll

select * from Rutas

-- Obtener una ruta por su ID
CREATE PROCEDURE dbo.spRutas_GetById
@ID_Ruta INT
AS
BEGIN
    SELECT ID_Ruta, Nombre, Origen, Destino, FechaViaje, ID_Usuario, ID_Autobus FROM Rutas
    WHERE ID_Ruta = @ID_Ruta;
END

EXEC dbo.spRutas_GetById 1

select * from Rutas

-- Insertar una nueva ruta
CREATE PROCEDURE dbo.spRutas_Insert
@Nombre NVARCHAR(100),
@Origen NVARCHAR(100),
@Destino NVARCHAR(100),
@FechaViaje DATE,
@ID_Usuario INT,
@ID_Autobus INT
AS
BEGIN
    INSERT INTO Rutas (Nombre, Origen, Destino, FechaViaje, ID_Usuario, ID_Autobus)
    VALUES (@Nombre, @Origen, @Destino, @FechaViaje, @ID_Usuario, @ID_Autobus);
END

EXEC dbo.spRutas_Insert 'YYYYYY', 'YYYYYY', 'YYYYYY', '2024-05-18', 1, 1

SELECT * FROM Rutas

-- Actualizar una ruta existente
CREATE PROCEDURE dbo.spRutas_Update
@Nombre NVARCHAR(100),
@Origen NVARCHAR(100),
@Destino NVARCHAR(100),
@FechaViaje DATE,
@ID_Usuario INT,
@ID_Autobus INT,
@ID_Ruta INT
AS
BEGIN
    UPDATE Rutas
    SET Nombre = @Nombre,
        Origen = @Origen,
        Destino = @Destino,
        FechaViaje = @FechaViaje,
        ID_Usuario = @ID_Usuario,
        ID_Autobus = @ID_Autobus
    WHERE ID_Ruta = @ID_Ruta;
END

EXEC dbo.spRutas_Update 'hhhhhh', 'hhhhhh', 'hhhhhh', '2025-05-18', 1, 1, 4

SELECT * FROM Rutas

-- Eliminar una ruta por su ID
CREATE PROCEDURE dbo.spRutas_Delete
@ID_Ruta INT
AS
BEGIN
    DELETE FROM Rutas
    WHERE ID_Ruta = @ID_Ruta;
END

EXEC dbo.spRutas_Delete 3

SELECT * FROM Rutas

-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------

-- Crear la tabla de Usuarios
CREATE TABLE Usuarios (
    ID_Usuario INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    FechaRegistro DATE NOT NULL
);
GO

-- Crear la tabla de Autobuses
CREATE TABLE Autobuses (
    ID_Autobus INT PRIMARY KEY IDENTITY(1,1),
    Matricula NVARCHAR(10) NOT NULL,
    Marca NVARCHAR(50) NOT NULL,
    Modelo NVARCHAR(50) NOT NULL,
    Capacidad INT NOT NULL
);
GO

-- Crear la tabla de Rutas
CREATE TABLE Rutas (
    ID_Ruta INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Origen NVARCHAR(100) NOT NULL,
    Destino NVARCHAR(100) NOT NULL,
	FechaViaje DATE NOT NULL,
    ID_Usuario INT NOT NULL,
    ID_Autobus INT NOT NULL,
    CONSTRAINT FK_Rutas_Usuarios FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario),
    CONSTRAINT FK_Rutas_Autobuses FOREIGN KEY (ID_Autobus) REFERENCES Autobuses(ID_Autobus)
);
GO

-- Insertar datos de ejemplo en Usuarios
INSERT INTO Usuarios (Nombre, Email, FechaRegistro)
VALUES
('Juan Perez', 'juan.perez@example.com', GETDATE()),
('Maria Lopez', 'maria.lopez@example.com', GETDATE());
GO

-- Insertar datos de ejemplo en Autobuses
INSERT INTO Autobuses (Matricula, Marca, Modelo, Capacidad)
VALUES
('ABC123', 'Mercedes', 'Sprinter', 20),
('DEF456', 'Volvo', '7700', 50);
GO

-- Insertar datos de ejemplo en Rutas
INSERT INTO Rutas (Nombre, Origen, Destino, ID_Usuario, ID_Autobus, FechaViaje)
VALUES
('Ruta 1', 'Estación Central', 'Plaza Mayor', 1, 1, GETDATE()),
('Ruta 2', 'Aeropuerto', 'Centro Histórico', 2, 2, GETDATE());
GO

