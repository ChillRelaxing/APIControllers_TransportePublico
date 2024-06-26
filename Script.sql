USE [master]
GO
/****** Object:  Database [DB_TransportePublico]    Script Date: 19/05/2024 20:06:11 ******/
CREATE DATABASE [DB_TransportePublico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_TransportePublico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.U20210358\MSSQL\DATA\DB_TransportePublico.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_TransportePublico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.U20210358\MSSQL\DATA\DB_TransportePublico_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DB_TransportePublico] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_TransportePublico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_TransportePublico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_TransportePublico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_TransportePublico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_TransportePublico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_TransportePublico] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_TransportePublico] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_TransportePublico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_TransportePublico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_TransportePublico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_TransportePublico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_TransportePublico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_TransportePublico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_TransportePublico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_TransportePublico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_TransportePublico] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_TransportePublico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_TransportePublico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_TransportePublico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_TransportePublico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_TransportePublico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_TransportePublico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_TransportePublico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_TransportePublico] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_TransportePublico] SET  MULTI_USER 
GO
ALTER DATABASE [DB_TransportePublico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_TransportePublico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_TransportePublico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_TransportePublico] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_TransportePublico] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_TransportePublico] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_TransportePublico', N'ON'
GO
ALTER DATABASE [DB_TransportePublico] SET QUERY_STORE = ON
GO
ALTER DATABASE [DB_TransportePublico] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DB_TransportePublico]
GO
/****** Object:  Table [dbo].[Autobuses]    Script Date: 19/05/2024 20:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autobuses](
	[ID_Autobus] [int] IDENTITY(1,1) NOT NULL,
	[Matricula] [nvarchar](10) NOT NULL,
	[Marca] [nvarchar](50) NOT NULL,
	[Modelo] [nvarchar](50) NOT NULL,
	[Capacidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Autobus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rutas]    Script Date: 19/05/2024 20:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rutas](
	[ID_Ruta] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Origen] [nvarchar](100) NOT NULL,
	[Destino] [nvarchar](100) NOT NULL,
	[FechaViaje] [date] NOT NULL,
	[ID_Usuario] [int] NOT NULL,
	[ID_Autobus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Ruta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 19/05/2024 20:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[ID_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[FechaRegistro] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Autobuses] ON 

INSERT [dbo].[Autobuses] ([ID_Autobus], [Matricula], [Marca], [Modelo], [Capacidad]) VALUES (1, N'ABC123', N'Mercedes', N'Sprinter', 20)
INSERT [dbo].[Autobuses] ([ID_Autobus], [Matricula], [Marca], [Modelo], [Capacidad]) VALUES (2, N'DEF456', N'Volvo', N'7700', 50)
SET IDENTITY_INSERT [dbo].[Autobuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Rutas] ON 

INSERT [dbo].[Rutas] ([ID_Ruta], [Nombre], [Origen], [Destino], [FechaViaje], [ID_Usuario], [ID_Autobus]) VALUES (1, N'Ruta 1', N'Estación Central', N'Plaza Mayor', CAST(N'2024-05-18' AS Date), 1, 1)
INSERT [dbo].[Rutas] ([ID_Ruta], [Nombre], [Origen], [Destino], [FechaViaje], [ID_Usuario], [ID_Autobus]) VALUES (2, N'Ruta 2', N'Aeropuerto', N'Centro Histórico', CAST(N'2024-05-18' AS Date), 2, 2)
INSERT [dbo].[Rutas] ([ID_Ruta], [Nombre], [Origen], [Destino], [FechaViaje], [ID_Usuario], [ID_Autobus]) VALUES (4, N'hhhhhh', N'hhhhhh', N'hhhhhh', CAST(N'2025-05-18' AS Date), 1, 1)
SET IDENTITY_INSERT [dbo].[Rutas] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre], [Email], [FechaRegistro]) VALUES (1, N'prue', N'prue@gmail.com', CAST(N'2026-04-23' AS Date))
INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre], [Email], [FechaRegistro]) VALUES (2, N'Maria Lopez', N'maria.lopez@example.com', CAST(N'2024-05-18' AS Date))
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Rutas]  WITH CHECK ADD  CONSTRAINT [FK_Rutas_Autobuses] FOREIGN KEY([ID_Autobus])
REFERENCES [dbo].[Autobuses] ([ID_Autobus])
GO
ALTER TABLE [dbo].[Rutas] CHECK CONSTRAINT [FK_Rutas_Autobuses]
GO
ALTER TABLE [dbo].[Rutas]  WITH CHECK ADD  CONSTRAINT [FK_Rutas_Usuarios] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Rutas] CHECK CONSTRAINT [FK_Rutas_Usuarios]
GO
/****** Object:  StoredProcedure [dbo].[spAutobuses_Delete]    Script Date: 19/05/2024 20:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAutobuses_Delete]
@ID_Autobus INT
AS
BEGIN
	DELETE FROM Autobuses 
	WHERE ID_Autobus = @ID_Autobus
END
GO
/****** Object:  StoredProcedure [dbo].[spAutobuses_GetAll]    Script Date: 19/05/2024 20:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAutobuses_GetAll]
AS
BEGIN
	SELECT ID_Autobus, Matricula, Marca, Modelo, Capacidad FROM Autobuses;
END
GO
/****** Object:  StoredProcedure [dbo].[spAutobuses_GetById]    Script Date: 19/05/2024 20:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAutobuses_GetById]
@ID_Autobus Int
AS
BEGIN
	SELECT ID_Autobus, Matricula, Marca, Modelo, Capacidad FROM Autobuses
	WHERE ID_Autobus = @ID_Autobus;
END
GO
/****** Object:  StoredProcedure [dbo].[spAutobuses_Insert]    Script Date: 19/05/2024 20:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAutobuses_Insert]
@Matricula NVARCHAR(10),
@Marca NVARCHAR(50),
@Modelo NVARCHAR(50),
@Capacidad INT
AS
BEGIN
	INSERT INTO Autobuses
	VALUES(@Matricula, @Marca, @Modelo, @Capacidad)
END
GO
/****** Object:  StoredProcedure [dbo].[spAutobuses_Update]    Script Date: 19/05/2024 20:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAutobuses_Update]
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
GO
/****** Object:  StoredProcedure [dbo].[spRutas_Delete]    Script Date: 19/05/2024 20:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRutas_Delete]
@ID_Ruta INT
AS
BEGIN
    DELETE FROM Rutas
    WHERE ID_Ruta = @ID_Ruta;
END
GO
/****** Object:  StoredProcedure [dbo].[spRutas_GetAll]    Script Date: 19/05/2024 20:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRutas_GetAll]
AS
BEGIN
    SELECT ID_Ruta, Nombre, Origen, Destino, FechaViaje, ID_Usuario, ID_Autobus FROM Rutas;
END
GO
/****** Object:  StoredProcedure [dbo].[spRutas_GetById]    Script Date: 19/05/2024 20:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRutas_GetById]
@ID_Ruta INT
AS
BEGIN
    SELECT ID_Ruta, Nombre, Origen, Destino, FechaViaje, ID_Usuario, ID_Autobus FROM Rutas
    WHERE ID_Ruta = @ID_Ruta;
END
GO
/****** Object:  StoredProcedure [dbo].[spRutas_Insert]    Script Date: 19/05/2024 20:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRutas_Insert]
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
GO
/****** Object:  StoredProcedure [dbo].[spRutas_Update]    Script Date: 19/05/2024 20:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRutas_Update]
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
GO
/****** Object:  StoredProcedure [dbo].[spUsuarios_Delete]    Script Date: 19/05/2024 20:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUsuarios_Delete]
@ID_Usuario INT
AS
BEGIN
	DELETE FROM Usuarios 
	WHERE ID_Usuario = @ID_Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[spUsuarios_GetAll]    Script Date: 19/05/2024 20:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUsuarios_GetAll]
AS
BEGIN
	SELECT ID_Usuario, Nombre, Email, FechaRegistro FROM Usuarios;
END
GO
/****** Object:  StoredProcedure [dbo].[spUsuarios_GetById]    Script Date: 19/05/2024 20:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUsuarios_GetById]
@ID_Usuario Int
AS
BEGIN
	SELECT ID_Usuario, Nombre, Email, FechaRegistro FROM Usuarios
	WHERE ID_Usuario = @ID_Usuario;
END
GO
/****** Object:  StoredProcedure [dbo].[spUsuarios_Insert]    Script Date: 19/05/2024 20:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUsuarios_Insert]
@Nombre NVARCHAR(100),
@Email NVARCHAR(100),
@FechaRegistro DATE
AS
BEGIN
	INSERT INTO Usuarios
	VALUES(@Nombre, @Email, @FechaRegistro)
END
GO
/****** Object:  StoredProcedure [dbo].[spUsuarios_Update]    Script Date: 19/05/2024 20:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUsuarios_Update]
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
GO
USE [master]
GO
ALTER DATABASE [DB_TransportePublico] SET  READ_WRITE 
GO
