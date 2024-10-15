--- ### ### ###################################################################
--- ### ### SELECT PARA MAPEO DE TRIGGERS DE UNA BASE DE DATOS 
--- ### ### EN ESPECIFICO
--- ### ### ###################################################################

-----------------------------------
--- Variante 1 select de triggers
-----------------------------------
-- (269)
SELECT 
[Tr].name [trigger_name]
,OBJECT_NAME([Tr].parent_id) AS table_name 
FROM sys.triggers [Tr];

-----------------------------------
--- Variante 2 select de triggers
--- Informacion Completa
-----------------------------------
-- (270)

SELECT 
[Tr].name [trigger_name]
,OBJECT_NAME([Tr].parent_id) [table_name]  
,CASE [Tr].is_disabled 
    WHEN 0 THEN 'Activo' 
    ELSE 'Inactivo' 
    END AS status
FROM sys.triggers [Tr]
ORDER BY table_name, trigger_name

--- dEmployee.Employee
-- (271)
EXEC sp_helptext 'Person.iuPerson'  ---> codigo del triggers

----------------------------------
----------------------------------
--- ### ### ###################################################################
--- ### ### SELECT PARA MAPEO DE FUNCTIONS DE UNA BASE DE DATOS EN ESPECIFICO
--- ### ### ###################################################################

-- Select Base
-- (272)

SELECT *
FROM sys.objects
WHERE 
type_desc = 'SQL_INLINE_TABLE_VALUED_FUNCTION' OR 
type_desc = 'SQL_SCALAR_FUNCTION' OR 
type_desc = 'SQL_TABLE_VALUED_FUNCTION'
ORDER BY name;

-----------------------------------
--- Variante 1 select de Funcion
--- Informacion Completa
-----------------------------------
-- (273)

SELECT 
[SC].name [SCHEMA]
,[Obj].[name] [FUNCION]
FROM sys.objects [Obj]
INNER JOIN sys.schemas [SC] ON [SC].schema_id = [Obj].schema_id
WHERE 
[Obj].type_desc = 'SQL_INLINE_TABLE_VALUED_FUNCTION' OR 
[Obj].type_desc = 'SQL_SCALAR_FUNCTION' OR 
[Obj].type_desc = 'SQL_TABLE_VALUED_FUNCTION'
ORDER BY [Obj].name;
---dbo.f_promedio

EXEC sp_helptext 'AdventureWorks2016_EXT.dbo.f_promedio' --- CODIGO COMPLETO POR LINEA


