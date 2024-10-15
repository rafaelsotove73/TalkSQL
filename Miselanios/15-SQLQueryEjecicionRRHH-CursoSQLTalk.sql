--- ### #############################################################
--- ###  DETAIL VERSION 1
--- ### #############################################################

SELECT [SaDet].[SalesOrderID]
      ,[SalesOrderDetailID]
      ,[SaDet].[CarrierTrackingNumber]
	  ,[SaDet].[ProductID]
	  ,[Prod].[Name] [Description.Product]
      ,[SaDet].[OrderQty]
      ,[SaDet].[SpecialOfferID]
	  ,[SaOf].[Description] [Description.SpecialOffer]
      ,[SaDet].[UnitPrice]
      ,[SaDet].[LineTotal]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderDetail] [SaDet]
  INNER JOIN [Sales].[SpecialOffer] [SaOf] ON [SaOf].SpecialOfferID  = [SaDet].[SpecialOfferID]
  INNER JOIN [Production].[Product] [Prod] ON [Prod].[ProductID] = [SaDet].[ProductID]

--- ### #############################################################
--- ###  DETAIL VERSION 2
--- ### #############################################################

  SELECT [SaDet].[SalesOrderID]
      ,[SalesOrderDetailID]
	  ,[SaDet].[ProductID]
	  ,[Prod].[Name] [Description.Product]
      ,[SaDet].[OrderQty]
      ,[SaDet].[SpecialOfferID]
	  ,[SaOf].[Description] [Description.SpecialOffer]
      ,[SaDet].[UnitPrice]
      ,[SaDet].[LineTotal]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderDetail] [SaDet]
  INNER JOIN [Sales].[SpecialOffer] [SaOf] ON [SaOf].SpecialOfferID  = [SaDet].[SpecialOfferID]
  INNER JOIN [Production].[Product] [Prod] ON [Prod].[ProductID] = [SaDet].[ProductID]


--- ### #############################################################
--- ###  DETAIL VERSION 3 RESUMEN
--- ### #############################################################

  SELECT [SaDet].[SalesOrderID]
      ,[SalesOrderDetailID]
	  ,[Prod].[Name] [Description.Product]
      ,[SaDet].[OrderQty]
	  ,[SaOf].[Description] [Description.SpecialOffer]
      ,[SaDet].[UnitPrice]
      ,[SaDet].[LineTotal]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderDetail] [SaDet]
  INNER JOIN [Sales].[SpecialOffer] [SaOf] ON [SaOf].SpecialOfferID  = [SaDet].[SpecialOfferID]
  INNER JOIN [Production].[Product] [Prod] ON [Prod].[ProductID] = [SaDet].[ProductID]


--- ### #############################################################
--- ###  HEAT / DETAIL VERSION 1
--- ### #############################################################

  SELECT [SaDet].[SalesOrderID]
      ,[SalesOrderDetailID]
	  ,[Prod].[Name] [Description.Product]
      ,[SaDet].[OrderQty]
	  ,[SaOf].[Description] [Description.SpecialOffer]
      ,[SaDet].[UnitPrice]
      ,[SaDet].[LineTotal]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderDetail] [SaDet]
  INNER JOIN [Sales].[SpecialOffer] [SaOf] ON [SaOf].SpecialOfferID  = [SaDet].[SpecialOfferID]
  INNER JOIN [Production].[Product] [Prod] ON [Prod].[ProductID] = [SaDet].[ProductID]