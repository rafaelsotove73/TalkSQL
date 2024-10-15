--- ### ## ###############################################
--- ### ##  FUNCION DE METADATOS
--- ### ## ###############################################
--- ### ## ###############################################



--- (193)
USE AdventureWorks2016_EXT

DECLARE @DatabaseName VARCHAR(50) = 'AdventureWorks2016_EXT';
DECLARE @DatabaseID INT;

SET @DatabaseID = DB_ID(@DatabaseName);

SELECT @DatabaseID AS DatabaseID;

--- ### ###################################################
--- ### Obtener el identificador numérico del objeto listado
--- ### de vista de catálogo sys.objects
--- ### ###################################################
/*
     Que se encuentran los objetos llamados vista de catalosgos 
     Una vista de catálogo en SQL Server es una vista 
     predefinida que proporciona información estructural y 
     de metadatos sobre los objetos y componentes 
     dentro de una base de datos. 
     Estas vistas se encuentran en el esquema de sistema sys y 
     ofrecen una forma conveniente de acceder a información 
     sobre tablas, columnas, índices, procedimientos almacenados, 
     funciones y otros objetos de la base de datos.
*/
--- (194)

SELECT *
FROM sys.objects;

-------------------------------
------------------------------
--- (195)
SELECT 
object_id [Identificador_Obj]
,OBJECT_NAME(object_id) [Nombre_Obj]
FROM sys.objects

-------------------------------
------------------------------
--- (196)

DECLARE @ObjectID INT;
SET @ObjectID = (
    SELECT object_id
    FROM sys.objects
    WHERE OBJECT_NAME(object_id) = 'PK_AWBuildVersion_SystemInformationID'
);

-- Obtener el nombre del objeto utilizando el identificador numérico
DECLARE @ObjectName NVARCHAR(128);
SET @ObjectName = (
    SELECT OBJECT_NAME(@ObjectID)
);

-- Mostrar el nombre del objeto
SELECT DB_NAME()[Database],@ObjectID [id_obj], @ObjectName [Name_Obj] ;

--- ## ###################################################
--- ## ### Se utiliza para obtener el nombre de un objeto 
--- ## ### (BASE DE DATOS )a partir de 
--- ## ### su identificador numérico en la base de datos
--- ## ####################################################
-------------------------------
------------------------------
--- (197)


USE AdventureWorks2016_EXT

SELECT OBJECT_NAME(192719739) AS ObjectName;

-------------------------------
--- LISTA DE SCHEMA DE UNA 
--- BASE DE DATOS
-------------------------------
--- (198)

USE AdventureWorks2016_EXT

SELECT *
FROM sys.schemas;

SELECT name AS SchemaName
FROM sys.schemas;

SELECT s.name AS SchemaName
FROM sys.schemas s
INNER JOIN sys.sysusers u ON s.principal_id = u.uid
WHERE u.islogin = 1;

SELECT schema_id AS SchemaID
FROM sys.schemas;

---------------------------
--- (199)
SELECT * FROM sys.tables
--- (200)
SELECT * FROM sys.procedures
--- (201)
SELECT * FROM sys.views
--- (202)
SELECT * FROM sys.triggers
---(203)
SELECT * FROM sys.master_files
---(204)
SELECT * FROM sys.databases

---------------------------

--- ## ################################################################
--- ## se utiliza para obtener el nombre del esquema de un objeto a partir 
--- ## de su identificador numérico en la base de datos
--- ## ################################################################
---(205)
SELECT OBJECT_SCHEMA_NAME(3) AS SchemaName;

--- ## ################################################################
--- ## Se utiliza para obtener la definición completa + codigo de un objeto en la 
--- ## base de datos a partir de su nombre. Sin embargo, no es posible 
--- ## generar un valor utilizando directamente "OBJECT_DEFINITION" en 
--- ## una consulta
--- ## ################################################################
---(206)
SELECT OBJECT_DEFINITION(OBJECT_ID('HumanResources.vEmployeePersonTemporalInfo')) AS ObjectDefinition;

--- ### ### #################################################################################
--- ### Algunas de las propiedades que se pueden obtener utilizando la función 
--- ### DATABASEPROPERTYEX() incluyen:
--- ### Collation: Devuelve la configuración de intercalación de la base de datos.
--- ### Recovery: Devuelve el modelo de recuperación de la base de datos (Simple, Full, Bulk Logged).
--- ### Size: Devuelve el tamaño total de la base de datos en megabytes.
--- ### IsAutoShrink: Indica si la opción de reducción automática está habilitada (1) o no (0).
--- ### CreateDate: Devuelve la fecha de creación de la base de datos.
--- ###. Definimos una tabla de ejemplo
--- ### ### ###############################################################################

