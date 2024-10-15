--- ### ### ################################################################################
--- ### ### CREACION SIMPLE DE TABLA CON INDICE
--- ### ### ################################################################################
/*
--- ### ### CREATE TABLE [Report].[ObjContApp_Licencia]: Esta línea crea una tabla llamada 
--- ### ### [ObjContApp_Licencia] en el esquema [Report]. 
--- ### ### [IdTableReport] [int] IDENTITY(1,1) NOT NULL: Esta columna IdTableReport 
--- ### ### es de tipo int y se establece como una columna de identidad (IDENTITY(1,1)) 
--- ### ### que generará automáticamente valores incrementales a partir de 1. 
--- ### ### La columna no puede contener valores nulos (NOT NULL).[idAppPwd] [int], 
--- ### ### [DescripcionApp] [varchar](150) NULL, [Lic_Contraseña] [varchar](200) NULL, 
--- ### ### ...: Estas son las demás columnas de la tabla con sus tipos de datos y opciones. 
--- ### ### Algunas columnas permiten valores nulos (NULL) mientras que otras no lo permiten.
--- ### ### PRIMARY KEY CLUSTERED ([idAppPwd] ASC) WITH ...: 
--- ### ### Esta parte define un índice primario en la columna [idAppPwd] en orden ascendente (ASC). 
--- ### ### El índice primario se crea con varias opciones que especifican cómo se almacena 
--- ### ### y se bloquea la tabla.
--- ### ### El código también incluye algunas opciones adicionales relacionadas con el almacenamiento 
--- ### ### y el rendimiento de la tabla, como PAD_INDEX, STATISTICS_NORECOMPUTE, IGNORE_DUP_KEY, 
--- ### ### ALLOW_ROW_LOCKS, ALLOW_PAGE_LOCKS y OPTIMIZE_FOR_SEQUENTIAL_KEY.
--- ### ### ################################################################################
--- ### ### PAD_INDEX: Esta opción determina si se debe realizar un relleno de página para 
--- ### ### mantener el índice al 100% de utilización de espacio en las páginas. Un valor de 
--- ### ### OFF indica que no se realiza relleno de página, mientras que ON indica que se 
--- ### ### realiza el relleno de página. El relleno de página puede mejorar el rendimiento 
--- ### ### de las operaciones de búsqueda, pero puede consumir más espacio en disco.
--- ### ### ################################################################################
--- ### ### STATISTICS_NORECOMPUTE: Esta opción determina si las estadísticas asociadas al 
--- ### ### índice deben actualizarse automáticamente. Un valor de OFF indica que se deben 
--- ### ### recalcular las estadísticas, mientras que ON indica que no se recalcularán 
--- ### ### automáticamente. Si las estadísticas se recopilan con poca frecuencia, puede ser 
--- ### ### útil establecer esta opción en OFF para evitar la sobrecarga de cálculo de estadísticas.
--- ### ### ################################################################################
--- ### ### IGNORE_DUP_KEY: Esta opción determina cómo se manejan las claves duplicadas en 
--- ### ### el índice. Un valor de OFF indica que se generarán errores al intentar insertar 
--- ### ### claves duplicadas, mientras que ON indica que las claves duplicadas se ignorarán 
--- ### ### y no se generarán errores. Si deseas evitar la inserción de claves duplicadas, 
--- ### ### es preferible mantener esta opción en OFF.
--- ### ### ################################################################################
--- ### ### ALLOW_ROW_LOCKS y ALLOW_PAGE_LOCKS: Estas opciones determinan si se permiten bloqueos 
--- ### ### de nivel de fila y bloqueos de nivel de página respectivamente. Un valor de ON indica 
--- ### ### que se permiten los bloqueos correspondientes, mientras que OFF indica que no se permiten. 
--- ### ### Los bloqueos de nivel de fila y página son mecanismos utilizados por SQL 
--- ### ### Server para administrar la concurrencia en operaciones de escritura y lectura. 
--- ### ### Estas opciones controlan cómo se aplican los bloqueos en la tabla.
--- ### ### ################################################################################
--- ### ### OPTIMIZE_FOR_SEQUENTIAL_KEY: Esta opción indica si el índice está optimizado para 
--- ### ### claves de tipo secuencial, como identidades o valores generados secuencialmente. 
--- ### ### Un valor de OFF indica que el índice no está optimizado para claves secuenciales, 
--- ### ### mientras que ON indica que está optimizado. La optimización para claves secuenciales 
--- ### ### puede mejorar el rendimiento al reducir la fragmentación del índice.
*/
--- ### ### ################################################################################

