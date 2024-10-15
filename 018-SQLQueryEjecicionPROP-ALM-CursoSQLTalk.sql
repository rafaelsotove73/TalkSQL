  --- ### ##############################################################################
  --- ### ##  CREACION DE PROCESO ALMACENADO QUE GENERA COMO SALIDA CON UN PRINT
  --- ### ##  HOLA MUNDO EN EL AREA DE MENSAJES
  --- ### ##############################################################################
  ---(116)

DROP PROCEDURE [dbo].[TestWelcomeCurso];

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<rafael Soto>
-- Create date: <27/04/2023,,>
-- Description:	<Hello Wordl,,>
-- =============================================
CREATE PROCEDURE [dbo].[TestWelcomeCurso]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    
	Print('BIENVENIDO AL CURSO')
END
GO


  --- ### ##############################################################################
  --- ### ##  CREACION DE PROCESO ALMACENADO QUE GENERA COMO SALIDA RESULTADO
  --- ### ##  DE UN SELECT
  --- ### ##############################################################################
  ---(117)

DROP PROC [dbo].[TestTransactionProductionCorr] ;


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TestTransactionProductionCorr] 
AS
BEGIN
	
	SET NOCOUNT ON;

    
	DECLARE @COSTMIN AS DECIMAL(20,4) = (SELECT  MIN([TraProd].[ActualCost])
											FROM [Production].[TransactionHistoryArchive] [TraProd]
											WHERE  [TraProd].[ActualCost] > 50)

  SELECT 
       [TraProd].[TransactionID]
      ,[TraProd].[ProductID]
	    ,[ProBase].[ProductNumber]
	    ,[ProBase].[Name] 
	    ,[ProBase].[Color]
      ,[TraProd].[ReferenceOrderID]
      ,[TraProd].[ReferenceOrderLineID]
      ,[TraProd].[TransactionDate]
      ,[TraProd].[TransactionType]
      ,[TraProd].[Quantity]
      ,IIF([TraProd].[ActualCost] < 50,	@COSTMIN, [TraProd].[ActualCost]) [ActualCost]
      ,[TraProd].[ModifiedDate]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID 
  ORDER BY [TraProd].[ActualCost] ASC
END
GO
