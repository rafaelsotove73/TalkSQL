
--- ### #############################################################
--- ### TABLA DE ENCABEZADO DE FACTURACION
--- ### #############################################################
---(64)

USE AdventureWorks2016_EXT

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
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader];


  SELECT *  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader];


--- ### #############################################################
--- ### TABLA DE ENCABEZADO DE FACTURACION  --- DATOS: NRO ORDEN
--- ### SUB TOTAL, TaxAmt, Freight, TOTAL
--- ### #############################################################
---(65)

  SELECT [SalesOrderID]
      ,[SalesOrderNumber]
      ,[SubTotal]
      ,[TaxAmt]
      ,[Freight]
      ,[TotalDue]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader];

  --- #################################################
  --- ## minimo y el maximo de campo  [TotalDue] ==> TOTAL DE LA FACTURA
  --- ## facturacion an la tabla
  --- ###############################################
 ---(66)
  SELECT MAX([TotalDue]) [MaxTotalFull.Sales] 
	    ,MIN([TotalDue]) [MinTotalFull.Sales]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader];


  --- ###########################################################
  --- ## Promedio de campo  [TotalDue] ==> TOTAL DE LAS FACTURAS 
  --- ## DE TODA LA TABLA
  --- ###########################################################
  ---(67)

  SELECT (SUM([TotalDue])) / (SELECT COUNT(*) FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader]) [Promedio.Sales]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader];
  

  --- FORMATO DE NUMERO
  --- #################################################
  --- ## minimo y el maximo de campo  [TotalDue] ==> TOTAL DE LA FACTURA
  --- ## facturacion an la tabla
  --- ###############################################
  ---(68)

  SELECT FORMAT(MAX([TotalDue]), 'N', 'de-de') [MaxTotalFull.Sales] 
	    ,FORMAT(MIN([TotalDue]), 'N', 'de-de') [MinTotalFull.Sales]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader];

  --- ###########################################################
  --- ## Promedio de campo  [TotalDue] ==> TOTAL DE LAS FACTURAS 
  --- ## DE TODA LA TABLA
  --- ###########################################################
  ---(69)


   SELECT FORMAT( (SUM([TotalDue])) / 
      (SELECT COUNT(*) FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader]) 
	  , 'N', 'de-de') [Promedio.Sales]
   FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader];
 
  --- ################################
  --- ### DROP AND CREATE FUNCTION 
  --- ### SCALAR QUE SACA EL PROMEDIO
  --- ### BASADOSE EN DOS PARAMETROS 
  --- ### DE ENTRADA(SUMA DEL TOTAL 
  --- ### FACTURAS Y EL NRO. TOTAL DE FACTURAS)
  --- ### , TIENE COMO SALIDA 
  --- ### EL PROMEDIO
  --- ################################
  ---(70)

  USE [AdventureWorks2016_EXT]
		GO
		/****** Object:  UserDefinedFunction [dbo].[f_promedio]    Script Date: 11/05/2023 02:25:11 p. m. ******/
		DROP FUNCTION [dbo].[f_promedio]
		GO
		/****** Object:  UserDefinedFunction [dbo].[f_promedio]    Script Date: 11/05/2023 02:25:11 p. m. ******/
		--# Cuando SET ANSI_NULLS está activado (ON), cualquier comparación entre un valor y 
		--# NULL devuelve un resultado desconocido (UNKNOWN), lo que significa que el resultado de la 
		--# comparación no se puede determinar.
		SET ANSI_NULLS ON
		GO
	  -- # AUTOMATOICAMENT SE GENERA ESTA SENTENCIA
	   SET QUOTED_IDENTIFIER ON
		GO
		CREATE FUNCTION [dbo].[f_promedio]
		 (@valor1 DECIMAL(24,5),
		  @NElemt INT
		 )
		 RETURNS DECIMAL (24,5)
		 AS
		 BEGIN 
		   DECLARE @resultado DECIMAL(24,5)
		   SET @resultado=(@valor1)/@NElemt
		   RETURN @resultado
		 END;
		GO

  
  --- ### 
  --- ### 1) DECLACION DE VARIBLES
  --- ### 2)ASIGNACION DE VALORES AL MOMENTO DE CREAR DICHA VARIABLE
  --- ###   MEDIANTE UN QUERY (SELECT)
  --- ### 3)IMPRESION DE VARIABLES EN EL AREA DE MENSAJE
  --- ### 4)IMPLEMENTACION DE LA FUNCION CREADA ANTERIORMENTE Y
  ---###    ASINACION MEDIENTE DOS METODOS SELECT Y SET
  --- ###########################################
  ---(71)

  DECLARE @vSUM DECIMAL(24,5) = (SELECT SUM([TotalDue]) 
								                 FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader]),
                                  @vCount as DECIMAL(24,5) = (SELECT COUNT([TotalDue]) 
                                  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader]),
		  @prom DECIMAL(24,5)

  PRINT('SUMA DE TODAS LAS FACTURAS: ')
  PRINT(@vSUM)
  PRINT('TOTAL NRO.FACTURAS: ')
  PRINT(@vCount)

  ---- PARA CUANDO LA VARIBLE CAMBIA DE FORMA DINAMICA (MUCHAS VECES) SU VALOR
  SELECT @prom = [dbo].[f_promedio] (@vSUM ,@vCount)
  PRINT('PROMEDIO METODO ASIGNACION "SELECT" : ')
  PRINT(FORMAT(@prom, 'N', 'de-de'))

  --- CAMBIA UNA SOLA VEZ DE VALOR
  SET @prom = [dbo].[f_promedio] (@vSUM ,@vCount)
  PRINT('PROMEDIO METODO ASIGNACION "SET" : ')
  PRINT(FORMAT(@prom, 'N', 'de-de'))

  --SELECT permite asignar múltiples valores a una variable a la vez, 
  --mientras que SET solo permite asignar un valor a la vez

  
  --- FORMATO DE NUMERO
  --- #####################################################################
  --- ## AVG(ALL) calcula el promedio de todos los valores en la tabla
  --- ####################################################################
  ---(72)

  SELECT FORMAT(AVG(ALL [TotalDue]), 'N', 'de-de') [MaxTotalFull.Sales]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader]

  --- ############################################################
  --- ###  Debido al modificador DISTINCT, la funci�n AVG() 
  --- ### realiza el c�lculo en valores en factura que son distintos:
  --- ############################################################
  ---(73)

  SELECT FORMAT(AVG(DISTINCT [TotalDue]), 'N', 'de-de') [MaxTotalFull.Sales]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader]

