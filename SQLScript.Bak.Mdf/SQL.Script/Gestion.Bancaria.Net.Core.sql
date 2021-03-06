USE [Gestion.Bancaria.Net.Core]
GO
/****** Object:  Table [dbo].[Grupo]    Script Date: 5/25/2019 11:42:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupo](
	[IdGrupo] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](250) NOT NULL,
	[IPInsercion] [nvarchar](250) NULL,
	[Color] [nvarchar](250) NULL,
 CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED 
(
	[IdGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entidad]    Script Date: 5/25/2019 11:42:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entidad](
	[IdEntidad] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](250) NOT NULL,
	[Direccion] [nvarchar](250) NULL,
	[Poblacion] [nvarchar](250) NULL,
	[Provincia] [nvarchar](250) NULL,
	[CodigoPostal] [nvarchar](250) NULL,
	[Telefono] [nvarchar](250) NULL,
	[Mail] [nvarchar](250) NULL,
	[Logo] [nvarchar](250) NULL,
	[FechaInsercion] [datetime] NULL,
	[IPInsercion] [nvarchar](250) NULL,
	[EstadoActivo] [bit] NULL,
	[Pais] [nvarchar](250) NULL,
 CONSTRAINT [PK_Entidad] PRIMARY KEY CLUSTERED 
(
	[IdEntidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GrupoEntidad]    Script Date: 5/25/2019 11:42:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrupoEntidad](
	[IdGrupoEntidad] [bigint] IDENTITY(1,1) NOT NULL,
	[IdGrupo] [bigint] NOT NULL,
	[IdEntidad] [bigint] NOT NULL,
	[FechaInsercion] [datetime] NULL,
 CONSTRAINT [PK_GrupoEntidad] PRIMARY KEY CLUSTERED 
(
	[IdGrupoEntidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[EntidadesAsociadas]    Script Date: 5/25/2019 11:42:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
/*****GrupoEntidad, tabla de asociación para entidades bancarias a los grupos bancarios******/
Desarrollador: 
Carlos Mario Celedón Rodelo
Desarrollador Senior de Software - www.cmceledon.com
Bogotá, Cundinamarca
carlos@cmceledon.com
3004559711

Prueba técnica de desarrollo para: 
NECOMPLUS
http://necomplus.com/
*/
CREATE VIEW [dbo].[EntidadesAsociadas]
AS

	SELECT GE.IdGrupoEntidad, GE.IdGrupo, GE.IdEntidad, G.Nombre AS NombreGrupo, E.Nombre AS NombreEntidad, GE.FechaInsercion
	FROM 
	GrupoEntidad		GE 
	INNER JOIN Entidad	E	ON	GE.IdEntidad	=	E.IdEntidad
	INNER JOIN Grupo	G	ON	GE.IdGrupo		=	G.IdGrupo
	WHERE E.EstadoActivo = 1

GO
SET IDENTITY_INSERT [dbo].[Entidad] ON 

INSERT [dbo].[Entidad] ([IdEntidad], [Nombre], [Direccion], [Poblacion], [Provincia], [CodigoPostal], [Telefono], [Mail], [Logo], [FechaInsercion], [IPInsercion], [EstadoActivo], [Pais]) VALUES (1, N'Bank - Excelkis Tatiana Barros', N'Valledupar', N'Colombia', N'Valledupar', N'54545', N'305123456', N'excelkis@info.com', N'Logotipo', CAST(N'2019-05-25T18:30:33.390' AS DateTime), N'181.49.68.20', 1, NULL)
INSERT [dbo].[Entidad] ([IdEntidad], [Nombre], [Direccion], [Poblacion], [Provincia], [CodigoPostal], [Telefono], [Mail], [Logo], [FechaInsercion], [IPInsercion], [EstadoActivo], [Pais]) VALUES (2, N'Davivienda', N'Bogotá - Colombia', N'Colombia', N'Bogotá', N'787', N'4566255', N'info@davivienda.com', N'Logotipo', CAST(N'2019-05-25T18:31:24.650' AS DateTime), N'181.49.68.20', 1, NULL)
INSERT [dbo].[Entidad] ([IdEntidad], [Nombre], [Direccion], [Poblacion], [Provincia], [CodigoPostal], [Telefono], [Mail], [Logo], [FechaInsercion], [IPInsercion], [EstadoActivo], [Pais]) VALUES (3, N'Banco Agrario de Colombia', N'Bogotá - Colombia', N'Colombia', N'Bogotá', N'87005', N'4566255', N'info@bancoagrario.com', N'Logotipo', CAST(N'2019-05-25T18:36:42.393' AS DateTime), N'181.49.68.20', 1, NULL)
INSERT [dbo].[Entidad] ([IdEntidad], [Nombre], [Direccion], [Poblacion], [Provincia], [CodigoPostal], [Telefono], [Mail], [Logo], [FechaInsercion], [IPInsercion], [EstadoActivo], [Pais]) VALUES (4, N'DARIO', N'3004559711', N'MÁS', N'Bogotá', N'878787', N'455454445', N'MAN@GGG.COM', N'ASDS', CAST(N'2019-05-25T23:33:06.877' AS DateTime), N'181.49.68.20', 1, NULL)
SET IDENTITY_INSERT [dbo].[Entidad] OFF
SET IDENTITY_INSERT [dbo].[Grupo] ON 

