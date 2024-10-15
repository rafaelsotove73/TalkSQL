
--- ### ## ##############################################################
--- ### ##  VISTA DE SELECT MULTIPLES
--- ### ## ##############################################################
---(147)


USE [AdventureWorks2016_EXT]

SELECT ProductID   
FROM Production.Product ;  
--Result: 504 Rows  


SELECT * FROM Production.Product ;  
--Result: 504 Rows  


SELECT * FROM Production.WorkOrder ;  
--Result: 591 Rows  


SELECT ProductID   
FROM Production.WorkOrder ;

--Result: 591 Rows


--- ### ## ##############################################################
--- ### ##  INSTERCEPCION DE DOS TABLAS
--- ### ## ##############################################################
---(148)

SELECT ProductID   
FROM Production.Product  
INTERSECT  
SELECT ProductID   
FROM Production.WorkOrder ;  
--Result: 238 Rows (products that have work orders)

--- ### ## ##############################################################
--- ### ##  EXCEPT DE DOS TABLAS
--- ### ## ##############################################################
---(149)

USE [AdventureWorks2016_EXT]
  
SELECT ProductID   
FROM Production.Product  
EXCEPT  
SELECT ProductID   
FROM Production.WorkOrder ;  
--Result: 266 Rows (products without work orders)


--- ### ## ##############################################################
--- ### ##  INTERSECT DE DOS TABLAS VARIANTE 1 (TIPO DE PRODUCTO QUE SE VENDE)
--- ### ## ##############################################################
---(150)

USE [AdventureWorks2016_EXT]

SELECT [PSpeed].ProductNumber
       ,[PSpeed].[Name] 
FROM [AdventureWorks2016_EXT].[Production].[Product_inmem] [PSpeed] WITH (SNAPSHOT) 
WHERE [PSpeed].ProductID IN ( SELECT ProductID  FROM [Production].[Product]
				INTERSECT  
			 SELECT ProductID  FROM [Production].[WorkOrder])  

--- ### ## ##############################################################
--- ### ##  INTERSECT DE DOS TABLAS VARIANTE 2 
--- ### ## ##############################################################
---(151)
SELECT [PSpeed].ProductNumber
       ,[PSpeed].[Name] 
FROM [AdventureWorks2016_EXT].[Production].[Product_inmem] [PSpeed] WITH (SNAPSHOT) 
WHERE EXISTS ( SELECT ProductID  FROM Production.Product  
				INTERSECT  
			 SELECT ProductID  FROM Production.WorkOrder WHERE ProductID = [PSpeed].ProductID)  

--Result: 238 Rows (products without work orders)
 --- ### ## ##############################################################
--- ### ##  INTERSECT DE DOS TABLAS VARIANTE 2 (TIPO DE PRODUCTO QUE NO SE VENDE)
--- ### ## ##############################################################
---(152)
USE [AdventureWorks2016_EXT]

SELECT [PSpeed].ProductNumber
       ,[PSpeed].[Name] 
FROM [AdventureWorks2016_EXT].[Production].[Product_inmem] [PSpeed] WITH (SNAPSHOT) 
WHERE [PSpeed].ProductID IN (SELECT ProductID FROM Production.Product  
									EXCEPT  
							SELECT ProductID FROM Production.WorkOrder) ;  
--Result: 266 Rows (products without work orders)
