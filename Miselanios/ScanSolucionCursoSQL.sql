
    /*#########################################################*/
    /*#########################################################*/

    /*SalesOrderID INT NOT NULL,
    SalesOrderDetailID INT NOT NULL,
    CarrierTrackingNumber NVARCHAR(25) COLLATE Latin1_General_100_BIN2 NOT NULL,
    OrderQty INT NOT NULL,
    ProductID INT NOT NULL,
    UnitPrice MONEY NOT NULL,
    Discount MONEY NOT NULL,*/

    /*#########################################################*/
    /*#########################################################*/


USE AdventureWorks2016_EXT

SELECT TABLE_NAME, 
       COLUMN_NAME FROM Information_Schema.Columns
WHERE TABLE_CATALOG = 'AdventureWorks2016_EXT' 
AND   TABLE_NAME LIKE '%SALES%'
AND   (COLUMN_NAME LIKE '%SalesOrderID%' OR  COLUMN_NAME LIKE '%SalesOrderDetailID%' 
                                        OR  COLUMN_NAME LIKE '%CarrierTrackingNumber'
                                        OR  COLUMN_NAME LIKE '%OrderQty'
                                        OR  COLUMN_NAME LIKE '%ProductID'
                                        OR  COLUMN_NAME LIKE '%UnitPrice'
                                        OR  COLUMN_NAME LIKE '%Discount'); 

/*#########################################################*/
/*#########################################################*/


USE AdventureWorks2016_EXT
SELECT *  FROM Information_Schema.Columns
WHERE TABLE_CATALOG = 'AdventureWorks2016_EXT' 
AND   TABLE_NAME LIKE 'SalesOrderDetail';


/*#########################################################*/
/*#########################################################*/


--- ### ## ########################################################
--- ### ##  SELECT PARA TABLA CON LA CUAL SE REALIZARA EL PROCESO
--- ### ## ALMACENADO
--- ### ## ########################################################

USE AdventureWorks2016_EXT

SELECT * FROM Sales.SalesOrderDetail;

SELECT [SalesOrderID] 
       ,[SalesOrderDetailID] 
       ,[CarrierTrackingNumber]    
       ,[OrderQty] 
       ,[ProductID]
       ,[UnitPrice]
       ,[UnitPriceDiscount]
       FROM Sales.SalesOrderDetail;


--- ### ## ########################################################
--- ### ##  SELECT PARA TABLA CON LA CUAL SE REALIZARA EL PROCESO
--- ### ## ALMACENADO
--- ### ## ########################################################


USE [AdventureWorks2016_EXT]
GO

/****** Object:  StoredProcedure [dbo].[TestTransactionProductionCorr]    Script Date: 16/05/2023 05:32:30 a. m. ******/
DROP PROCEDURE [dbo].[TestFullLoadTableMemory] 
GO

/****** Object:  StoredProcedure [dbo].[TestTransactionProductionCorr]    Script Date: 16/05/2023 05:32:30 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TestFullLoadTableMemory] 
AS
BEGIN
	
	SET NOCOUNT ON;

    
 TRUNCATE TABLE [dbo].[SalesOrderDetailInMem];

	
  INSERT INTO [dbo].[SalesOrderDetailInMem]
      SELECT [SalesOrderID] 
       ,[SalesOrderDetailID] 
       ,[CarrierTrackingNumber]    
       ,[OrderQty] 
       ,[ProductID]
       ,[UnitPrice]
       ,[UnitPriceDiscount]
       FROM [Sales].[SalesOrderDetail];


END
GO



    
    
    