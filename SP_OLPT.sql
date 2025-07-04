USE [BD_OLPT_PRUEBA]
GO
/****** Object:  Table [dbo].[Citas]    Script Date: 20/06/2025 11:26:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citas](
	[idCita] [int] IDENTITY(1,1) NOT NULL,
	[confirmacion] [bit] NULL,
	[fechaHora] [datetime] NULL,
	[codigoCita] [int] NULL,
	[activo] [bit] NULL,
	[doctor_id] [int] NULL,
	[paciente_id] [int] NULL,
	[recepcionista_id] [int] NULL,
 CONSTRAINT [PK_Citas] PRIMARY KEY CLUSTERED 
(
	[idCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consulta]    Script Date: 20/06/2025 11:26:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consulta](
	[idConsulta] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](max) NULL,
	[diagnostico] [nvarchar](max) NULL,
	[recomendaciones] [nvarchar](max) NULL,
	[codigo_Consulta] [varchar](50) NULL,
	[activo] [bit] NULL,
	[cita_id] [int] NULL,
 CONSTRAINT [PK_Consulta] PRIMARY KEY CLUSTERED 
(
	[idConsulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 20/06/2025 11:26:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[idDoctor] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[correo_electronico] [varchar](50) NULL,
	[activo] [bit] NULL,
	[especialidad_id] [int] NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[idDoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 20/06/2025 11:26:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidad](
	[idEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](50) NULL,
	[codigo_interno] [varchar](50) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_Especialidad] PRIMARY KEY CLUSTERED 
(
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 20/06/2025 11:26:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[idPaciente] [int] IDENTITY(1,1) NOT NULL,
	[numero_cedula] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[fecha_nacimiento] [datetime] NULL,
	[correo_electronico] [varchar](50) NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[idPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recepcionistas]    Script Date: 20/06/2025 11:26:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recepcionistas](
	[id_Recepcionista] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[correo_electronico] [varchar](50) NULL,
	[fecha_ingreso] [datetime] NULL,
	[codigo_Recepcionista] [varchar](50) NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Recepcionistas] PRIMARY KEY CLUSTERED 
(
	[id_Recepcionista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staging_Citas]    Script Date: 20/06/2025 11:26:AM ******/
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
/****** Object:  Table [dbo].[Staging_Consultas]    Script Date: 20/06/2025 11:26:AM ******/
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
/****** Object:  Table [dbo].[Staging_Doctor]    Script Date: 20/06/2025 11:26:AM ******/
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
/****** Object:  Table [dbo].[Staging_HechosCitas]    Script Date: 20/06/2025 11:26:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staging_HechosCitas](
	[idCita] [bigint] NOT NULL,
	[idPaciente] [int] NULL,
	[idDoctor] [int] NULL,
	[idRecepcionista] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staging_Paciente]    Script Date: 20/06/2025 11:26:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staging_Paciente](
	[idPaciente] [int] IDENTITY(1,1) NOT NULL,
	[numero_cedula] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[fecha_nacimiento] [datetime] NULL,
	[correo_electronico] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staging_Recepcionistas]    Script Date: 20/06/2025 11:26:AM ******/
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
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [FK_Citas_Doctor] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[Doctor] ([idDoctor])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [FK_Citas_Doctor]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [FK_Citas_Paciente] FOREIGN KEY([paciente_id])
REFERENCES [dbo].[Paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [FK_Citas_Paciente]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [FK_Citas_Recepcionistas] FOREIGN KEY([recepcionista_id])
REFERENCES [dbo].[Recepcionistas] ([id_Recepcionista])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [FK_Citas_Recepcionistas]
GO
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_Citas] FOREIGN KEY([cita_id])
REFERENCES [dbo].[Citas] ([idCita])
GO
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_Consulta_Citas]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Especialidad] FOREIGN KEY([especialidad_id])
REFERENCES [dbo].[Especialidad] ([idEspecialidad])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Especialidad]
GO
/****** Object:  StoredProcedure [dbo].[Load_StagingCitas]    Script Date: 20/06/2025 11:26:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[Load_StagingCitas]
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    SELECT 
         CAST(idCita AS INT)             AS idCita,
         CAST(confirmacion AS BIT)       AS confirmacion,
         CAST(fechaHora AS DATETIME)     AS fechaHora,
         CAST(codigoCita AS INT)         AS codigoCita,
         CAST(activo AS BIT)             AS activo,
         CAST(doctor_id AS INT)          AS doctor_id,
         CAST(paciente_id AS INT)        AS paciente_id,
         CAST(recepcionista_id AS INT)   AS recepcionista_id
    FROM [dbo].[Citas];
END;
GO
/****** Object:  StoredProcedure [dbo].[Load_StagingConsultas]    Script Date: 20/06/2025 11:26:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Load_StagingConsultas]
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    SELECT 
        CAST(idConsulta AS INT)             AS idConsulta,
        CAST(descripcion AS NVARCHAR(MAX)) AS descripcion,
        CAST(diagnostico AS NVARCHAR(MAX)) AS diagnostico,
        CAST(recomendaciones AS NVARCHAR(MAX)) AS recomendaciones,
        CAST(codigo_Consulta AS VARCHAR(50)) AS codigo_Consulta,
        CAST(activo AS BIT)                 AS activo,
        CAST(cita_id AS INT)                AS cita_id
    FROM [dbo].[Consulta];
END;
GO
/****** Object:  StoredProcedure [dbo].[Load_StagingDoctor]    Script Date: 20/06/2025 11:26:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Load_StagingDoctor]
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    SELECT 
        CAST(idDoctor AS INT) AS idDoctor,
        CAST(nombre AS VARCHAR(50)) AS nombre,
        CAST(apellidos AS VARCHAR(50)) AS apellidos,
        CAST(telefono AS VARCHAR(50)) AS telefono,
        CAST(correo_electronico AS VARCHAR(50)) AS correo_electronico,
        CAST(activo AS BIT) AS activo,
        CAST(especialidad_id AS INT) AS especialidad_id
    FROM dbo.Doctor;
END;
GO
/****** Object:  StoredProcedure [dbo].[Load_StagingHechosCitas]    Script Date: 20/06/2025 11:26:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Load_StagingHechosCitas]
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    -- Selecciona solo las citas que tienen recepcionista asignado
    SELECT 
        CAST(idCita AS INT)            AS idCita,
        CAST(paciente_id AS INT)       AS idPaciente,
        CAST(doctor_id AS INT)         AS idDoctor,
        CAST(recepcionista_id AS INT)  AS id_Recepcionista
    FROM dbo.Citas
    WHERE recepcionista_id IS NOT NULL;
END;
GO
/****** Object:  StoredProcedure [dbo].[Load_StagingPaciente]    Script Date: 20/06/2025 11:26:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Load_StagingPaciente]
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    SELECT 
		CAST(e.idPaciente AS VARCHAR(50))      AS idPaciente,
         CAST(e.numero_cedula AS VARCHAR(50))      AS numero_cedula,
         CAST(e.nombre AS VARCHAR(50))             AS nombre,
         CAST(e.apellidos AS VARCHAR(50))          AS apellido,
         e.fecha_nacimiento,
         CAST(e.correo_electronico AS VARCHAR(50)) AS correo_electronico
    FROM [dbo].[Paciente] e;
END;
GO
/****** Object:  StoredProcedure [dbo].[Load_StagingRecepcionistas]    Script Date: 20/06/2025 11:26:AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Load_StagingRecepcionistas]
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    SELECT 
         CAST(id_Recepcionista AS INT)        AS id_Recepcionista,
         CAST(nombre AS VARCHAR(50))          AS nombre,
         CAST(apellidos AS VARCHAR(50))       AS apellidos,
         CAST(telefono AS VARCHAR(50))        AS telefono,
         CAST(correo_electronico AS VARCHAR(50)) AS correo_electronico,
         CAST(fecha_ingreso AS DATETIME)      AS fecha_ingreso,
         CAST(codigo_Recepcionista AS VARCHAR(50)) AS codigo_Recepcionista,
         CAST(activo AS BIT)                   AS activo
    FROM dbo.Recepcionistas;
END;
GO
