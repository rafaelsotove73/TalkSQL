--- ### ### #############################################################
--- ### ### SELECT PARA MAPEO DE TODAS LAS VISTAS EN UNA BASE DE DATOS  
--- ### ### ESPECIFICA ---> AdventureWorks2016_EXT <---
--- ### ### INCLUYE CODIGO QUE CONTIENE LA VISTA
--- ### ### #############################################################

-- (258)
USE AdventureWorks2016_EXT 

SELECT 
    TABLE_NAME [VIEW], 
    VIEW_DEFINITION [CODE]  ---> CODIGO DE LA VISTA
FROM INFORMATION_SCHEMA.VIEWS
ORDER BY TABLE_NAME;

-- (259)
SELECT * FROM INFORMATION_SCHEMA.VIEWS 
ORDER BY TABLE_NAME;

-- (260)
EXEC sp_helptext 'AdventureWorks2016_EXT.HumanResources.vEmployee' --- CODIGO COMPLETO POR LINEA

--- ### ### #############################################################
--- ### ### SELECT PARA MAPEO DE TODAS LOS SCEMAS EN UNA BASE DE DATOS  
--- ### ### ESPECIFICA ---> AdventureWorks2016_EXT <---
--- ### ### #############################################################

-- (261)
SELECT * FROM sys.schemas;

-- (262)
SELECT *  FROM sys.procedures;

-- (263)
SELECT 
[SC].name [SCHEMA]
,[SP].NAME [PROCEDURE STORE]
,[SP].type_desc
,[SP].create_date
FROM sys.procedures [SP]
INNER JOIN sys.schemas [SC] ON [SC].schema_id = [SP].schema_id ;

-- (264)
EXEC sp_helptext 'AdventureWorks2016_EXT.HumanResources.uspUpdateEmployeeHireInfo' --- CODIGO COMPLETO POR LINEA




