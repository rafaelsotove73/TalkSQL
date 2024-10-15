/****** Script for SelectTopNRows command from SSMS  ******/
/*
####################################################################################################
La cl�usula `WITH (SNAPSHOT)` en el c�digo que muestras se refiere a la opci�n `SNAPSHOT` 
de la tabla en memoria `Production.Product_inmem` en la base de datos `AdventureWorks2016_EXT`. 
Esta opci�n significa que la tabla en memoria tiene una instant�nea de los datos en el momento 
en que se cre� la tabla. Esto permite que los usuarios puedan ver una versi�n consistente de los
datos, incluso si hay cambios en los datos subyacentes en la base de datos.
Cuando una tabla en memoria se crea con la opci�n `SNAPSHOT`, se realiza una copia de los datos de
la tabla subyacente en ese momento, y la tabla en memoria refleja esa instant�nea de los datos. 
Si los datos subyacentes cambian posteriormente, la tabla en memoria no se actualiza autom�ticamente 
para reflejar esos cambios. 
En resumen, la cl�usula `WITH (SNAPSHOT)` garantiza que la tabla en memoria devolver� los mismos datos 
para todas las conexiones, independientemente de las actualizaciones realizadas en la tabla subyacente. 
Esto es �til en situaciones en las que se requiere una versi�n consistente de los datos para ciertas operaciones.
######################################################################################################

*/
SELECT  [ProductID]
      ,[Name]
      ,[ProductNumber]
      ,[MakeFlag]
      ,[FinishedGoodsFlag]
      ,[Color]
      ,[SafetyStockLevel]
      ,[ReorderPoint]
      ,[StandardCost]
      ,[ListPrice]
      ,[Size]
      ,[SizeUnitMeasureCode]
      ,[WeightUnitMeasureCode]
      ,[Weight]
      ,[DaysToManufacture]
      ,[ProductLine]
      ,[Class]
      ,[Style]
      ,[ProductSubcategoryID]
      ,[ProductModelID]
      ,[SellStartDate]
      ,[SellEndDate]
      ,[DiscontinuedDate]
      ,[ModifiedDate]
  FROM [AdventureWorks2016_EXT].[Production].[Product_inmem] WITH (SNAPSHOT)

