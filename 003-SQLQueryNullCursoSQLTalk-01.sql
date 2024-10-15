
USE AdventureWorks2016_EXT

--- SELECT ORIGINAL
SELECT * FROM Sales.Customer;
---(28)
SELECT * FROM Sales.Customer WHERE StoreID is  null
---(29)
SELECT * FROM Sales.Customer WHERE NOT(StoreID is null)
---(30)
SELECT * FROM Sales.Customer WHERE StoreID is not null
--- SELECT ORIGINAL
---(31)
SELECT [CustomerID]
      ,[PersonID]
      ,[StoreID]
      ,[TerritoryID]
      ,[AccountNumber]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2016_EXT].[Sales].[Customer]
  WHERE StoreID is  null

  ---(32)

  SELECT [Cu].[CustomerID]
      ,[Cu].[PersonID]
      ,[Cu].[StoreID]
      ,[Cu].[TerritoryID]
      ,[Cu].[AccountNumber]
      ,[Cu].[rowguid]
      ,[Cu].[ModifiedDate]
  FROM [AdventureWorks2016_EXT].[Sales].[Customer][Cu]
  WHERE [Cu].StoreID is  null

---(33)
  SELECT [Cu].[CustomerID]
      ,[Cu].[PersonID]
      ,isnull([Cu].[StoreID],0) [StoreID]
      ,[Cu].[TerritoryID]
      ,[Cu].[AccountNumber]
      ,[Cu].[rowguid]
      ,[Cu].[ModifiedDate]
  FROM [AdventureWorks2016_EXT].[Sales].[Customer][Cu]
  WHERE [Cu].StoreID is  null

  ---(33)
  SELECT [Cu].[CustomerID]
      ,[Cu].[PersonID]
      ,isnull([Cu].[StoreID],0) [StoreID]
      ,[Cu].[TerritoryID]
      ,[Cu].[AccountNumber]
      ,[Cu].[rowguid]
      ,[Cu].[ModifiedDate]
  FROM [AdventureWorks2016_EXT].[Sales].[Customer][Cu]
  WHERE [Cu].StoreID is not null


