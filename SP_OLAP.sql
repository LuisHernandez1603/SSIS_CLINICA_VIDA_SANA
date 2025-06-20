USE [BD_OLAP_PRUEBA]
GO
/****** Object:  Schema [int]    Script Date: 20/06/2025 11:27:AM ******/
CREATE SCHEMA [int]
GO
/****** Object:  Table [dbo].[DimCitas]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCitas](
	[idCita] [int] NOT NULL,
	[confirmacion] [bit] NOT NULL,
	[fechaHora] [datetime] NOT NULL,
	[codigoCita] [int] NOT NULL,
	[activo] [bit] NOT NULL,
	[doctor_id] [int] NOT NULL,
	[paciente_id] [int] NOT NULL,
	[recepcionista_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimConsulta]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimConsulta](
	[idConsulta] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](max) NULL,
	[diagnostico] [nvarchar](max) NULL,
	[recomendaciones] [nvarchar](max) NULL,
	[codigo_Consulta] [varchar](50) NULL,
	[activo] [bit] NOT NULL,
	[cita_id] [int] NULL,
 CONSTRAINT [PK__DimConsu__CA9C61F58647D71B] PRIMARY KEY CLUSTERED 
(
	[idConsulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDoctor]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDoctor](
	[idDoctor] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[correo_electronico] [varchar](50) NULL,
	[activo] [bit] NULL,
	[especialidad_id] [int] NULL,
 CONSTRAINT [PK_DimDoctor] PRIMARY KEY CLUSTERED 
(
	[idDoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimPaciente]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPaciente](
	[idPaciente] [int] IDENTITY(1,1) NOT NULL,
	[numero_cedula] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[correo_electronico] [varchar](50) NULL,
	[fecha_nacimiento] [varchar](50) NULL,
 CONSTRAINT [PK__DimPacie__F48A08F26B515C11] PRIMARY KEY CLUSTERED 
(
	[idPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimRecepcionista]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimRecepcionista](
	[id_Recepcionista] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[correo_electronico] [varchar](50) NULL,
	[fecha_ingreso] [datetime] NULL,
	[codigo_Recepcionista] [varchar](50) NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK__DimRecep__A854D2DEE5E95DFF] PRIMARY KEY CLUSTERED 
(
	[id_Recepcionista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimTiempo]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTiempo](
	[idTiempo] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[dia] [int] NULL,
	[mes] [int] NULL,
	[nombreMes] [varchar](20) NULL,
	[anio] [int] NULL,
	[trimestre] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTiempo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HechosCitas]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HechosCitas](
	[idCita] [int] IDENTITY(1,1) NOT NULL,
	[idPaciente] [int] NULL,
	[idDoctor] [int] NULL,
	[id_Recepcionista] [int] NULL,
 CONSTRAINT [PK__HechosCi__814F3126DC63F213] PRIMARY KEY CLUSTERED 
(
	[idCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staging_Citas]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staging_Citas](
	[idCita] [int] NULL,
	[confirmacion] [bit] NULL,
	[fechaHora] [datetime] NULL,
	[codigoCita] [int] NULL,
	[activo] [bit] NULL,
	[doctor_id] [int] NULL,
	[paciente_id] [int] NULL,
	[recepcionista_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staging_Consultas]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staging_Consultas](
	[idConsulta] [int] NULL,
	[descripcion] [nvarchar](max) NULL,
	[diagnostico] [nvarchar](max) NULL,
	[recomendaciones] [nvarchar](max) NULL,
	[codigo_Consulta] [varchar](50) NULL,
	[activo] [bit] NULL,
	[cita_id] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staging_Doctor]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staging_Doctor](
	[idDoctor] [int] NULL,
	[nombre] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[correo_electronico] [varchar](50) NULL,
	[activo] [bit] NULL,
	[especialidad_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staging_HechosCitas]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staging_HechosCitas](
	[idCita] [bigint] NOT NULL,
	[idPaciente] [int] NULL,
	[idDoctor] [int] NULL,
	[id_Recepcionista] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staging_Paciente]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staging_Paciente](
	[idPaciente] [varchar](50) NULL,
	[numero_cedula] [varchar](100) NULL,
	[nombre] [varchar](100) NULL,
	[apellido] [varchar](255) NULL,
	[fecha_nacimiento] [varchar](255) NULL,
	[correo_electronico] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staging_Recepcionistas]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staging_Recepcionistas](
	[id_Recepcionista] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[correo_electronico] [varchar](50) NULL,
	[fecha_ingreso] [datetime] NULL,
	[codigo_Recepcionista] [varchar](50) NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Recepcionista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [int].[IncrementalLoads]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [int].[IncrementalLoads](
	[TableName] [nvarchar](100) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TableName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [int].[Lineage]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [int].[Lineage](
	[LineageKey] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](100) NOT NULL,
	[StartLoad] [datetime] NOT NULL,
	[FinishLoad] [datetime] NULL,
	[Status] [char](1) NOT NULL,
	[Type] [char](1) NOT NULL,
	[LastLoadedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LineageKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimConsulta] ADD  CONSTRAINT [DF__DimConsul__activ__208CD6FA]  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[HechosCitas]  WITH CHECK ADD  CONSTRAINT [FK_HechosCitas_DimDoctor] FOREIGN KEY([idDoctor])
REFERENCES [dbo].[DimDoctor] ([idDoctor])
GO
ALTER TABLE [dbo].[HechosCitas] CHECK CONSTRAINT [FK_HechosCitas_DimDoctor]
GO
ALTER TABLE [dbo].[HechosCitas]  WITH CHECK ADD  CONSTRAINT [FK_HechosCitas_DimPaciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[DimPaciente] ([idPaciente])
GO
ALTER TABLE [dbo].[HechosCitas] CHECK CONSTRAINT [FK_HechosCitas_DimPaciente]
GO
ALTER TABLE [dbo].[HechosCitas]  WITH CHECK ADD  CONSTRAINT [FK_HechosCitas_DimRecepcionista] FOREIGN KEY([id_Recepcionista])
REFERENCES [dbo].[DimRecepcionista] ([id_Recepcionista])
GO
ALTER TABLE [dbo].[HechosCitas] CHECK CONSTRAINT [FK_HechosCitas_DimRecepcionista]
GO
ALTER TABLE [int].[Lineage]  WITH CHECK ADD CHECK  (([Status]='F' OR [Status]='P'))
GO
ALTER TABLE [int].[Lineage]  WITH CHECK ADD CHECK  (([Type]='F' OR [Type]='I'))
GO
/****** Object:  StoredProcedure [dbo].[Get_LastLoadedDate]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Get_LastLoadedDate]
@TableName nvarchar(100)
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
	DECLARE @Tabla NVARCHAR(100)
	--AGregado
	SELECT @Tabla = value
	FROM STRING_SPLIT(@TableName, '.')
	WHERE RTRIM(value) <> 'dw_paciente';
	--TErmina

	IF NOT EXISTS(SELECT 1 FROM sys.objects WHERE name = @Tabla AND type = N'U')
	BEGIN
        PRINT N'The table does not exist in the data warehouse.';
        THROW 51000, N'The table does not exist in the data warehouse.', 1;
        RETURN -1;
	END
	
	IF NOT EXISTS (SELECT 1 FROM [int].[IncrementalLoads] WHERE TableName = @TableName)
		INSERT INTO [int].[IncrementalLoads]
		SELECT @TableName, '1753-01-01'

	SELECT 
		[LoadDate] AS [LoadDate]
    FROM [int].[IncrementalLoads]
    WHERE 
		[TableName] = @TableName;

    RETURN 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[Get_LineageKey]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_LineageKey]
    @LoadType nvarchar(1),
    @TableName nvarchar(100),
    @LastLoadedDate datetime
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @StartLoad datetime = SYSDATETIME();

    INSERT INTO [int].[Lineage] (
         [TableName],
         [StartLoad],
         [FinishLoad],
         [Status],
         [Type],
         [LastLoadedDate]
    )
    VALUES (
         @TableName,
         @StartLoad,
         NULL,
         'P',
         @LoadType,
         @LastLoadedDate
    );

    IF (@LoadType = 'F')
    BEGIN
        UPDATE [int].[IncrementalLoads]
        SET LoadDate = '1753-01-01'
        WHERE TableName = @TableName;

        DECLARE @sql NVARCHAR(MAX);
        SET @sql = 'DELETE FROM ' + QUOTENAME(@TableName) + ';';
        EXEC(@sql);
    END;

    SELECT MAX([LineageKey]) AS LineageKey
    FROM [int].[Lineage]
    WHERE 
        [TableName] = @TableName
        AND [StartLoad] = @StartLoad;

    RETURN 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[Load_DimCitas]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Load_DimCitas]
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRAN;

    -- Insertar fila por defecto si la tabla está vacía
    IF NOT EXISTS (SELECT 1 FROM DimCitas)
    BEGIN
        INSERT INTO DimCitas (
            idCita,
            confirmacion,
            fechaHora,
            codigoCita,
            activo,
            doctor_id,
            paciente_id,
            recepcionista_id
        )
        VALUES (
            0,
            0,
            '1753-01-01 00:00:00',
            0,
            0,
            0,
            0,
            0
        );
    END

    -- Insertar datos desde la tabla staging
    INSERT INTO DimCitas (
        idCita,
        confirmacion,
        fechaHora,
        codigoCita,
        activo,
        doctor_id,
        paciente_id,
        recepcionista_id
    )
    SELECT 
        idCita,
        confirmacion,
        fechaHora,
        codigoCita,
        activo,
        doctor_id,
        paciente_id,
        recepcionista_id
    FROM Staging_Citas;

    COMMIT;
END;
GO
/****** Object:  StoredProcedure [dbo].[Load_DimConsulta]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Load_DimConsulta]
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRAN;

    -- Insertar fila por defecto si la tabla está vacía (sin idConsulta)
    IF NOT EXISTS (SELECT 1 FROM DimConsulta)
    BEGIN
        INSERT INTO DimConsulta (
            descripcion,
            diagnostico,
            recomendaciones,
            codigo_Consulta,
            activo,
            cita_id
        )
        VALUES (
            'N/A',
            'N/A',
            'N/A',
            'N/A',
            0,
            0
        );
    END

    -- Insertar datos desde Staging sin idConsulta
    INSERT INTO DimConsulta (
        descripcion,
        diagnostico,
        recomendaciones,
        codigo_Consulta,
        activo,
        cita_id
    )
    SELECT 
        descripcion,
        diagnostico,
        recomendaciones,
        codigo_Consulta,
        activo,
        cita_id
    FROM Staging_Consultas
    WHERE activo = 1
      AND NOT EXISTS (
        SELECT 1 FROM DimConsulta dc
        WHERE dc.descripcion = Staging_Consultas.descripcion
          AND dc.codigo_Consulta = Staging_Consultas.codigo_Consulta
      );

    COMMIT;
END;
GO
/****** Object:  StoredProcedure [dbo].[Load_DimDate]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Load_DimDate] 
    @StartDate DATE = '2020-01-01', 
    @EndDate DATE = '2025-12-31' 
AS
BEGIN
  
    INSERT INTO DimDate (DateColumn)
    SELECT DateColumn
    FROM SomeOtherTable
    WHERE DateColumn BETWEEN @StartDate AND @EndDate;

END;
GO
/****** Object:  StoredProcedure [dbo].[Load_DimDoctor]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Load_DimDoctor]
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRAN;

    -- Insertar fila por defecto si la dimensión está vacía
    IF NOT EXISTS (SELECT 1 FROM DimDoctor)
    BEGIN
        INSERT INTO DimDoctor (
            idDoctor,
            nombre,
            apellidos,
            telefono,
            correo_electronico,
            activo,
            especialidad_id
        )
        VALUES (
            0,
            'N/A',
            'N/A',
            'N/A',
            'N/A',
            0,
            0
        );
    END

    -- Insertar nuevos registros evitando duplicados por idDoctor
    INSERT INTO DimDoctor (
        idDoctor,
        nombre,
        apellidos,
        telefono,
        correo_electronico,
        activo,
        especialidad_id
    )
    SELECT 
        s.idDoctor,
        s.nombre,
        s.apellidos,
        s.telefono,
        s.correo_electronico,
        s.activo,
        s.especialidad_id
    FROM Staging_Doctor s
    WHERE s.activo = 1
      AND NOT EXISTS (
          SELECT 1 
          FROM DimDoctor d
          WHERE d.idDoctor = s.idDoctor
      );

    COMMIT;
END;

GO
/****** Object:  StoredProcedure [dbo].[Load_DimPaciente]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Load_DimPaciente]
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRAN;

    -- Eliminar todos los datos para forzar recarga limpia (opcional según diseño)
    DELETE FROM DimPaciente;
    DBCC CHECKIDENT('DimPaciente', RESEED, 0);

    -- Activar IDENTITY_INSERT para insertar los IDs desde staging
    SET IDENTITY_INSERT DimPaciente ON;

    -- Insertar datos con ID desde Staging_Paciente
    INSERT INTO DimPaciente (idPaciente, numero_cedula, nombre, apellido, correo_electronico, fecha_nacimiento)
    SELECT 
        sp.idPaciente,
        sp.numero_cedula, 
        sp.nombre, 
        sp.apellido, 
        sp.correo_electronico, 
        sp.fecha_nacimiento
    FROM Staging_Paciente sp;

    SET IDENTITY_INSERT DimPaciente OFF;

    COMMIT;

    -- (Opcional) Devolver datos para revisión en SSIS
    SELECT 
        idPaciente,
        numero_cedula, 
        nombre, 
        apellido, 
        correo_electronico, 
        fecha_nacimiento
    FROM DimPaciente;
END;
GO
/****** Object:  StoredProcedure [dbo].[Load_DimRecepcionista]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Load_DimRecepcionista]
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRAN;

    -- Insertar fila por defecto si la dimensión está vacía
    IF NOT EXISTS (SELECT 1 FROM DimRecepcionista)
    BEGIN
        INSERT INTO DimRecepcionista (
            nombre, apellidos, telefono, correo_electronico, fecha_ingreso, codigo_Recepcionista, activo
        )
        VALUES (
            'N/A', 'N/A', 'N/A', 'N/A', '1900-01-01', '0000', 0
        );
    END

    -- Insertar nuevos registros desde staging evitando duplicados
    INSERT INTO DimRecepcionista (
        nombre, apellidos, telefono, correo_electronico, fecha_ingreso, codigo_Recepcionista, activo
    )
    SELECT
        s.nombre,
        s.apellidos,
        s.telefono,
        s.correo_electronico,
        s.fecha_ingreso,
        s.codigo_Recepcionista,
        s.activo
    FROM Staging_Recepcionistas s
    WHERE s.activo = 1
      AND NOT EXISTS (
        SELECT 1
        FROM DimRecepcionista d
        WHERE d.codigo_Recepcionista = s.codigo_Recepcionista
    );

    COMMIT;
END;
GO
/****** Object:  StoredProcedure [dbo].[Load_DimTiempo]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Load_DimTiempo]
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRAN;

    -- Si está vacía, la llenamos
    IF NOT EXISTS (SELECT 1 FROM DimTiempo)
    BEGIN
        DECLARE @fechaInicio DATE = '2020-01-01';
        DECLARE @fechaFin DATE = '2030-12-31';

        WHILE @fechaInicio <= @fechaFin
        BEGIN
            INSERT INTO DimTiempo (
                fecha,
                dia,
                mes,
                nombreMes,
                anio,
                trimestre
            )
            VALUES (
                @fechaInicio,
                DAY(@fechaInicio),
                MONTH(@fechaInicio),
                DATENAME(MONTH, @fechaInicio),
                YEAR(@fechaInicio),
                DATEPART(QUARTER, @fechaInicio)
            );

            SET @fechaInicio = DATEADD(DAY, 1, @fechaInicio);
        END
    END

    COMMIT;
END;
GO
/****** Object:  StoredProcedure [dbo].[Load_HechosCitas]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Load_HechosCitas]
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRAN;

    -- Eliminar todos los datos de HechosCitas
    DELETE FROM HechosCitas;
    DBCC CHECKIDENT('HechosCitas', RESEED, 0);

    -- Insertar solo registros válidos que tengan coincidencias en TODAS las dimensiones
    INSERT INTO HechosCitas (idPaciente, idDoctor, id_Recepcionista)
    SELECT 
        h.idPaciente,
        h.idDoctor,
        h.id_Recepcionista
    FROM Staging_HechosCitas h
    INNER JOIN DimPaciente p ON h.idPaciente = p.idPaciente
    INNER JOIN DimDoctor d ON h.idDoctor = d.idDoctor
    INNER JOIN DimRecepcionista r ON h.id_Recepcionista = r.id_Recepcionista;

    COMMIT;

    -- (Opcional) Devuelve datos cargados
    SELECT * FROM HechosCitas;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Load_DimConsulta]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Load_DimConsulta]
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRAN;

    -- Inserta registro por defecto si la dimensión está vacía
    IF NOT EXISTS (SELECT 1 FROM DimConsulta)
    BEGIN
        INSERT INTO DimConsulta (
            descripcion, diagnostico, recomendaciones, codigo_Consulta
        )
        VALUES ('N/A', 'N/A', 'N/A', 'N/A');
    END

    -- Cargar datos desde Staging evitando duplicados
    INSERT INTO DimConsulta (
        descripcion, diagnostico, recomendaciones, codigo_Consulta
    )
    SELECT 
        sc.descripcion, 
        sc.diagnostico, 
        sc.recomendaciones, 
        sc.codigo_Consulta
    FROM StagingConsulta sc
    WHERE sc.activo = 1 AND NOT EXISTS (
        SELECT 1 
        FROM DimConsulta dc 
        WHERE dc.codigo_Consulta = sc.codigo_Consulta
    );

    COMMIT;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Load_DimDoctor]    Script Date: 20/06/2025 11:27:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Load_DimDoctor]
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRAN;

    -- Inserta fila por defecto si la dimensión está vacía
    IF NOT EXISTS (SELECT 1 FROM DimDoctor)
    BEGIN
        INSERT INTO DimDoctor (nombre, apellido, especialidad)
        VALUES ('N/A', 'N/A', 'N/A');
    END

    -- Carga de datos desde staging evitando duplicados
    INSERT INTO DimDoctor (nombre, apellido, especialidad)
    SELECT s.nombre, s.apellido, s.especialidad
    FROM StagingDoctor s
    WHERE s.activo = 1 AND NOT EXISTS (
        SELECT 1
        FROM DimDoctor d
        WHERE d.nombre = s.nombre AND d.apellido = s.apellido AND d.especialidad = s.especialidad
    );

    COMMIT;
END;
GO
