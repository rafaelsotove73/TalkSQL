--- ########################################
--- ###  EJEMPLOS DE EXISTS
--- #######################################
---(100)

USE AdventureWorks2016_EXT

IF EXISTS (
  SELECT *
  FROM Sales.SalesOrderDetail
  WHERE UnitPrice > 500
)
BEGIN
  PRINT 'Hay productos con precio de venta superior a $500'
END
ELSE
BEGIN
  PRINT 'No hay productos con precio de venta superior a $500'
END

