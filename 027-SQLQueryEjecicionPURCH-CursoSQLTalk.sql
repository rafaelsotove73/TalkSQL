
--- ## ### ###############################################
--- ## NRO DE ORDENES DE PRODUCCION 
--- ## POR ARTICULO Y SUMA DE UNIDADES
--- ## ### ###############################################
-----------------------
-- ORIGINAL BASE
-----------------------
---(163)

USE AdventureWorks2016_EXT

SELECT [WOProd].[WorkOrderID]
      ,[WOProd].[ProductID]
      ,[WOProd].[OrderQty]
      ,[WOProd].[StockedQty]
      ,[WOProd].[ScrappedQty]
      ,[WOProd].[StartDate]
      ,[WOProd].[EndDate]
      ,[WOProd].[DueDate]
      ,[WOProd].[ScrapReasonID]
      ,[WOProd].[ModifiedDate]
  FROM [AdventureWorks2016_EXT].[Production].[WorkOrder] [WOProd]
  INNER JOIN [Production].[Product] [Prod] ON [Prod].[ProductID] = [WOProd].[ProductID];

--- ## ### ################################################################
--- ## VERSION 1.0 VARIANTE  ===> NRO DE ORDENES DE PRODUCCION 
--- ## POR ARTICULO Y SUMA DE UNIDADES, CON FILTRO SOLO PRODUCTO CON ID = 3
--- ## ### ################################################################
---(164)

SELECT 
  [WOProd].[WorkOrderID]
  ,[WOProd].[ProductID]
  ,[Prod].[Name] [NameProduct]
  ,[WOProd].[OrderQty]
  ,[WOProd].[StockedQty]
  ,[WOProd].[ScrappedQty]
  ,[WOProd].[StartDate]
  ,[WOProd].[EndDate]
  ,[WOProd].[DueDate]
  ,[WOProd].[ScrapReasonID]
  ,[WOProd].[ModifiedDate]
FROM [AdventureWorks2016_EXT].[Production].[WorkOrder] [WOProd]
INNER JOIN (SELECT * FROM [Production].[Product]) [Prod] ON [Prod].[ProductID] = [WOProd].[ProductID]
WHERE [WOProd].[ProductID] = 3;

--- ## ### ################################################################
--- ## VERSION 1.1 VARIANTE  ===> SUMA ---NRO DE ORDENES DE PRODUCCION 
--- ## POR ARTICULO Y SUMA DE UNIDADES + COUNT
--- ## ### ################################################################
---(165)

SELECT 
  [WOProd].[ProductID]
  ,[Prod].[Name] [NameProduct]
  ,SUM([WOProd].[OrderQty]) [OrderQty]
  ,SUM([WOProd].[StockedQty]) [StockedQty]
  ,SUM([WOProd].[ScrappedQty]) [StockedQty]
  ,COUNT(*) [N.macthProduct]
FROM [AdventureWorks2016_EXT].[Production].[WorkOrder] [WOProd]
INNER JOIN (SELECT * FROM [Production].[Product]) [Prod] ON [Prod].[ProductID] = [WOProd].[ProductID]
GROUP BY 
  [WOProd].[ProductID]
  ,[Prod].[Name];

--- ## ### ################################################################
--- ## VERSION 1.2 VARIANTE  ===> SUMA ---NRO DE ORDENES DE PRODUCCION 
--- ## POR ARTICULO Y SUMA DE UNIDADES + DISTINC
--- ##  El recuento de los valores distintos de la columna "WorkOrderID" 
--- ## de la tabla "WorkOrder"
--- ## ### ################################################################
---(166)

SELECT 
[WOProd].[ProductID]
,[Prod].[Name] [NameProduct]
,SUM([WOProd].[OrderQty]) [OrderQty]
,SUM([WOProd].[StockedQty]) [StockedQty]
,SUM([WOProd].[ScrappedQty]) [StockedQty]
,COUNT(DISTINCT [WOProd].[WorkOrderID]) AS [N.macthOP]
FROM [AdventureWorks2016_EXT].[Production].[WorkOrder] [WOProd]
INNER JOIN (SELECT * FROM [Production].[Product]) [Prod] ON [Prod].[ProductID] = [WOProd].[ProductID]
GROUP BY 
[WOProd].[ProductID]
,[Prod].[Name];

--- ## ### ################################################################
--- ## VERSION 1.3 VARIANTE  ===> SUMA ---NRO DE ORDENES DE PRODUCCION 
--- ## POR ORDENERD DE FINALIZACION + COUNT
--- ## ### ################################################################
---(169)


SELECT 
 CONVERT(date,[WOProd].[EndDate],103) [EndDate]
,SUM([WOProd].[OrderQty]) [OrderQty]
,SUM([WOProd].[StockedQty]) [StockedQty]
,SUM([WOProd].[ScrappedQty]) [ScrappedQty]
,COUNT(*) [N.OrdSum]
FROM [AdventureWorks2016_EXT].[Production].[WorkOrder] [WOProd]
INNER JOIN (SELECT * FROM [Production].[Product]) [Prod] ON [Prod].[ProductID] = [WOProd].[ProductID]
GROUP BY [WOProd].[EndDate]


--- ## ### ################################################################
--- ##  SELEC DE OTRO SELECT SUB CONSULTA FILTRADA POR NOMBRE PRODUCTO
--- ## EXPRECION ALL
--- ## ### ################################################################
---(170)


SELECT Name, ListPrice
FROM [AdventureWorks2016_EXT].[Production].[Product]
WHERE ListPrice = ALL (
SELECT ListPrice
FROM [AdventureWorks2016_EXT].[Production].[Product]
WHERE Name = 'HL Road Frame - Black, 58');