INSERT [dbo].[Grupo] ([IdGrupo], [Nombre], [IPInsercion], [Color]) VALUES (1, N'Conavi', NULL, N'Rojo')
INSERT [dbo].[Grupo] ([IdGrupo], [Nombre], [IPInsercion], [Color]) VALUES (2, N'Fusion de los Bancos Bilbao Vizcaya (BBV) ', NULL, N'Verde')
INSERT [dbo].[Grupo] ([IdGrupo], [Nombre], [IPInsercion], [Color]) VALUES (3, N'Corfinsura', NULL, N'Azul')
SET IDENTITY_INSERT [dbo].[Grupo] OFF
SET IDENTITY_INSERT [dbo].[GrupoEntidad] ON 

INSERT [dbo].[GrupoEntidad] ([IdGrupoEntidad], [IdGrupo], [IdEntidad], [FechaInsercion]) VALUES (1, 1, 2, CAST(N'2019-05-25T21:12:44.190' AS DateTime))
INSERT [dbo].[GrupoEntidad] ([IdGrupoEntidad], [IdGrupo], [IdEntidad], [FechaInsercion]) VALUES (2, 1, 1, CAST(N'2019-05-25T22:26:02.147' AS DateTime))
INSERT [dbo].[GrupoEntidad] ([IdGrupoEntidad], [IdGrupo], [IdEntidad], [FechaInsercion]) VALUES (11, 3, 3, CAST(N'2019-05-25T23:13:24.943' AS DateTime))
INSERT [dbo].[GrupoEntidad] ([IdGrupoEntidad], [IdGrupo], [IdEntidad], [FechaInsercion]) VALUES (13, 1, 3, CAST(N'2019-05-25T23:24:31.210' AS DateTime))
SET IDENTITY_INSERT [dbo].[GrupoEntidad] OFF
ALTER TABLE [dbo].[Entidad] ADD  CONSTRAINT [DF_Entidad_FechaInsercion]  DEFAULT (getdate()) FOR [FechaInsercion]
GO
ALTER TABLE [dbo].[Entidad] ADD  CONSTRAINT [DF_Entidad_EstadoActivo]  DEFAULT ((1)) FOR [EstadoActivo]
GO
ALTER TABLE [dbo].[GrupoEntidad] ADD  CONSTRAINT [DF_GrupoEntidad_FechaInsercion]  DEFAULT (getdate()) FOR [FechaInsercion]
GO
ALTER TABLE [dbo].[GrupoEntidad]  WITH CHECK ADD  CONSTRAINT [FK_GrupoEntidad_Entidad] FOREIGN KEY([IdEntidad])
REFERENCES [dbo].[Entidad] ([IdEntidad])
GO
ALTER TABLE [dbo].[GrupoEntidad] CHECK CONSTRAINT [FK_GrupoEntidad_Entidad]
GO
ALTER TABLE [dbo].[GrupoEntidad]  WITH CHECK ADD  CONSTRAINT [FK_GrupoEntidad_Grupo] FOREIGN KEY([IdGrupo])
REFERENCES [dbo].[Grupo] ([IdGrupo])
GO
ALTER TABLE [dbo].[GrupoEntidad] CHECK CONSTRAINT [FK_GrupoEntidad_Grupo]
GO
/****** Object:  StoredProcedure [dbo].[ConsultarEntidades]    Script Date: 5/25/2019 11:42:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
/*****GrupoEntidad, tabla de asociación para entidades bancarias a los grupos bancarios******/

Desarrollador: 
Carlos Mario Celedón Rodelo
Desarrollador Senior de Software - www.cmceledon.com
Bogotá, Cundinamarca
carlos@cmceledon.com
3004559711