-- (245)
USE [GestorContrasennas]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Report].[ObjContApp_Licencia](
    [IdTableReport] [int] IDENTITY(1,1) NOT NULL,
	[idAppPwd] [int],
	[DescripcionApp] [varchar](150) NULL,
	[Lic_Contraseña] [varchar](200) NULL,
	[Usu_Mater_LC] [varchar](100) NULL,
	[Tipo] [int] NULL,
	[SubCategoria] [int] NULL,
	[Mantenimiento] [varchar](1) NULL,
	[Cantidad_usu] [int] NULL,
	[Version] [varchar](20) NULL,
	[fecha_adquis] [date] NULL,
	[fecha_renov] [date] NULL,
	[deporvida] [bit] NULL,
	[Contacto] [varchar](50) NULL,
	[Empresa] [varchar](100) NULL,
	[OBSER] [varchar](200) NULL,
	[Telefono_contacto] [varchar](30) NULL,
	[SERIAL] [varchar](50) NULL,
	[id_user] int
PRIMARY KEY CLUSTERED 
(
	[idAppPwd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, 
  ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


---- OTRA VARIENTE
-- (246)

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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

---- OTRA VARIENTE
-- (247)

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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
  ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--- ### ### ################################################################################
--- ### ### CREACION DE TABLAS TEMPORALES
--- ### ### ################################################################################
/*
--- ### ### ################################################################################
--- ### ### Una tabla temporal local (#NombreTabla)
--- ### ### ##########################################
--- ### ### se crea con un prefijo de un solo signo de número (#) seguido del nombre de la tabla.
--- ### ### La tabla temporal local solo es visible dentro de la sesión o conexión de la base de 
--- ### ### datos en la que se creó. Cuando la sesión se cierra, la tabla temporal local se elimina 
--- ### ### automáticamente.
--- ### ### La tabla temporal local se puede utilizar para almacenar datos temporales o intermedios 
--- ### ### durante la ejecución de consultas o procesos específicos.
--- ### ### No se pueden compartir entre diferentes sesiones o conexiones de la base de datos.
--- ### ### Los nombres de tabla temporal local deben ser únicos dentro de la sesión en la que se crean.

--- ### ### Una tabla temporal global (##NombreTabla) 
--- ### ### ##########################################
--- ### ### se crea con un prefijo de dos signos de número (##) seguido del nombre de la tabla.
--- ### ### La tabla temporal global es visible para todas las sesiones o conexiones de la base 
--- ### ### de datos. Permanece disponible hasta que se elimine explícitamente.
--- ### ### La tabla temporal global se puede utilizar para compartir datos entre diferentes 
--- ### ### sesiones o conexiones de la base de datos. Cada sesión puede leer y escribir en la 
--- ### ### tabla temporal global. Los nombres de tabla temporal global deben ser únicos dentro 
--- ### ### de la base de datos.
--- ### ### ################################################################################

--- ### ### Diferencias:
--- ### ### ##########################################
--- ### ### Alcance: La tabla temporal local es visible y accesible solo dentro 
--- ### ### de la sesión en la que se creó, mientras que la tabla temporal global es visible 
--- ### ### y accesible para todas las sesiones o conexiones de la base de datos.
--- ### ### Persistencia: La tabla temporal local se elimina automáticamente al finalizar 
--- ### ### la sesión, mientras que la tabla temporal global permanece disponible hasta 
--- ### ### que se elimine explícitamente.
--- ### ### Compartir datos: La tabla temporal local no se puede compartir entre diferentes 
--- ### ### sesiones o conexiones, mientras que la tabla temporal global se puede compartir y 
--- ### ### acceder desde diferentes sesiones o conexiones de la base de datos.
--- ### ### Nombres únicos: Los nombres de tabla temporal local deben ser únicos dentro de la sesión, 
--- ### ### mientras que los nombres de tabla temporal global deben ser únicos dentro de la base 
--- ### ### de datos.
--- ### ### ################################################################################



*/


USE AdventureWorks2016_EXT 
-- Crear una tabla temporal local VENTAS
-- (248)

CREATE TABLE #Ventas (
    id INT,
    producto VARCHAR(50),
    cantidad INT,
    precio DECIMAL(10,2)
);

-- Insertar datos en la tabla temporal local
-- (249)
INSERT INTO #Ventas (id, producto, cantidad, precio)
VALUES (1, 'Producto A', 10, 25.99),
       (2, 'Producto B', 5, 19.99),
       (3, 'Producto C', 3, 12.50);

-- Consultar los datos de la tabla temporal local
-- (250)
SELECT * FROM #Ventas;

-- Actualizar los datos de la tabla temporal local
-- (251)
UPDATE #Ventas
SET cantidad = cantidad + 2
WHERE id = 1;

-- Eliminar un registro de la tabla temporal local
-- (252)
DELETE FROM #Ventas WHERE id = 2;

-- Crear una tabla temporal global CLIENTE
-- (253)

CREATE TABLE ##Clientes (
    id INT,
    nombre VARCHAR(50),
    ciudad VARCHAR(50)
);

-- Insertar datos en la tabla temporal global
-- (254)

INSERT INTO ##Clientes (id, nombre, ciudad)
VALUES (1, 'Cliente A', 'Ciudad X'),
       (2, 'Cliente B', 'Ciudad Y'),
       (3, 'Cliente C', 'Ciudad Z');

-- Consultar los datos de la tabla temporal global
-- (255)
SELECT * FROM ##Clientes;

-- Eliminar la tabla temporal global
-- (256)
DROP TABLE ##Clientes;
-- Eliminar la tabla temporal local (se eliminará automáticamente al final de la sesión)
-- (257)
DROP TABLE #Ventas;

