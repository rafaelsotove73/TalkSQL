USE [GestorContrasennas]
GO

/****** Object:  Table [dbo].[ObjTipLCApp]    Script Date: 27/11/2022 12:20:31 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Report].[ObjTipLCApp](
	[IdTableReport] [int] IDENTITY(1,1) NOT NULL,
	[idTipoLC] [int] NOT NULL,
	[DescripcionTipoLC] [varchar](150) NULL,
	[Obs] [varchar](200) NULL,
	[id_user] int
PRIMARY KEY CLUSTERED 
(
	[idTipoLC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


