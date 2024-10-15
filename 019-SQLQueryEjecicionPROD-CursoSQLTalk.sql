--- ### ##############################################################################
--- ### ##  SELECT DE PRODUCCION QUE GENERA LOS DIAS DE SALIDA DE PLANTA   
--- ### ##############################################################################

--- ### ##############################################################################
--- ### ##  SELECT BASE PARA LOS DEMAS SELECT
--- ### ##############################################################################
---(118)

  USE AdventureWorks2016_EXT;
   
  SELECT 
       [TraProd].[TransactionID]
      ,[TraProd].[ProductID]
	   ,[ProBase].[ProductNumber]
	   ,[ProBase].[Name] 
	   ,[ProBase].[Color]
      ,[TraProd].[ReferenceOrderID]
      ,[TraProd].[ReferenceOrderLineID]
      ,[TraProd].[TransactionDate]
      ,[TraProd].[Quantity]
      ,[TraProd].[ActualCost]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID 
  ORDER BY [TraProd].[TransactionDate]

--- ### ##############################################################################
--- ### ##  SUMATORIA (cantidad y costo actual) DE PRODUCTOS POR DIA  
--- ### ##############################################################################
---(119)

  SELECT 
       CONVERT(VARCHAR(10),[TraProd].[TransactionDate],103) [TransactionDate]
      ,SUM([TraProd].[Quantity]) [Quantity]
      ,SUM([TraProd].[ActualCost])[ActualCost] 
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  GROUP BY [TraProd].[TransactionDate]
  ORDER BY [TraProd].[TransactionDate]


--- ### ##############################################################################
--- ### ##  CUANTO TIEMPO  EN DIAS SE TARDO SE TARDA EN SACAR LA PRODUCCION
--- ### ##  EL SIGUIENTE EJERCIO COMPARA LA FECHA DE SALIDA DE LA ANTERIOR PRODUCCION
--- ### ## CON EL DE LA ACTUAL, HACE UNA RESTA DE FECHAS Y GENERA LOS DIAS QUE TARDO
--- ### ## EN SALIR LA PRODUCCION --- SUMA DE TOTALES
--- ### ##############################################################################
---(120)

SELECT 
   CONVERT(VARCHAR(10),[TraProd].[TransactionDate],103) [TransactionDate]
  ,SUM([TraProd].[Quantity]) [Quantity]
  ,SUM([TraProd].[ActualCost])[ActualCost] 
  ,DATEDIFF(day, LAG([TraProd].[TransactionDate]) 
  OVER (ORDER BY [TraProd].[TransactionDate]), [TraProd].[TransactionDate]) AS [DaysBetweenTransactions]
FROM [Production].[TransactionHistoryArchive] [TraProd]
GROUP BY [TraProd].[TransactionDate]
ORDER BY [TraProd].[TransactionDate]

--- ### ##############################################################################
--- ### ##  CUANTO TIEMPO SE TARDO SE TARDA EN SACAR LA PRODUCCION
--- ### ##  EL SIGUIENTE EJERCIO COMPARA LA FECHA DE SALIDA DE LA ANTERIOR PRODUCCION
--- ### ## CON EL DE LA ACTUAL, HACE UNA RESTA DE FECHAS Y GENERA LOS DIAS QUE TARDO
--- ### ## EN SALIR LA PRODUCCION --- DETALLADO POR ARTICULO CANTIDAD Y COSTO
--- ### ##############################################################################
--- ### ## La cláusula GROUPING SETS es una extensión de la cláusula GROUP BY y se utiliza para 
--- ### ## agrupar datos por múltiples conjuntos de columnas. Con GROUPING SETS, podemos especificar 
--- ### ## varios conjuntos de columnas para agrupar y obtener resúmenes de datos para cada conjunto.
--- ### ##############################################################################
---(121)

SELECT 
   CONVERT(VARCHAR(10), [TraProd].[TransactionDate], 103) [TransactionDate],
   [Product].[Name],
   [Product].[ProductNumber],
   SUM([TraProd].[Quantity]) [Quantity],
   SUM([TraProd].[ActualCost]) [ActualCost],
   DATEDIFF(day, LAG([TraProd].[TransactionDate]) 
   OVER (ORDER BY [TraProd].[TransactionDate]), [TraProd].[TransactionDate]) AS [DaysBetweenTransactions]
FROM [Production].[TransactionHistoryArchive] [TraProd]
JOIN [Production].[Product] [Product] ON [TraProd].[ProductID] = [Product].[ProductID]
GROUP BY 
   GROUPING SETS(([TraProd].[TransactionDate], [Product].[Name], [Product].[ProductNumber]), 
   ([TraProd].[TransactionDate]))
ORDER BY [TraProd].[TransactionDate]

--- ### ##################################################################################
--- ### ## VARIANTE 02, SE AGREGO EL CAMPO COLOR Y UN ISNULL PARA REEMPLAZAR 
--- ### ## NULL POR "WHITE"
--- ### #################################################################################
---(122)

SELECT 
   CONVERT(VARCHAR(10), [TraProd].[TransactionDate], 103) [TransactionDate],
   [Product].[ProductNumber],
   [Product].[Name],
   ISNULL([Product].[Color],'White') [Color],
   SUM([TraProd].[Quantity]) [Quantity],
   SUM([TraProd].[ActualCost]) [ActualCost],
   DATEDIFF(day, LAG([TraProd].[TransactionDate]) OVER (ORDER BY [TraProd].[TransactionDate]), [TraProd].[TransactionDate]) AS [DaysBetweenTransactions]
FROM [Production].[TransactionHistoryArchive] [TraProd]
JOIN (SELECT [ProductID], [ProductNumber], [Name], [Color]
   FROM [Production].[Product]) [Product] ON [TraProd].[ProductID] = [Product].[ProductID]
GROUP BY CONVERT(VARCHAR(10), [TraProd].[TransactionDate], 103), 
	[Product].[ProductNumber], 
	[Product].[Name], 
	[Product].[Color],
	[TraProd].[TransactionDate]
ORDER BY [TraProd].[TransactionDate]
