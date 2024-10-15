--- #########################################################################
--- ### CONSULTA DE CADA FACTURA CON LAS TABLA DE ENCABEZADO Y DETALLE
--- ########################################################################

  --- ### ################################################################
  --- ### CONSULTA DE DATOS DE ENCABEZADO DE FACTURA
  --- ###  DATOS FACTURA + CLIENTE
  --- ### ################################################################
  ---(74)
  
  SELECT [EncSal].[SalesOrderID]
      ,[EncSal].[SalesOrderNumber]
	  ,FORMAT([EncSal].[ShipDate], 'd', 'en-US' ) [SaleDate]  
	  ,[EncSal].[CustomerID]
	  ,[Per].FirstName 
	  ,[Per].LastName
	  ,[Cust].PersonID 
	  ,[EncSal].[AccountNumber]    
      ,[EncSal].[SalesPersonID]
      ,[EncSal].[TerritoryID]
      ,[EncSal].[BillToAddressID]
      ,[EncSal].[ShipToAddressID]
      ,[EncSal].[ShipMethodID]
      ,[EncSal].[CreditCardID]
      ,[EncSal].[CreditCardApprovalCode]
      ,[EncSal].[SubTotal]
      ,[EncSal].[TaxAmt]
      ,[EncSal].[Freight]
      ,[EncSal].[TotalDue]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader] [EncSal]
  LEFT JOIN [Sales].[Customer] [Cust] ON [Cust].CustomerID = [EncSal].CustomerID
  LEFT JOIN [Person].[BusinessEntityContact] [PerBEC] ON [PerBEC].PersonID  = [Cust].PersonID
  LEFT JOIN [Person].[Person] [Per] ON [Per].BusinessEntityID  = [PerBEC].BusinessEntityID 

  --- ### ################################################################
  --- ### CONSULTA DE DATOS DE ENCABEZADO DE FACTURA
  --- ###  DATOS FACTURA + CLIENTE + TERRITORIO
  --- ### ################################################################
  ---(75)

  SELECT [EncSal].[SalesOrderID]
      ,[EncSal].[SalesOrderNumber]
	  ,FORMAT([EncSal].[ShipDate], 'd', 'en-US' ) [SaleDate]  
	  ,ISNULL([Per].FirstName, 'CONSUMIDOR FINAL') [FirstName]
	  ,ISNULL([Per].LastName, 'S/LastName') [LastName]
	  ,[EncSal].[AccountNumber]    
      ,[EncSal].[TerritoryID]
	  ,[Terr].[Name] [NameTerritory]
	  ,[Terr].[Group] [GroupTerritory]
      ,[EncSal].[BillToAddressID]
      ,[EncSal].[ShipToAddressID]
      ,[EncSal].[ShipMethodID]
      ,[EncSal].[CreditCardID]
      ,[EncSal].[CreditCardApprovalCode]
      ,[EncSal].[SubTotal]
      ,[EncSal].[TaxAmt]
      ,[EncSal].[Freight]
      ,[EncSal].[TotalDue]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader] [EncSal]
  LEFT JOIN [Sales].[Customer] [Cust] ON [Cust].CustomerID = [EncSal].CustomerID
  LEFT JOIN [Person].[BusinessEntityContact] [PerBEC] ON [PerBEC].PersonID  = [Cust].PersonID
  LEFT JOIN [Person].[Person] [Per] ON [Per].BusinessEntityID  = [PerBEC].BusinessEntityID
  INNER JOIN [Sales].[SalesTerritory] [Terr] ON [Terr].[TerritoryID]  = [EncSal].[TerritoryID]

  --- ### ################################################################
  --- ### CONSULTA DE DATOS DE ENCABEZADO DE FACTURA
  --- ###  DATOS FACTURA + CLIENTE + TERRITORIO + METODO DE PAGO + 
  --- ### DATOS TARJETA DE CREDITO
  --- ### ################################################################
  ---(76)

  SELECT [EncSal].[SalesOrderID]
      ,[EncSal].[SalesOrderNumber]
	  ,FORMAT([EncSal].[ShipDate], 'd', 'en-US' ) [SaleDate]  
	  ,ISNULL([Per].FirstName, 'CONSUMIDOR FINAL') [FirstName]
	  ,ISNULL([Per].LastName, 'S/LastName') [LastName]
	  ,[EncSal].[AccountNumber]    
      ,[EncSal].[TerritoryID]
	  ,[Terr].[Name] [NameTerritory]
	  ,[Terr].[Group] [GroupTerritory]
      ,[EncSal].[ShipMethodID]
	  ,[ShipM].[Name] [descriptionShipMethod]
      ,[EncSal].[CreditCardID]
      ,[EncSal].[CreditCardApprovalCode]
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

  --- ### ################################################################
  --- ### CONSULTA DE DATOS DE ENCABEZADO DE FACTURA
  --- ###  DATOS FACTURA + CLIENTE + TERRITORIO + METODO DE PAGO + 
  --- ### DATOS TARJETA DE CREDITO OBIOLOS ID
  --- ### ################################################################
  ---(77)

  SELECT [EncSal].[SalesOrderID]
      ,[EncSal].[SalesOrderNumber]
	  ,FORMAT([EncSal].[ShipDate], 'd', 'en-US' ) [SaleDate]  
	  ,ISNULL([Per].FirstName, 'CONSUMIDOR FINAL') [FirstName]
	  ,ISNULL([Per].LastName, 'S/LastName') [LastName]
	  ,[EncSal].[AccountNumber]    
	  ,[Terr].[Name] [NameTerritory]
	  ,[Terr].[Group] [GroupTerritory]
	  ,[ShipM].[Name] [descriptionShipMethod]
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
   
  --- ### ################################################################
  --- ### CONSULTA DE DATOS DE ENCABEZADO DE FACTURA
  --- ###  DATOS FACTURA + CLIENTE + TERRITORIO + METODO DE PAGO + 
  --- ### DATOS TARJETA DE CREDITO PREPANDO TODO PARA COLOCAR EL DETALLE 
  --- ### DE LA FACTURA
  --- ### ################################################################
  ---(78)

  SELECT [EncSal].[SalesOrderNumber]
	  ,FORMAT([EncSal].[ShipDate], 'd', 'en-US' ) [SaleDate]  
	  ,ISNULL([Per].FirstName, 'CONSUMIDOR FINAL') [FirstName]
	  ,ISNULL([Per].LastName, 'S/LastName') [LastName]
	  ,[Terr].[Name] [NameTerritory]
	  ,[Terr].[Group] [GroupTerritory]
	  ,[ShipM].[Name] [descriptionShipMethod]
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

--- ################################################
--- ### COSULTA FULL DE INVOICE SALE HEAT/ DETAIL
--- ################################################
---(79)

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
---(80)

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
