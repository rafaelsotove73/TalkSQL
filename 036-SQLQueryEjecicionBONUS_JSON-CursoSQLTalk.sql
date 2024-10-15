USE [AdventureWorks2016_EXT]
GO
---(236) --- EJECUCION POR CODIGO DE UN PROCESO ALMACENADO


DECLARE @RC int
DECLARE @NSale_Order int = 43659

-- TODO: Set parameter values here.

EXECUTE @RC = [dbo].[TestJsonGestion] 
   @NSale_Order
GO


