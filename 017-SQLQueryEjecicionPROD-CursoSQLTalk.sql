/****** Script for SelectTopNRows command from SSMS  ******/

 USE AdventureWorks2016_EXT;

 --- ### ##############################################################
 --- ### ## QUERY DE SELECT BASE PARA EL DESARROLLO DE EJERCICIOS
 --- ### ## ALGO ASI COMO LA VESION 0 DEL EJERCICIO
 --- ### ##############################################################
 ---(101)

SELECT TOP (2550) [TransactionID]
      ,[ProductID]
      ,[ReferenceOrderID]
      ,[ReferenceOrderLineID]
      ,[TransactionDate]
      ,[TransactionType]
      ,[Quantity]
      ,[ActualCost]
      ,[ModifiedDate]
  FROM [AdventureWorks2016_EXT].[Production].[TransactionHistoryArchive]

 --- ### ##############################################################
 --- ### ## QUERY DE SELECT PRIMERA CONECXION PARA BUSQUEDA DE CAMPOS
 --- ### ## RELACIONADOS CON DATOS DE PRODUCTOS  --(((BASE)))
 --- ### ##############################################################
 ---(102)

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
    ,[TraProd].[ActualCost]
    ,[TraProd].[ModifiedDate]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID 
  

 --- ### ##############################################################
 --- ### ## QUERY DE SELECT DEPURACION DE NULOS EN EL CAMPO COLOR
 --- ### ## LOS NULOS SE REEPLAZARON CON UN STRING("NOT/C")
 --- ### ## TRATAMIENTO DE DATOS FECHA Y COLOCACION DE FORMATO 
 --- ### ## A FECHA DE CREACION Y/O MOFICACION DE PRODUCTO
 --- ### ##############################################################
 ---(103)


    SELECT 
     [TraProd].[TransactionID]
    ,[TraProd].[ProductID]
	  ,[ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,ISNULL([ProBase].[Color],'NOT/C') [Color]
    ,[TraProd].[Quantity]
    ,([TraProd].[ActualCost] * [TraProd].[Quantity]) [SumCostAct]
    ,CONVERT(DATE,[TraProd].[ModifiedDate],103) [Date]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID 

 --- ### #########################################################################
 --- ### ## QUERY DE SELECT  SUMATORIA DE PRODUCCION POR DIA Y TOTALIZACION
 --- ### ## DE COSTOS, TOMANDO EN CUENTA [ACTUALCOSTOS] ESTA DADO POR ARTICULO
 --- ### ## ADEMAS CALCULOS MATEMATICO // COMPROBACION DE UN SOLO ARTICULO
 --- ### ## MEDIANTE WHERE , ADEMAS DE UN GROUP BY 
 --- ### ##############################################################
 ---(104)

  SELECT 
	  [ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,ISNULL([ProBase].[Color],'NOT/C') [Color]
    ,SUM([TraProd].[Quantity]) [Quantity]
	  ,SUM([TraProd].[ActualCost]) [ActualCost]
    ,(SUM([TraProd].[ActualCost]) * SUM([TraProd].[Quantity])) [SumCostAct]
    ,CONVERT(DATE,[TraProd].[ModifiedDate],103) [Date]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID 
  --WHERE [ProBase].[ProductNumber] ='BE-2349'
  GROUP BY [TraProd].[ProductID]
	  ,[ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,isnull([ProBase].[Color],'NOT/C')
	  ,CONVERT(DATE,[TraProd].[ModifiedDate],103)


 --- ### #########################################################################
 --- ### ## QUERY DE SELECT  SUMATORIA DE PRODUCCION POR MES Y TOTALIZACION
 --- ### ## DE COSTOS, TOMANDO EN CUENTA [ACTUALCOSTOS] ESTA DADO POR ARTICULO
 --- ### ## ADEMAS CALCULOS MATEMATICO // COMPROBACION DE UN SOLO ARTICULO
 --- ### ## MEDIANTE WHERE , ADEMAS DE UN GROUP BY EN UN COJUNTO DE CAMPOS
 --- ### ## Y UN ORDER BY
 --- ### ##############################################################
 ---(105)
 
   SELECT 
	  [ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,isnull([ProBase].[Color],'NOT/C') [Color]
    ,SUM([TraProd].[Quantity]) [Quantity]
	  ,SUM([TraProd].[ActualCost]) [ActualCost]
	  ,(SUM([TraProd].[ActualCost]) * SUM([TraProd].[Quantity])) [SumCostAct]
    ,MONTH([TraProd].[ModifiedDate]) [MONTH]
	  ,YEAR([TraProd].[ModifiedDate]) [YEAR]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID 
  GROUP BY [TraProd].[ProductID]
	  ,[ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,ISNULL([ProBase].[Color],'NOT/C')
	  ,MONTH([TraProd].[ModifiedDate]) 
	  ,YEAR([TraProd].[ModifiedDate])
  ORDER BY MONTH([TraProd].[ModifiedDate]), YEAR([TraProd].[ModifiedDate]) ASC 

 --- ### #########################################################################
 --- ### ## QUERY DE SELECT  LA GERENCIA TOMA LA DECISION QUE AQUELLOS ARTICULOS
 --- ### ## DE "COSTO ACTUAL" MENOR DE 50 DOLARES TOMARAN EL VALOR PROXIMO
 --- ### ## MAYOR  DE 50 DOLARES.
 --- ### ##############################################################
 
 --- ### ##############################################################################
 --- ### ## BUSQUEDA DE PRODUCTO CON COSTO ACTUAL VALOR CERCANO A CINCUETA POR ENCIMA 
 --- ### ##############################################################################
 ---(106)
  
  SELECT TOP(1) 
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
    ,[TraProd].[ActualCost]
    ,[TraProd].[ModifiedDate]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID 
  WHERE [TraProd].[ActualCost] > 50
  ORDER BY [TraProd].[ActualCost] ASC

  
 --- ### ##############################################################################
 --- ### ## BUSQUEDA DE PRODUCTO CON COSTO ACTUAL VALOR CERCANO A CINCUETA POR ENCIMA 
 --- ### ## DEPURADO DE UN SOLO CAMPO
 --- ### ##############################################################################
 
 --- ### ##############################################################################
 --- ### ## MINIMO COSTO POR ENCIMA DE 50 --> TAMBIEN FUNCIONA CON FUNCION MIN
 --- ### ##############################################################################
 ---(107)

  SELECT TOP(1) [TraProd].[ActualCost]
  FROM  [Production].[TransactionHistoryArchive] [TraProd]
  WHERE [TraProd].[ActualCost] > 50
  ORDER BY [TraProd].[ActualCost] ASC

 --- ### ##############################################################################
 --- ### ## MAXIMO COSTO POR ENCIMA DE 50 --> TAMBIEN FUNCIONA CON FUNCION MAX
 --- ### ##############################################################################
 ---(108)
  
  SELECT TOP(1) [TraProd].[ActualCost]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  WHERE [TraProd].[ActualCost] > 50
  ORDER BY [TraProd].[ActualCost]  DESC

  --- ### ##############################################################################
  --- ### ## PROMEDIO COSTO POR ENCIMA DE 50 CON FUNCION AVG
  --- ### ##############################################################################
  ---(109)
  
  SELECT  AVG([TraProd].[ActualCost])
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  WHERE [TraProd].[ActualCost] > 50
  
  --- ### ##############################################################################
  --- ### ##  VARIANTE DE SELECT  CON UNA ISNTRUCCION "IIF" CONBINADA CON UN "SELECT"
  --- ### ## PARA REEMPLAZAR TODOS LOS COSTOS ACTUALES MENORES QUE 50
  --- ### ##############################################################################
  ---(110)

  
  SELECT 
	   [ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,[ProBase].[Color]
    ,[TraProd].[TransactionDate]
    ,[TraProd].[Quantity]
    ,IIF([TraProd].[ActualCost] < 50,
	      (SELECT  MIN([TProd].[ActualCost])
		    FROM [Production].[TransactionHistoryArchive] [TProd]
		    WHERE [TProd].[ActualCost] > 50),
		[TraProd].[ActualCost]) [ActualCost]
    ,[TraProd].[ModifiedDate]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID 
  ORDER BY [TraProd].[ActualCost] ASC


  --- ### ##############################################################################
  --- ### ##  OTRA VARIANTE DE SELECT  CON UNA ISNTRUCCION "IIF" CONBINADA CON UNA
  --- ### ##  VARIABLE CONTENIDO EL CUAL ES EXTRAIDO DE UN SELEC CONVINADA CON UNA 
  --- ### ## FUNCION MIN
  --- ### ##############################################################################
  ---(111)

  DECLARE @COSTMIN AS DECIMAL(20,4) = (SELECT  MIN([TraProd].[ActualCost])
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  WHERE [TraProd].[ActualCost] > 50)

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


  --- ### ##############################################################################
  --- ### ##  LLAMANO DE PRIMER PROCESO ALMACENADO
  --- ### ##  
  --- ### ##############################################################################
  ---> FILE 18
  ---(112)

DECLARE @RC int
EXECUTE @RC = [dbo].[TestWelcomeCurso] 
PRINT(@RC)

  --- ### ##############################################################################
  --- ### ##  LLAMANO DE PRIMER PROCESO ALMACENADO QUE GENERA COMO SALIDA EL RESULTADO
  --- ### ##  DE UN SELECT
  --- ### ##############################################################################
  ---> FILE 18
  ---(113)

DECLARE @R int
EXECUTE @R = [dbo].[TestTransactionProductionCorr] 
PRINT(@R)


  --- ### ##############################################################################
  --- ### ##  EJEMPLO CON FUNCTION PARSE MULTIPLES EJEMPLOS
  --- ### ##  
  --- ### ##############################################################################
  ---(114)


SELECT PARSE('42' AS INT) AS ConvertedValue;

SELECT PARSE('2023-05-13' AS DATE) AS ConvertedDate;

SELECT PARSE('15:30:00' AS TIME) AS ConvertedTime;

SELECT PARSE('2023-05-13T15:30:00' AS DATETIME2) AS ConvertedDateTime;

SELECT PARSE('$10.99' AS MONEY) AS ConvertedMoney;

--- ### ##############################################################################
--- ### ##  EJEMPLO CON FUNCTION CAST MULTIPLES EJEMPLOS
--- ### ##  
--- ### ##############################################################################
---(115)

SELECT CAST(42 AS VARCHAR(2)) AS ConvertedValue;

SELECT CAST('2023-05-13' AS VARCHAR(10)) AS ConvertedDate;

SELECT CAST('15:30:00' AS VARCHAR(8)) AS ConvertedTime;

SELECT CAST('2023-05-13T15:30:00' AS VARCHAR(19)) AS ConvertedDateTime;

SELECT CAST(3.14 AS INT) AS ConvertedInt;

SELECT CAST(3.14 AS DECIMAL(4,2)) AS ConvertedDecimal;