-- Obtener la configuración actual de intercalación de la base de datos AdventureWorks2016_EXT
---(207)
SELECT DATABASEPROPERTYEX('AdventureWorks2016_EXT', 'Collation') AS DatabaseCollation;
-- Obtener el modelo de recuperación de la base de datos 
--- AdventureWorks2016_EXT
---(208)
SELECT DATABASEPROPERTYEX('AdventureWorks2016_EXT', 'Recovery') AS DatabaseRecovery;

-- Obtener el tamaño total de la base de datos AdventureWorks2016_EXT
---(209)
SELECT SUM(size * 8.0 / 1024) AS DatabaseSize
FROM sys.master_files
WHERE DB_NAME(database_id) = 'AdventureWorks2016_EXT' AND type = 0;

--- Obtener la fecha de creación de la base de datos 
--- AdventureWorks2016_EXT
---(210)
SELECT create_date AS DatabaseCreateDate
FROM sys.databases
WHERE name = 'AdventureWorks2016_EXT';

--- ### ### ################################################################
--- ### ### SELECT VARIANTES PARA SERVERPROPERTY
--- ### ### ################################################################

-- Obtener la versión de SQL Server
---(211)
SELECT SERVERPROPERTY('ProductVersion') AS SQLServerVersion;

-- Obtener el nombre del equipo donde se encuentra SQL Server
---(212)
SELECT SERVERPROPERTY('MachineName') AS SQLServerMachineName;

-- Obtener el nivel de compatibilidad de la instancia de SQL Server: 
---(213)
SELECT SERVERPROPERTY('ProductMajorVersion') AS SQLServerMajorVersion,
       SERVERPROPERTY('ProductMinorVersion') AS SQLServerMinorVersion;

-- Obtener el nombre de la edición de SQL Server: 
---(214)
SELECT SERVERPROPERTY('Edition') AS SQLServerEdition;

--- Obtener la configuración de intercalación 
--- predeterminada de la instancia de SQL Server:
/*
La intercalación en SQL Server es un conjunto de reglas 
que define cómo se ordenan y comparan los caracteres y 
las cadenas de caracteres en una base de datos. 
Estas reglas incluyen aspectos como la clasificación de 
caracteres, la sensibilidad a mayúsculas y minúsculas, 
la ordenación de caracteres especiales y acentuados, 
entre otros.

La intercalación afecta el comportamiento de las operaciones que 
involucran cadenas de caracteres, como comparaciones, 
ordenamientos, agrupaciones y búsquedas. Determina cómo se 
realizan estas operaciones y cómo se interpretan los datos 
almacenados en la base de datos.

La intercalación se puede especificar a diferentes 
niveles en SQL Server:

1.- intercalación del servidor: Se aplica a nivel de toda 
la instancia de SQL Server y se establece durante la instalación. 
Es la intercalación predeterminada utilizada por las nuevas 
bases de datos creadas en el servidor si no se especifica 
una intercalación específica.
2.- intercalación de la base de datos: Se aplica a una base de 
datos específica y puede ser diferente de la intercalación del 
servidor. Puede establecerse durante la creación de la base de 
datos o modificarse posteriormente.
3.- intercalación de la columna: Se aplica a una columna 
específica de una tabla y puede ser diferente de la intercalación 
de la base de datos. Permite tener diferentes intercalaciones en 
diferentes columnas de la misma tabla.
Al elegir una intercalación, es importante considerar los 
requisitos lingüísticos y culturales de la aplicación y los 
datos que se almacenarán. Algunas intercalaciones son específicas 
de un idioma o región, mientras que otras son más genéricas y 
admiten múltiples idiomas. 
También es relevante considerar la sensibilidad a 
mayúsculas y minúsculas, la clasificación de caracteres 
especiales y acentuados, y la compatibilidad con versiones 
anteriores de SQL Server.
*/
---(215)
SELECT SERVERPROPERTY('Collation') AS DefaultCollation;

-- Obtener la ruta de la carpeta de datos predeterminada 
--- de la instancia de SQL Server:
---(216)
SELECT SERVERPROPERTY('InstanceDefaultDataPath') AS DefaultDataPath;

-- Obtener la ruta de la carpeta de registro predeterminada 
-- de la instancia de SQL Server:
---(217)
SELECT SERVERPROPERTY('InstanceDefaultLogPath') AS DefaultLogPath;

-- Obtener el nivel de compatibilidad de la base de datos 
-- AdventureWorks2016_EXT
/*
SQL Server 7.0: 70
SQL Server 2000: 80
SQL Server 2005: 90
SQL Server 2008: 100
SQL Server 2012: 110
SQL Server 2014: 120
SQL Server 2016: 130
SQL Server 2017: 140
SQL Server 2019: 150
*/
---(218) NO VA EN EL CURSO
USE AdventureWorks2016_EXT;
SELECT DATABASEPROPERTYEX(DB_NAME(), 'CompatibilityLevel') AS DatabaseCompatibilityLevel;
