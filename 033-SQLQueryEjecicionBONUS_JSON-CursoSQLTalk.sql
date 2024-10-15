
--- ## ### ############################################################
--- ## ###  TEST JSON QUERY AdventureWorks2016_EXT DATA BASE  
--- ## ###  JSON_VALUE
--- ## ### ############################################################


USE AdventureWorks2016_EXT
 
 -------------------
 -------------------
 ---(223)
SELECT *
FROM [Sales].[SalesOrder_json]
WHERE SalesOrderID = '43659'

---------------------
---------------------
---(224)

SELECT [SalesOrderID]
      ,[RevisionNumber]
      ,[OrderDate]
      ,[DueDate]
      ,[ShipDate]
      ,[Status]
      ,[OnlineOrderFlag]
      ,[SalesOrderNumber]
      ,[PurchaseOrderNumber]
      ,[AccountNumber]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[TerritoryID]
      ,[BillToAddressID]
      ,[ShipToAddressID]
      ,[ShipMethodID]
      ,[CreditCardID]
      ,[CreditCardApprovalCode]
      ,[CurrencyRateID]
      ,[SubTotal]
      ,[TaxAmt]
      ,[Freight]
      ,[TotalDue]
      ,[Comment]
      ,[rowguid]
      ,[ModifiedDate]
      ,[SalesReasons]
      ,[OrderItems]
      ,[Info]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrder_json]
  WHERE SalesOrderID = '43659'

 

---------------------------------
-- cometatar campo innecesarios
--------------------------------
---(225)


SELECT [SalesOrderID]
      ,[RevisionNumber]
      ,[OrderDate]
      ---,[DueDate]
      ---,[ShipDate]
      ,[Status]
      ,[OnlineOrderFlag]
      ,[SalesOrderNumber]
      ,[PurchaseOrderNumber]
      ,[AccountNumber]
      ---,[CustomerID]
      ---,[SalesPersonID]
      ---,[TerritoryID]
      ---,[BillToAddressID]
      ---,[ShipToAddressID]
      ---,[ShipMethodID]
      ---,[CreditCardID]
      ---,[CreditCardApprovalCode]
      ---,[CurrencyRateID]
      ,[SubTotal]
      ,[TaxAmt]
      ,[Freight]
      ,[TotalDue]
      ---,[Comment]
     --- ,[rowguid]
      --,[ModifiedDate]
      ,[SalesReasons]
      ,[OrderItems]
      ,[Info]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrder_json]
  WHERE SalesOrderID = '43659'

----------------------------
-- contenido de campo json
-- Analisis -- fiel (info)
---------------------------
 /*
  "ShippingInfo": {
        "Address": "42525 Austell Road",
        "City": "Austell",
        "PostalCode": "30106",
        "Province": "Georgia",
        "TerritoryID": 5,
        "Method": "CARGO TRANSPORT 5",
        "ShipBase": 8.99,
        "ShipRate": 1.49
    },
    "BillingInfo": {
        "Address": "42525 Austell Road",
        "City": "Austell",
        "PostalCode": "30106"
    },
    "SalesPerson": {
        "Name": "Tsvi Reiter",
        "ID": 279
    }

*/
-------------------------------------
--- despliege de json de campo info
--- en columnas individuales
-------------------------------------
---(226)

SELECT [SOr_j].[SalesOrderID]
      ,[SOr_j].[RevisionNumber]
      ,[SOr_j].[OrderDate]
      ,[SOr_j].[Status]
      ,[SOr_j].[OnlineOrderFlag]
      ,[SOr_j].[SalesOrderNumber]
      ,[SOr_j].[PurchaseOrderNumber]
      ,[SOr_j].[AccountNumber]
      ,[SOr_j].[SubTotal]
      ,[SOr_j].[TaxAmt]
      ,[SOr_j].[Freight]
      ,[SOr_j].[TotalDue]
      ,[SOr_j].[SalesReasons]
      ,[SOr_j].[OrderItems]
      ,[SOr_j].[Info]
      ,JSON_VALUE([SOr_j].Info,'$.SalesPerson.Name') [SalesPerson] 
      ,JSON_VALUE([SOr_j].Info,'$.SalesPerson.ID') [ID_Person] 
      ,JSON_VALUE([SOr_j].Info,'$.BillingInfo.Address') [Address] 
      ,JSON_VALUE([SOr_j].Info,'$.BillingInfo.PostalCode') [PostalCode] 
      ,JSON_VALUE([SOr_j].Info,'$.ShippingInfo.Province') [Province] 
      ,JSON_VALUE([SOr_j].Info,'$.ShippingInfo.ShipBase') [ShipBase] 
      ,JSON_VALUE([SOr_j].Info,'$.ShippingInfo.ShipRate') [ShipRate] 
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrder_json] [SOr_j]
  WHERE [SOr_j].[SalesOrderID] = '43659'



