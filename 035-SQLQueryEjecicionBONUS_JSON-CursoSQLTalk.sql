
USE AdventureWorks2019

DROP PROC [dbo].[TestJsonGestion]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Developer,,RAFAEL SOTO>
-- Create date: <Create 24/05/2023,,>
-- Description:	<---(235),,>
-- =============================================
CREATE PROCEDURE [dbo].[TestJsonGestion]
@NSale_Order AS INTEGER

AS
BEGIN

  SET NOCOUNT ON;

  DECLARE @ShippingInf AS NVARCHAR(MAX) =(SELECT 
                                            JSON_QUERY(Info,'$.ShippingInfo') ShippingInfo
                                          FROM [AdventureWorks2016_EXT].[Sales].[SalesOrder_json] [SOr_j]
                                          WHERE [SOr_j].[SalesOrderID] = @NSale_Order )
  DECLARE @BillingInf AS NVARCHAR(MAX) =(SELECT 
                                            JSON_QUERY(Info,'$.BillingInfo') BillingInfo
                                        FROM [AdventureWorks2016_EXT].[Sales].[SalesOrder_json] [SOr_j]
                                        WHERE [SOr_j].[SalesOrderID] = @NSale_Order )
  DECLARE @SalesPersonInf AS NVARCHAR(MAX) =(SELECT 
                                              JSON_QUERY(Info,'$.SalesPerson') SalesPersonInfo
                                            FROM [AdventureWorks2016_EXT].[Sales].[SalesOrder_json] [SOr_j]
                                            WHERE [SOr_j].[SalesOrderID] = @NSale_Order )


	
	
  SELECT      
    @NSale_Order SalesOrderNumber
    -------------------- *** @SalesPersonInf ***
    ,JSON_VALUE(@SalesPersonInf, '$.Name') AS [Name]
    ,JSON_VALUE(@SalesPersonInf, '$.ID') AS [ID]
    --------------------  *** @BillingInf ***
    ,JSON_VALUE(@BillingInf, '$.Address') AS [Address]
    ,JSON_VALUE(@BillingInf, '$.City') AS [City]
    ,JSON_VALUE(@BillingInf, '$.PostalCode') AS [PostalCode]
    -------------------- *** @ShippingInf ***
    ,JSON_VALUE(@ShippingInf, '$.Province') AS [Province]
    ,JSON_VALUE(@ShippingInf, '$.Method') AS [Method]
    ,JSON_VALUE(@ShippingInf, '$.ShipBase') AS [ShipBase]
    ,JSON_VALUE(@ShippingInf, '$.ShipRate') AS [ShipRate]

    RETURN

  
END
GO
