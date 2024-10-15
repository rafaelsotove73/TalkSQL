--- ################################################
--- SE FUSIONO CON EL NRO 13
--- ################################################
--- ### COSULTA FULL DE INVOICE SALE HEAT/ DETAIL
--- ################################################
---(68)

USE AdventureWorks2016_EXT

 SELECT [EncSal].[SalesOrderNumber]
	  ,FORMAT([EncSal].[ShipDate], 'd', 'en-US' ) [SaleDate]  
	  ,ISNULL([Per].FirstName, 'CONSUMIDOR FINAL') [FirstName]
	  ,ISNULL([Per].LastName, 'S/LastName') [LastName]
	  ,[Terr].[Name] [NameTerritory]
	  ,[Terr].[Group] [GroupTerritory]
	  ,[ShipM].[Name] [descriptionShipMethod]
	  ,[Prod].[Name] [Description.Product]
	  ,[SaDet].[OrderQty]
	  ,[SaOf].[Description] [Description.SpecialOffer]
      ,[SaDet].[UnitPrice]
      ,[SaDet].[LineTotal]
      ,[EncSal].[SubTotal]
      ,[EncSal].[TaxAmt]
      ,[EncSal].[Freight]
      ,[EncSal].[TotalDue]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader] [EncSal]
  LEFT JOIN [Sales].[Customer] [Cust] ON [Cust].CustomerID = [EncSal].CustomerID
  LEFT JOIN [Person].[BusinessEntityContact] [PerBEC] ON [PerBEC].PersonID  = [Cust].PersonID
  LEFT JOIN [Person].[Person] [Per] ON [Per].BusinessEntityID  = [PerBEC].BusinessEntityID
  INNER JOIN [Sales].[SalesTerritory] [Terr] ON [Terr].[TerritoryID]  = [EncSal].[TerritoryID]
  INNER JOIN [Purchasing].[ShipMethod] [ShipM] ON [ShipM].[ShipMethodID] = [EncSal].[ShipMethodID]
  LEFT JOIN [Sales].[CreditCard] [CredC] ON [CredC].[CreditCardID] = [EncSal].[CreditCardID]
  INNER JOIN [Sales].[SalesOrderDetail] [SaDet] ON [SaDet].SalesOrderID = [EncSal].SalesOrderID 
  INNER JOIN [Sales].[SpecialOffer] [SaOf] ON [SaOf].SpecialOfferID  = [SaDet].[SpecialOfferID]
  INNER JOIN [Production].[Product] [Prod] ON [Prod].[ProductID] = [SaDet].[ProductID]
  ORDER BY [EncSal].[SalesOrderNumber] ASC;


--- #####################################################################
--- ### COSULTA FULL DE INVOICE SALE HEAT/ DETAIL X FACTURA  ESPECIFICA
--- #####################################################################
---(69)

USE AdventureWorks2016_EXT

SELECT [EncSal].[SalesOrderNumber]
	  ,FORMAT([EncSal].[ShipDate], 'd', 'en-US' ) [SaleDate]  
	  ,ISNULL([Per].FirstName, 'CONSUMIDOR FINAL') [FirstName]
	  ,ISNULL([Per].LastName, 'S/LastName') [LastName]
	  ,[Terr].[Name] [NameTerritory]
	  ,[Terr].[Group] [GroupTerritory]
	  ,[ShipM].[Name] [descriptionShipMethod]
	  ,[SalesOrderDetailID]
	  ,[Prod].[Name] [Description.Product]
	  ,[SaDet].[OrderQty]
	  ,[SaOf].[Description] [Description.SpecialOffer]
    ,[SaDet].[UnitPrice]
    ,[SaDet].[LineTotal]
    ,[EncSal].[SubTotal]
    ,[EncSal].[TaxAmt]
    ,[EncSal].[Freight]
    ,[EncSal].[TotalDue]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader] [EncSal]
  LEFT JOIN [Sales].[Customer] [Cust] ON [Cust].CustomerID = [EncSal].CustomerID
  LEFT JOIN [Person].[BusinessEntityContact] [PerBEC] ON [PerBEC].PersonID  = [Cust].PersonID
  LEFT JOIN [Person].[Person] [Per] ON [Per].BusinessEntityID  = [PerBEC].BusinessEntityID
  INNER JOIN [Sales].[SalesTerritory] [Terr] ON [Terr].[TerritoryID]  = [EncSal].[TerritoryID]
  INNER JOIN [Purchasing].[ShipMethod] [ShipM] ON [ShipM].[ShipMethodID] = [EncSal].[ShipMethodID]
  LEFT JOIN [Sales].[CreditCard] [CredC] ON [CredC].[CreditCardID] = [EncSal].[CreditCardID]
  INNER JOIN [Sales].[SalesOrderDetail] [SaDet] ON [SaDet].SalesOrderID = [EncSal].SalesOrderID 
  INNER JOIN [Sales].[SpecialOffer] [SaOf] ON [SaOf].SpecialOfferID  = [SaDet].[SpecialOfferID]
  INNER JOIN [Production].[Product] [Prod] ON [Prod].[ProductID] = [SaDet].[ProductID]
  WHERE [EncSal].[SalesOrderNumber] = 'SO43661'
