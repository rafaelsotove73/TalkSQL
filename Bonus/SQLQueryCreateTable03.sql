USE [GestorContrasennas]
GO

/****** Object:  Table [dbo].[ObjContApp_Lic_Pwd]    Script Date: 27/11/2022 12:18:15 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Report].[ObjContApp_Lic_Pwd](
	[IdTableReport] [int] IDENTITY(1,1) NOT NULL,
	[idAppPwd] [int] NOT NULL,
	[DescripcionApp] [varchar](150) NULL,
	[Lic_Contraseña] [varchar](200) NULL,
	[Usu_Mater_LC] [varchar](100) NULL,
	[Usu_Resp] [varchar](100) NULL,
	[Tipo] [int] NULL,
	[OBSER] [varchar](200) NULL,
	[IP_DIR] [varchar](30) NULL,
	[NA_EQUIP] [varchar](40) NULL,
	[LINK] [varchar](500) NULL,
	[id_user] int
PRIMARY KEY CLUSTERED 
(
	[idAppPwd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