Prueba técnica de desarrollo para: 
NECOMPLUS
http://necomplus.com/
*/
CREATE PROCEDURE [dbo].[ConsultarEntidades]
(
@Nombre NVARCHAR(250)  NULL
,@Direccion NVARCHAR(250)  NULL
,@EstadoActivo BIT NULL
)
AS
BEGIN

	SELECT IdEntidad, Nombre, Direccion, Poblacion, Provincia, CodigoPostal, Telefono, Mail, Logo, CONVERT(VARCHAR,FechaInsercion) AS FechaInsercion, IPInsercion, EstadoActivo 
	FROM Entidad

END
GO
/****** Object:  StoredProcedure [dbo].[EliminarDatos]    Script Date: 5/25/2019 11:42:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
/*****GrupoEntidad, tabla de asociación para entidades bancarias a los grupos bancarios******/

Desarrollador: 
Carlos Mario Celedón Rodelo
Desarrollador Senior de Software - www.cmceledon.com
Bogotá, Cundinamarca
carlos@cmceledon.com
3004559711

Prueba técnica de desarrollo para: 
NECOMPLUS
http://necomplus.com/
*/
CREATE PROCEDURE [dbo].[EliminarDatos]
AS
BEGIN
DELETE FROM GrupoEntidad
DELETE FROM Entidad
DELETE FROM Grupo

DBCC CHECKIDENT('GrupoEntidad', RESEED, 0)
DBCC CHECKIDENT('Entidad', RESEED, 0)
DBCC CHECKIDENT('Grupo', RESEED, 0)

END
GO
/****** Object:  Trigger [dbo].[DisparadorGrupoEntidad]    Script Date: 5/25/2019 11:42:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
/*****GrupoEntidad, tabla de asociación para entidades bancarias a los grupos bancarios******/
Desarrollador: 
Carlos Mario Celedón Rodelo
Desarrollador Senior de Software - www.cmceledon.com
Bogotá, Cundinamarca
carlos@cmceledon.com
3004559711

Prueba técnica de desarrollo para: 
NECOMPLUS
http://necomplus.com/
*/
CREATE TRIGGER [dbo].[DisparadorGrupoEntidad]
  ON [dbo].[GrupoEntidad]
  FOR INSERT
  AS
  BEGIN
   DECLARE @ExisteRelacion INT = 0
   DECLARE @IdGrupo BIGINT = 0
   SET @IdGrupo = (SELECT Insertando.IdGrupo FROM INSERTED Insertando)
   PRINT '@IdGrupo: '
   PRINT @IdGrupo

    DECLARE @IdEntidad BIGINT = 0
   SET @IdEntidad = (SELECT Insertando.IdEntidad FROM INSERTED Insertando)
   PRINT '@IdEntidad: '
   PRINT @IdEntidad

  SELECT @ExisteRelacion= COUNT(Insertado.IdEntidad) 
			FROM GrupoEntidad Insertado
		 WHERE Insertado.IdEntidad=@IdEntidad AND Insertado.IdGrupo = @IdGrupo
  
  PRINT '@ExisteRelacion: '
  PRINT @ExisteRelacion
	
  IF(@ExisteRelacion>1)
   BEGIN
     RAISERROR ('La asociación ya existe', 16, 1)
    ROLLBACK TRANSACTION
   END
END
GO
ALTER TABLE [dbo].[GrupoEntidad] ENABLE TRIGGER [DisparadorGrupoEntidad]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'/*****Entidad, tabla de los entidades bancarias******/

Desarrollador: 
Carlos Mario Celedón Rodelo
Desarrollador Senior de Software - www.cmceledon.com
Bogotá, Cundinamarca
carlos@cmceledon.com
3004559711

Prueba técnica de desarrollo para: 
NECOMPLUS
http://necomplus.com/' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Entidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'/*****Grupo, tabla de los grupos bancarios******/

Desarrollador: 
Carlos Mario Celedón Rodelo
Desarrollador Senior de Software - www.cmceledon.com
Bogotá, Cundinamarca
carlos@cmceledon.com
3004559711

Prueba técnica de desarrollo para: 
NECOMPLUS
http://necomplus.com/' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Grupo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'/*****GrupoEntidad, tabla de asociación para entidades bancarias a los grupos bancarios******/

Desarrollador: 
Carlos Mario Celedón Rodelo
Desarrollador Senior de Software - www.cmceledon.com
Bogotá, Cundinamarca
carlos@cmceledon.com
3004559711

Prueba técnica de desarrollo para: 
NECOMPLUS
http://necomplus.com/' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GrupoEntidad'
GO
