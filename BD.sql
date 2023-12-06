-- Crear la base de datos
CREATE DATABASE CasoEstudioKN;
GO

-- Usar la base de datos recién creada
USE CasoEstudioKN;
GO

-- Crear la tabla CasasSistema
CREATE TABLE CasasSistema (
    IdCasa BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    DescripcionCasa VARCHAR(30) NOT NULL,
    PrecioCasa DECIMAL(10,2) NOT NULL,
    UsuarioAlquiler VARCHAR(30) NULL,
    FechaAlquiler DATETIME NULL
);
GO

-- Insertar datos en la tabla CasasSistema
INSERT INTO [dbo].[CasasSistema] ([DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler])
VALUES ('Casa en San José', 190000, NULL, NULL);

INSERT INTO [dbo].[CasasSistema] ([DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler])
VALUES ('Casa en Alajuela', 145000, NULL, NULL);

INSERT INTO [dbo].[CasasSistema] ([DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler])
VALUES ('Casa en Cartago', 115000, NULL, NULL);

INSERT INTO [dbo].[CasasSistema] ([DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler])
VALUES ('Casa en Heredia', 122000, NULL, NULL);

INSERT INTO [dbo].[CasasSistema] ([DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler])
VALUES ('Casa en Guanacaste', 105000, NULL, NULL);
