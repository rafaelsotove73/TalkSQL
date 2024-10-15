
--- ########################################################
--- ### EJEMPLO DE UN  "CROSS JOIN" EN UN SELECT
--- ### CON TABLAS DE ORDENES DE COMPRAS
--- ########################################################
---(171)

USE AdventureWorks2016_EXT;

SELECT 
 ph.PurchaseOrderID
,Convert(DATE,ph.[ShipDate],103) [ShipDate]
,pd.PurchaseOrderDetailID
,p.ProductID
,p.Name
,pd.[OrderQty]
,pd.[UnitPrice]
,pd.[LineTotal]
,ph.[SubTotal]
,ph.[TaxAmt]
,ph.[Freight]
,ph.[TotalDue]
FROM [Purchasing].[PurchaseOrderHeader] ph
CROSS JOIN [Purchasing].[PurchaseOrderDetail] pd
CROSS JOIN [Production].[Product] p
WHERE ph.PurchaseOrderID = pd.PurchaseOrderID
AND pd.ProductID = p.ProductID
ORDER BY ph.PurchaseOrderID


--- ########################################################
--- ### EJEMPLO DE UN  "CROSS JOIN" EN UN SELECT
--- ### SUMA DE CADENAS DE CAMPOS CARACTRES  PARA GENERAR
--- ### NRO DE ORDEN DE COMPRA
--- ########################################################
---(172)

SELECT 
CONVERT(VARCHAR(10),ph.[PurchaseOrderID]) + CONVERT(VARCHAR(10),ph.[RevisionNumber]) +
      CONVERT(VARCHAR(10),ph.[Status]) +  CONVERT(VARCHAR(10),ph.[EmployeeID]) + 
      CONVERT(VARCHAR(10),ph.[VendorID])  + '-' + CONVERT(VARCHAR(10),ph.[ShipMethodID]) [NoOrderPur]
,Convert(DATE,ph.[ShipDate],103) [ShipDate]
,p.Name
,pd.[OrderQty]
,pd.[UnitPrice]
,pd.[LineTotal]
,ph.[SubTotal]
,ph.[TaxAmt]
,ph.[Freight]
,ph.[TotalDue]
FROM [Purchasing].[PurchaseOrderHeader] ph
CROSS JOIN [Purchasing].[PurchaseOrderDetail] pd
CROSS JOIN [Production].[Product] p
WHERE ph.PurchaseOrderID = pd.PurchaseOrderID
AND pd.ProductID = p.ProductID
ORDER BY ph.PurchaseOrderID


--- ########################################################
--- ### EJEMPLO DE UN  "RIGHT JOIN" EN UN SELECT
--- ### 
--- ########################################################
---(173)

SELECT 
pro.Name, 
sod.UnitPrice , 
sod.LineTotal
FROM Sales.SalesOrderDetail sod
RIGHT JOIN Production.Product pro ON sod.ProductID = pro.ProductID
WHERE sod.SalesOrderID IS NULL
ORDER BY pro.Name;


SELECT 
[Pro].ProductID, 
[Pro].Name AS ProductName, 
[PSub].Name AS CategoryName
FROM Production.Product AS [Pro]
LEFT JOIN Production.ProductSubcategory AS [PSub]
ON [Pro].ProductSubcategoryID = [PSub].ProductCategoryID

--- ########################################################
--- # se utiliza para obtener el número de filas afectadas 
--- # por la instrucción SQL más reciente.
--- ########################################################
--- (174)

SELECT @@ROWCOUNT AS ServerName;