---------------------------------
-- quitamos los campos json full
--------------------------------
---(227)


SELECT [SOr_j].[SalesOrderID]
      ,[SOr_j].[RevisionNumber]
      ,[SOr_j].[OrderDate]
      ,[SOr_j].[Status]
      ,[SOr_j].[OnlineOrderFlag]
      ,[SOr_j].[SalesOrderNumber]
      ,[SOr_j].[PurchaseOrderNumber]
      ,[SOr_j].[AccountNumber]
      ,[SOr_j].[SubTotal]
      ,[SOr_j].[TaxAmt]
      ,[SOr_j].[Freight]
      ,[SOr_j].[TotalDue]
      ,[SOr_j].[SalesReasons]
      ---,[SOr_j].[OrderItems]
      ---,[SOr_j].[Info]
      ,JSON_VALUE([SOr_j].Info,'$.SalesPerson.Name') [SalesPerson] 
      ,JSON_VALUE([SOr_j].Info,'$.SalesPerson.ID') [ID_Person] 
      ,JSON_VALUE([SOr_j].Info,'$.BillingInfo.Address') [Address] 
      ,JSON_VALUE([SOr_j].Info,'$.BillingInfo.PostalCode') [PostalCode] 
      ,JSON_VALUE([SOr_j].Info,'$.ShippingInfo.Province') [Province] 
      ,JSON_VALUE([SOr_j].Info,'$.ShippingInfo.ShipBase') [ShipBase] 
      ,JSON_VALUE([SOr_j].Info,'$.ShippingInfo.ShipRate') [ShipRate] 
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrder_json] [SOr_j]
  WHERE [SOr_j].[SalesOrderID] = '43659'

----------------------------------
--- dificil pero no imposible
--- despliege del otro campo
--- [SOr_j].[OrderItems]
----------------------------

---(228)
DECLARE @JSON NVARCHAR(MAX) = (SELECT [SOr_j].[OrderItems]      
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrder_json] [SOr_j]
  WHERE [SOr_j].[SalesOrderID] = '43659')

  SELECT JSON_VALUE(value, '$.CarrierTrackingNumber') AS CarrierTrackingNumber,
       JSON_VALUE(value, '$.Item.Qty') AS Qty,
       JSON_VALUE(value, '$.Item.Price') AS Price,
       JSON_VALUE(value, '$.Item.Discount') AS Discount,
       JSON_VALUE(value, '$.Item.Total') AS Total,
       JSON_VALUE(value, '$.Product.Number') AS ProductNumber,
       JSON_VALUE(value, '$.Product.Name') AS ProductName
FROM OPENJSON(@json);

---(229)
SELECT [SOr_j].[SalesOrderID]
      ,[SOr_j].[RevisionNumber]
      ,[SOr_j].[OrderDate]
      ,[SOr_j].[Status]
      ,[SOr_j].[OnlineOrderFlag]
      ,[SOr_j].[SalesOrderNumber]
      ,[SOr_j].[PurchaseOrderNumber]
      ,[SOr_j].[AccountNumber]
      ,[SOr_j].[SubTotal]
      ,[SOr_j].[TaxAmt]
      ,[SOr_j].[Freight]
      ,[SOr_j].[TotalDue]
      ,[SOr_j].[SalesReasons]
      ,JSON_VALUE([SOr_j].Info,'$.SalesPerson.Name') [SalesPerson] 
      ,JSON_VALUE([SOr_j].Info,'$.SalesPerson.ID') [ID_Person] 
      ,JSON_VALUE([SOr_j].Info,'$.BillingInfo.Address') [Address] 
      ,JSON_VALUE([SOr_j].Info,'$.BillingInfo.PostalCode') [PostalCode] 
      ,JSON_VALUE([SOr_j].Info,'$.ShippingInfo.Province') [Province] 
      ,JSON_VALUE([SOr_j].Info,'$.ShippingInfo.ShipBase') [ShipBase] 
      ,JSON_VALUE([SOr_j].Info,'$.ShippingInfo.ShipRate') [ShipRate] 
      ,JSON_VALUE(value, '$.CarrierTrackingNumber') AS CarrierTrackingNumber
      ,JSON_VALUE(value, '$.Item.Qty') AS Qty
      ,JSON_VALUE(value, '$.Item.Price') AS Price
      ,JSON_VALUE(value, '$.Item.Discount') AS Discount
      ,JSON_VALUE(value, '$.Item.Total') AS Total
      ,JSON_VALUE(value, '$.Product.Number') AS ProductNumber
      ,JSON_VALUE(value, '$.Product.Name') AS ProductName
FROM OPENJSON(@json)
INNER JOIN [AdventureWorks2016_EXT].[Sales].[SalesOrder_json] [SOr_j] ON
      [SOr_j].[SalesOrderID] = '43659'
WHERE JSON_VALUE(value, '$.CarrierTrackingNumber') = '4911-403C-98' ;
