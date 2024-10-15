

--- ### PREGUNTA nro. 1 --*** BONUS

--- ###### ########################################################
--- ###### ## como buscar mediante codigo en una base de datos
--- ###### #######################################################

--- ### #########################################################
--- ### PRIMER SET DE QUERYS
--- ### #########################################################
---(15)
USE AdventureWorks2016_EXT

--- ### FOCALIZADO BUSQUEDA POR NOMBRE DE COLUMNA EN TODA LA BASE DE DATOS EN USO
---(16)
SELECT TABLE_NAME, COLUMN_NAME FROM Information_Schema.Columns
WHERE TABLE_CATALOG = 'AdventureWorks2016_EXT' 
AND  COLUMN_NAME LIKE '%CustomerID%' ; 

---  ###  FOCALIZADO BUSQUEDA POR NOMBRE DE COLUMNA EN TODA LA BASE DE DATOS EN USO, TODAS LAS COLUMNAS
---(17)
SELECT * FROM Information_Schema.Columns
WHERE TABLE_CATALOG = 'AdventureWorks2016_EXT' 
AND  COLUMN_NAME LIKE '%CustomerID%' ; 


---  ###  FOCALIZADO BUSQUEDA POR NOMBRE DE TABLA EN TODA LA BASE DE DATOS EN USO, TODAS LAS COLUMNAS
---(18)
SELECT *
FROM Information_Schema.Columns
WHERE TABLE_CATALOG = 'AdventureWorks2016_EXT' 
AND  TABLE_NAME = 'SalesOrderHeader' ; 

---  ###  FOCALIZADO BUSQUEDA POR NOMBRE DE LA BASE DE DATOS EN USO, ORDENADO POR  SCHEMA, TABLA Y COLUMNA ASENDENTE POR DEFECTO
---(19)
SELECT *
FROM Information_Schema.Columns
WHERE TABLE_CATALOG = 'AdventureWorks2016_EXT' 
ORDER BY TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME;  
-- ## CAMBIO DE BASE DE DATO EN DOS QUERY IGUALES CON DISTINTOS RESULTADOS
---(20)
USE AdventureWorks2016_EXT

SELECT *
FROM Information_Schema.Columns
ORDER BY  TABLE_CATALOG,TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME; 

USE AdventureWorks2019

SELECT *
FROM Information_Schema.Columns
ORDER BY  TABLE_CATALOG,TABLE_SCHEMA, TABLE_NAME, ORDINAL_POSITION;  

SELECT 
  TABLE_CATALOG
  ,TABLE_SCHEMA
  ,TABLE_NAME
  ,ORDINAL_POSITION
  ,COLUMN_DEFAULT
  ,DATA_TYPE 
FROM Information_Schema.Columns
ORDER BY  TABLE_CATALOG,
          TABLE_SCHEMA, 
          TABLE_NAME, 
          ORDINAL_POSITION;


--- ### ########################################################################
--- ###  EJERCICIO  ADICIONAL PARA BUSQUEDA DE LA CADENA "PERSONID" CON EL
--- ###  PARA COINCIDENCIA EN EL NOMBRE DEL CAMPO POR MEDIO DEL LIKE 
--- ###  ,ES DECIR TODO CAMPO QUE CONTEGA DICHA CADENA EN EL MEDIO
--- ### #######################################################################
---(21)

USE AdventureWorks2016_EXT --> coincidencia exacta

SELECT * FROM Information_Schema.Columns
WHERE TABLE_CATALOG = 'AdventureWorks2016_EXT' 
AND  COLUMN_NAME LIKE 'PersonID' ; 


---(22)
USE AdventureWorks2016_EXT --> Coincidencia con comodin de un solo caracter

SELECT * FROM Information_Schema.Columns
WHERE TABLE_CATALOG = 'AdventureWorks2016_EXT' 
AND  COLUMN_NAME LIKE 'PersonI_' ; 


--- ### ########################################################################
--- ###  EJERCICIO  ADICIONAL PARA BUSQUEDA DE LA CADENA "PERSONID" CON EL
--- ###  PARA COINCIDENCIA EN EL NOMBRE DEL CAMPO POR MEDIO DEL LIKE 
--- ### ,ES DECIR TODO CAMPO QUE CONTEGA DICHA CADENA AL FINAL
--- ### #######################################################################
---(23)
USE AdventureWorks2016_EXT --->Coincidencia con comodin multiples caracteres Izquierda 

SELECT * FROM Information_Schema.Columns
WHERE TABLE_CATALOG = 'AdventureWorks2016_EXT' 
AND  COLUMN_NAME LIKE '%PersonID' ; 

--- ### ########################################################################
--- ###  EJERCICIO  ADICIONAL PARA BUSQUEDA DE LA CADENA "PERSONID"  CON EL
--- ### PARA COUNCIDENCIA POR MEDIO DEL LIKE, ES DECIR TODO CAMPO 
--- ### QUE CONTEGA DICHA CADENA AL PRINCIPIO
--- ### #######################################################################
---(24)

USE AdventureWorks2016_EXT --->Coincidencia con comodin multiples caracteres derecha

SELECT * FROM Information_Schema.Columns
WHERE TABLE_CATALOG = 'AdventureWorks2016_EXT' 
AND  COLUMN_NAME LIKE 'PersonID%' ; 

---(25)
USE AdventureWorks2016_EXT --->Coincidencia con comodin multiples caracteres Izquierda y derecha

SELECT * FROM Information_Schema.Columns
WHERE TABLE_CATALOG = 'AdventureWorks2016_EXT' 
AND  COLUMN_NAME LIKE '%PersonID%' ; 

---(26)
USE AdventureWorks2016_EXT --->Coincidencia con comodin lista caracteres 

SELECT * FROM Information_Schema.Columns
WHERE TABLE_CATALOG = 'AdventureWorks2016_EXT' 
AND  COLUMN_NAME LIKE '[xD]%' ; 

---(27)
USE AdventureWorks2016_EXT --->Coincidencia con comodin rango carateres 

SELECT * FROM Information_Schema.Columns
WHERE TABLE_CATALOG = 'AdventureWorks2016_EXT' 
AND  COLUMN_NAME LIKE '[C-D]%' ; 

USE AdventureWorks2016_EXT

--- ### ### ###################################################################
--- ### ### CREA SCHEMMA DE UNA BASE DE DATOS EL SCHEMA POR DEFECTO ES DBO.
--- ### ### ESTOP ES IMPORTANTE PARA PODER ORGANIXAR LA BASE DE DATOS
--- ### ### ###################################################################

--- CREATE SCHEMA [report]
