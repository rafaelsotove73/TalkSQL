/****** Script FIND  ******/

-- Crear un �ndice agrupado en la columna SalesOrderID
---CREATE CLUSTERED INDEX IX_SalesOrderDetailInMem_SalesOrderID ON SalesOrderDetailInMem (SalesOrderID);

-- Crear un �ndice no agrupado en la columna ProductID
--CREATE INDEX IX_SalesOrderDetailInMem_ProductID ON SalesOrderDetailInMem (ProductID);

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

--- ### ## ##########################################################################################
--- ### ##  SELECT BASE PARA EXTRACION DE DATOS SIMPLE
--- ### ## ##########################################################################################
---(138)

USE AdventureWorks2016_EXT

SELECT  
      [ProductID]
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
  FROM [AdventureWorks2016_EXT].[Production].[Product_inmem] WITH (SNAPSHOT);

  /*

  375	179.8156	404.99	NULL	NULL	G  	575.00	1	NULL	H 	NULL	8	101	2013-05-30 00:00:00.0000000	NULL	NULL	2014-02-08 10:01:36.8266667

  */


--- ### ## ##########################################################################################
--- ### ##  SELECT  CRUZADO CON UN INNER JOIN PARA TRABAJO NORMAL
--- ### ## ##########################################################################################
---(139)

SELECT 
    [PSpeed].[ProductNumber]
	  ,[PSpeed].[Name] [NameProduct]
	  ,[Loc].[Name] [LocName]
    ,[PInvt].[Shelf]
    ,[PInvt].[Bin]
    ,[PInvt].[Quantity]
  FROM [AdventureWorks2016_EXT].[Production].[ProductInventory] [PInvt]
  INNER JOIN [AdventureWorks2016_EXT].[Production].[Product_inmem] [PSpeed] WITH (SNAPSHOT) 
	ON [PSpeed].ProductID = [PSpeed].ProductID
  INNER JOIN [AdventureWorks2016_EXT].[Production].[Location] [Loc] ON [Loc].LocationID = [PInvt].[LocationID];


--- ### ##  ADICIONAS UN ORDER BY
--- ### ## GENERA UN ERROR CUANDO APLICAS EL "WITH (SNAPSHOT)" A UNA TABALA QUE NO ESTACREADA CON LOS
--- ### ## PARAMETROS PARA TABLA FISICA EN MEMORIA 
--- ### ## ##########################################################################################
---(140)

SELECT 
    [PSpeed].[ProductNumber]
	  ,[PSpeed].[Name] [NameProduct]
	  ,[Loc].[Name] [LocName]
    ,[PInvt].[Shelf]
    ,[PInvt].[Quantity]
  FROM [AdventureWorks2016_EXT].[Production].[ProductInventory] [PInvt] 
  INNER JOIN [AdventureWorks2016_EXT].[Production].[Product_inmem] [PSpeed] WITH (SNAPSHOT) 
	ON [PSpeed].ProductID = [PSpeed].ProductID
  INNER JOIN [AdventureWorks2016_EXT].[Production].[Location] [Loc]   ON [Loc].LocationID = [PInvt].[LocationID]
  ORDER BY [PSpeed].[ProductNumber]
		      ,[PInvt].[Shelf];


--- ### ## ##########################################################################################
--- ### ## ADICIONAS UN ORDER BY ---> CALCULOS MATEMATICOS / IIF
--- ### ## GENERA UN ERROR CUANDO APLICAS EL "WITH (SNAPSHOT)" A UNA TABALA QUE NO ESTA CREADA CON LOS
--- ### ## PARAMETROS PARA TABLA FISICA EN MEMORIA 
--- ### ## ##########################################################################################
---(141)


SELECT 
    [PSpeed].[ProductNumber]
	  ,[PSpeed].[Name] [NameProduct]
	  ,[ScPr].[Name] [NameSubClase] 
	  ,[Loc].[Name] [LocName]
    ,SUM([PInvt].[Quantity]) [Quantity]
	  ,IIF([PSpeed].[StandardCost]=0,23.9716,[PSpeed].[StandardCost]) [StandardCost]
	  ,(IIF([PSpeed].[StandardCost]=0,23.9716,[PSpeed].[StandardCost])) * SUM([PInvt].[Quantity]) [FullCost]
	  ,IIF([PSpeed].ListPrice=0,47.286,[PSpeed].ListPrice) [ListPrice]
	  ,(SUM([PInvt].[Quantity]))*(IIF([PSpeed].ListPrice=0,47.286,[PSpeed].ListPrice)) [FullListPrice]
	  ,(IIF([PSpeed].ListPrice=0,47.286,[PSpeed].ListPrice)) - (IIF([PSpeed].[StandardCost]=0,23.9716,[PSpeed].[StandardCost])) [Gross.margin]
	  ,(SUM([PInvt].[Quantity]))*(IIF([PSpeed].ListPrice=0,47.286,[PSpeed].ListPrice)) - (IIF([PSpeed].[StandardCost]=0,23.9716,[PSpeed].[StandardCost])) * SUM([PInvt].[Quantity]) [FullGross.margin]
	  ,(((IIF([PSpeed].ListPrice=0,47.286,[PSpeed].ListPrice)) - (IIF([PSpeed].[StandardCost]=0,23.9716,[PSpeed].[StandardCost]))/100)) [PrecentGross.margin]
	  ,ROUND((((IIF([PSpeed].ListPrice=0,47.286,[PSpeed].ListPrice)) - (IIF([PSpeed].[StandardCost]=0,23.9716,[PSpeed].[StandardCost]))/100)),4) [PrecentGross.marginRound]
	  ,CONVERT(DECIMAL(20,4),ROUND((((IIF([PSpeed].ListPrice=0,47.286,[PSpeed].ListPrice)) - (IIF([PSpeed].[StandardCost]=0,23.9716,[PSpeed].[StandardCost]))/100)),4)) [PrecentGross.marginRoundConver]
  FROM [AdventureWorks2016_EXT].[Production].[ProductInventory] [PInvt]
  INNER JOIN [AdventureWorks2016_EXT].[Production].[Product_inmem] [PSpeed] WITH (SNAPSHOT) 
	ON [PSpeed].ProductID = [PSpeed].ProductID
  INNER JOIN [AdventureWorks2016_EXT].[Production].[Location] [Loc] 
      ON [Loc].LocationID = [PInvt].[LocationID]
  INNER JOIN [AdventureWorks2016_EXT].[Production].[ProductSubcategory] [ScPr] 
      ON [ScPr].[ProductSubcategoryID] = [PSpeed].[ProductSubcategoryID]
  GROUP BY [PSpeed].[ProductNumber]
	  ,[PSpeed].[Name] 
	  ,[ScPr].[Name] 
	  ,[Loc].[Name] 
    ,[PInvt].[Shelf]
	  ,[PSpeed].[ListPrice]
	  ,[PSpeed].[StandardCost]
  ORDER BY [PSpeed].[ProductNumber]
	    	  ,[PInvt].[Shelf] 
