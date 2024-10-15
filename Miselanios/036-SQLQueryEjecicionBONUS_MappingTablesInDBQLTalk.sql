--- ### ### ############################################################
--- ### ###  PARA HACE BUSQUEDA DE NOMBRE DE TABLAS, COMBRE DE CAMPOS
--- ### ###  Y SUS PROPIEDADES 
--- ### ### ############################################################
-- (246)

USE AdventureWorks2016_EXT

SELECT TABLE_NAME, 
COLUMN_NAME FROM Information_Schema.Columns
WHERE TABLE_CATALOG = 'AdventureWorks2016_EXT' 
AND  COLUMN_NAME LIKE '%date%'  ; 

--------------------
-- (247)
SELECT * FROM Information_Schema.Columns
WHERE TABLE_CATALOG = 'AdventureWorks2016_EXT' 
AND  TABLE_NAME LIKE '%person%'  

--------------------
-- (248)
SELECT * FROM Information_Schema.Columns
WHERE TABLE_CATALOG = 'AdventureWorks2016_EXT' 
AND  TABLE_NAME LIKE '%person%'  and COLUMN_NAME = 'gender'; 




