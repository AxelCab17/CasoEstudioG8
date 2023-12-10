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

--Revisar si esta Disponible y filtrar por precio
CREATE PROCEDURE ObtenerInfoCasas
AS
BEGIN
    SELECT
        DescripcionCasa,
        PrecioCasa,
        UsuarioAlquiler,
        CASE
            WHEN UsuarioAlquiler IS NOT NULL AND FechaAlquiler IS NOT NULL THEN 'Reservada'
            ELSE 'Disponible'
        END AS Estado,
        FechaAlquiler
    FROM
        CasasSistema
    WHERE
        PrecioCasa BETWEEN 115000 AND 180000
    ORDER BY
        CASE
            WHEN UsuarioAlquiler IS NOT NULL AND FechaAlquiler IS NOT NULL THEN 1
            ELSE 0
        END;
END;


EXEC ObtenerInfoCasas;

--Obtener casas Disponibles
CREATE PROCEDURE ObtenerCasasDisponibles
AS
BEGIN
    SELECT
		IdCasa,
        DescripcionCasa,
        PrecioCasa,
        UsuarioAlquiler,
        CASE
            WHEN UsuarioAlquiler IS NOT NULL AND FechaAlquiler IS NOT NULL THEN 'Reservada'
            ELSE 'Disponible'
        END AS Estado,
        FechaAlquiler
    FROM
        CasasSistema
    WHERE
        UsuarioAlquiler IS NULL AND FechaAlquiler IS NULL
    ORDER BY
        CASE
            WHEN UsuarioAlquiler IS NOT NULL AND FechaAlquiler IS NOT NULL THEN 1
            ELSE 0
        END;
END;
GO

EXEC ObtenerCasasDisponibles;

--Obtener casa por ID
CREATE PROCEDURE ObtenerInfoCasa
    @IdCasa BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        IdCasa,
        DescripcionCasa,
        PrecioCasa,
        UsuarioAlquiler,
        FechaAlquiler
    FROM
        CasasSistema
    WHERE
        IdCasa = @IdCasa;
END;
GO

--
DECLARE @IdCasaConsulta BIGINT;
SET @IdCasaConsulta = 5;

EXEC ObtenerInfoCasa @IdCasaConsulta;

--
CREATE PROCEDURE ActualizarAlquiler
    @IdCasa BIGINT,
    @DescripcionCasa VARCHAR(30),
    @PrecioCasa DECIMAL(10,2),
    @UsuarioAlquiler VARCHAR(30),
    @FechaAlquiler DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualizar la casa
    UPDATE CasasSistema
    SET
        DescripcionCasa = @DescripcionCasa,
        PrecioCasa = @PrecioCasa,
        UsuarioAlquiler = @UsuarioAlquiler,
        FechaAlquiler = ISNULL(@FechaAlquiler, GETDATE())
    WHERE
        IdCasa = @IdCasa;
END;
GO


--
DECLARE @IdCasaToUpdate BIGINT = 1;
DECLARE @NuevaDescripcionCasa VARCHAR(30) = 'Nueva Descripción';
DECLARE @NuevoPrecioCasa DECIMAL(10,2) = 150000.00;
DECLARE @NuevoUsuarioAlquiler VARCHAR(30) = 'Nuevo Usuario';
DECLARE @NuevaFechaAlquiler DATETIME = '2023-01-01';

EXEC ActualizarAlquiler
    @IdCasa = @IdCasaToUpdate,
    @DescripcionCasa = @NuevaDescripcionCasa,
    @PrecioCasa = @NuevoPrecioCasa,
    @UsuarioAlquiler = @NuevoUsuarioAlquiler,
    @FechaAlquiler = @NuevaFechaAlquiler;

