 --- ###########################
  --- estadisticas en ventas
  --- ###########################

  --- ##################################################
  --- ## FACTURACION POR DIA
  --- ##################################################
  ---(81)

  USE AdventureWorks2016_EXT

  SELECT 
       CONVERT(DATE,[EncSal].[ShipDate],103) [ShipDate]
	  ,SUM([EncSal].[SubTotal]) [SubTotal]
      ,SUM([EncSal].[TaxAmt]) [TaxAmt]
      ,SUM([EncSal].[Freight]) [Freight]
      ,SUM([EncSal].[TotalDue]) [TotalDue]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader] [EncSal]
  GROUP BY CONVERT(DATE,[EncSal].[ShipDate],103)
  ORDER BY CONVERT(DATE,[EncSal].[ShipDate],103)


  --- ##################################################
  --- ## FACTURACION POR DIA CON FORMATOS FOCALIZADA DE
  --- ## UN MES
  --- ##################################################
 ---(82)

  SELECT 
       CONVERT(DATE,[EncSal].[ShipDate],103) [ShipDate]
	  ,SUM([EncSal].[SubTotal]) [SubTotal]
      ,SUM([EncSal].[TaxAmt]) [TaxAmt]
      ,SUM([EncSal].[Freight]) [Freight]
      ,SUM([EncSal].[TotalDue]) [TotalDue]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader] [EncSal]
  WHERE CONVERT(DATE,[EncSal].[ShipDate],103) 
            BETWEEN CONVERT(DATE,'01-06-2011',103) AND CONVERT(DATE,'30-06-2011',103)
  GROUP BY CONVERT(DATE,[EncSal].[ShipDate],103)
  ORDER BY CONVERT(DATE,[EncSal].[ShipDate],103)
 
  --- ###  SUMADA UN MES
  --- ######################
  ---(83)
  SELECT 
      '06-2011' [Periodo]
	  ,SUM([EncSal].[SubTotal]) [SubTotal]
      ,SUM([EncSal].[TaxAmt]) [TaxAmt]
      ,SUM([EncSal].[Freight]) [Freight]
      ,SUM([EncSal].[TotalDue]) [TotalDue]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader] [EncSal]
  WHERE CONVERT(DATE,[EncSal].[ShipDate],103) 
        BETWEEN CONVERT(DATE,'01-06-2011',103) AND CONVERT(DATE,'30-06-2011',103)
  
  --- ###  SUMATORIA UN TRIMESTRAL
  --- ###########################
  ---(84)
  SELECT 
      '06-2011/09-2011' [Periodo]
	  ,SUM([EncSal].[SubTotal]) [SubTotal]
      ,SUM([EncSal].[TaxAmt]) [TaxAmt]
      ,SUM([EncSal].[Freight]) [Freight]
      ,SUM([EncSal].[TotalDue]) [TotalDue]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader] [EncSal]
  WHERE CONVERT(DATE,[EncSal].[ShipDate],103) 
    BETWEEN CONVERT(DATE,'01-06-2011',103) AND CONVERT(DATE,'30-09-2011',103)


  --- ###  SUMADA UN MES
  --- ###  OTRA FORMA
  --- ######################
  ---(85)
  SELECT 
      MONTH([EncSal].[ShipDate]) [MonthShipDate]
	  ,YEAR([EncSal].[ShipDate]) [YearShipDate]
	  ,SUM([EncSal].[SubTotal]) [SubTotal]
      ,SUM([EncSal].[TaxAmt]) [TaxAmt]
      ,SUM([EncSal].[Freight]) [Freight]
      ,SUM([EncSal].[TotalDue]) [TotalDue]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader] [EncSal]
  WHERE CONVERT(DATE,[EncSal].[ShipDate],103) 
    BETWEEN CONVERT(DATE,'01-06-2011',103) AND CONVERT(DATE,'30-06-2011',103)
  GROUP BY YEAR([EncSal].[ShipDate])
		   ,MONTH([EncSal].[ShipDate])
  

  --- #############################
  ---(86)
  SELECT 
      CONVERT(VARCHAR(2),MONTH([EncSal].[ShipDate]))+ '/' + CONVERT(VARCHAR(4),YEAR([EncSal].[ShipDate])) [Periodo]
	  ,SUM([EncSal].[SubTotal]) [SubTotal]
      ,SUM([EncSal].[TaxAmt]) [TaxAmt]
      ,SUM([EncSal].[Freight]) [Freight]
      ,SUM([EncSal].[TotalDue]) [TotalDue]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader] [EncSal]
  WHERE CONVERT(DATE,[EncSal].[ShipDate],103) BETWEEN CONVERT(DATE,'01-06-2011',103) AND CONVERT(DATE,'30-06-2011',103)
  GROUP BY YEAR([EncSal].[ShipDate])
		   ,MONTH([EncSal].[ShipDate])

--- #############################
 ---(87)
  SELECT 
      CONVERT(VARCHAR(2),MONTH([EncSal].[ShipDate]))+ '/' + CONVERT(VARCHAR(4),YEAR([EncSal].[ShipDate])) [Periodo]
	  ,SUM([EncSal].[SubTotal]) [SubTotal]
      ,SUM([EncSal].[TaxAmt]) [TaxAmt]
      ,SUM([EncSal].[Freight]) [Freight]
      ,SUM([EncSal].[TotalDue]) [TotalDue]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader] [EncSal]
  GROUP BY YEAR([EncSal].[ShipDate])
		   ,MONTH([EncSal].[ShipDate])
 ORDER BY YEAR([EncSal].[ShipDate])
		   ,MONTH([EncSal].[ShipDate])

--- #############################
---(88)
  SELECT 
      CONVERT(VARCHAR(2),MONTH([EncSal].[ShipDate]))+ '/' + CONVERT(VARCHAR(4),YEAR([EncSal].[ShipDate])) [Periodo]
	  ,SUM([EncSal].[SubTotal]) [SubTotal]
      ,SUM([EncSal].[TaxAmt]) [TaxAmt]
      ,SUM([EncSal].[Freight]) [Freight]
      ,SUM([EncSal].[TotalDue]) [TotalDue]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader] [EncSal]
  GROUP BY YEAR([EncSal].[ShipDate])
		   ,MONTH([EncSal].[ShipDate])
 ORDER BY YEAR([EncSal].[ShipDate]) DESC
		   ,MONTH([EncSal].[ShipDate]) DESC   -- FOR DEFAULT ASC


--- ########### POR A�O ##################
---(89)
  SELECT 
      YEAR([EncSal].[ShipDate]) [Periodo]
	  ,SUM([EncSal].[SubTotal]) [SubTotal]
      ,SUM([EncSal].[TaxAmt]) [TaxAmt]
      ,SUM([EncSal].[Freight]) [Freight]
      ,SUM([EncSal].[TotalDue]) [TotalDue]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader] [EncSal]
  GROUP BY YEAR([EncSal].[ShipDate])
 ORDER BY YEAR([EncSal].[ShipDate]) DESC -- FOR DEFAULT ASC


--- ########### POR A�O Y CLIENTE ##################
---(90)
  SELECT 
      YEAR([EncSal].[ShipDate]) [Periodo]
	  ,ISNULL([Per].FirstName, 'CONSUMIDOR FINAL') [FirstName]
	  ,ISNULL([Per].LastName, 'S/LastName') [LastName]
	  ,SUM([EncSal].[SubTotal]) [SubTotal]
      ,SUM([EncSal].[TaxAmt]) [TaxAmt]
      ,SUM([EncSal].[Freight]) [Freight]
      ,SUM([EncSal].[TotalDue]) [TotalDue]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader] [EncSal]
  LEFT JOIN [Sales].[Customer] [Cust] ON [Cust].CustomerID = [EncSal].CustomerID
  LEFT JOIN [Person].[BusinessEntityContact] [PerBEC] ON [PerBEC].PersonID  = [Cust].PersonID
  LEFT JOIN [Person].[Person] [Per] ON [Per].BusinessEntityID  = [PerBEC].BusinessEntityID
  GROUP BY YEAR([EncSal].[ShipDate])
           ,[Per].FirstName
		   ,[Per].LastName
 ORDER BY YEAR([EncSal].[ShipDate]) DESC
          ,[Per].FirstName DESC
		  ,[Per].LastName DESC-- FOR DEFAULT ASC


--- ########### POR A�O Y CLIENTE ##################
--- ## ROUND 
---(91)
  SELECT 
      YEAR([EncSal].[ShipDate]) [Periodo]
	  ,ISNULL([Per].FirstName, 'CONSUMIDOR FINAL') [FirstName]
	  ,ISNULL([Per].LastName, 'S/LastName') [LastName]
	  ,ROUND(SUM([EncSal].[SubTotal]),2) [SubTotal]
      ,ROUND(SUM([EncSal].[TaxAmt]),2) [TaxAmt]
      ,ROUND(SUM([EncSal].[Freight]),2) [Freight]
      ,ROUND(SUM([EncSal].[TotalDue]),2) [TotalDue]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader] [EncSal]
  LEFT JOIN [Sales].[Customer] [Cust] ON [Cust].CustomerID = [EncSal].CustomerID
  LEFT JOIN [Person].[BusinessEntityContact] [PerBEC] ON [PerBEC].PersonID  = [Cust].PersonID
  LEFT JOIN [Person].[Person] [Per] ON [Per].BusinessEntityID  = [PerBEC].BusinessEntityID
  GROUP BY YEAR([EncSal].[ShipDate])
           ,[Per].FirstName
		   ,[Per].LastName
 ORDER BY YEAR([EncSal].[ShipDate]) DESC
          ,[Per].FirstName DESC
		  ,[Per].LastName DESC-- FOR DEFAULT ASC


--- ########### POR A�O Y CLIENTE ##################
--- TRANFOMACION DE MONTOS POSITICOS A NEGATIVOS EN VENTAS
---(92)
  SELECT 
      YEAR([EncSal].[ShipDate]) [Periodo]
	  ,ISNULL([Per].FirstName, 'CONSUMIDOR FINAL') [FirstName]
	  ,ISNULL([Per].LastName, 'S/LastName') [LastName]
	  ,(SUM([EncSal].[SubTotal])*-1) [SubTotal]
      ,(SUM([EncSal].[TaxAmt])*-1) [TaxAmt]
      ,(SUM([EncSal].[Freight])*-1) [Freight]
      ,(SUM([EncSal].[TotalDue])*-1) [TotalDue]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader] [EncSal]
  LEFT JOIN [Sales].[Customer] [Cust] ON [Cust].CustomerID = [EncSal].CustomerID
  LEFT JOIN [Person].[BusinessEntityContact] [PerBEC] ON [PerBEC].PersonID  = [Cust].PersonID
  LEFT JOIN [Person].[Person] [Per] ON [Per].BusinessEntityID  = [PerBEC].BusinessEntityID
  GROUP BY YEAR([EncSal].[ShipDate])
           ,[Per].FirstName
		   ,[Per].LastName
 ORDER BY YEAR([EncSal].[ShipDate]) DESC
          ,[Per].FirstName DESC
		  ,[Per].LastName DESC-- FOR DEFAULT ASC

--- ########### POR A�O Y CLIENTE ##################
--- TRANFOMACION DE MONTOS POSITICOS A NEGATIVOS EN VENTAS ---> CAMBIAR CON ABS
---(93)
  SELECT 
      YEAR([EncSal].[ShipDate]) [Periodo]
	  ,ISNULL([Per].FirstName, 'CONSUMIDOR FINAL') [FirstName]
	  ,ISNULL([Per].LastName, 'S/LastName') [LastName]
	  ,ABS(SUM([EncSal].[SubTotal])*-1) [SubTotal]
      ,ABS(SUM([EncSal].[TaxAmt])*-1) [TaxAmt]
      ,ABS(SUM([EncSal].[Freight])*-1) [Freight]
      ,ABS(SUM([EncSal].[TotalDue])*-1) [TotalDue]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader] [EncSal]
  LEFT JOIN [Sales].[Customer] [Cust] ON [Cust].CustomerID = [EncSal].CustomerID
  LEFT JOIN [Person].[BusinessEntityContact] [PerBEC] ON [PerBEC].PersonID  = [Cust].PersonID
  LEFT JOIN [Person].[Person] [Per] ON [Per].BusinessEntityID  = [PerBEC].BusinessEntityID
  GROUP BY YEAR([EncSal].[ShipDate])
           ,[Per].FirstName
		   ,[Per].LastName
 ORDER BY YEAR([EncSal].[ShipDate]) DESC
          ,[Per].FirstName DESC
		  ,[Per].LastName DESC-- FOR DEFAULT ASC

--- ########### POR A�O Y CLIENTE ##################
--- ## CEILING  REDONDEA AL ENTERO SUPERIOR INMEDIATO
---(94)
  SELECT  TOP(4)
      YEAR([EncSal].[ShipDate]) [Periodo]
	  ,ISNULL([Per].FirstName, 'CONSUMIDOR FINAL') [FirstName]
	  ,ISNULL([Per].LastName, 'S/LastName') [LastName]
      ,SUM([EncSal].[TotalDue]) [TotalDueOriginal]
	  ,CEILING(SUM([EncSal].[TotalDue])) [TotalDue]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader] [EncSal]
  LEFT JOIN [Sales].[Customer] [Cust] ON [Cust].CustomerID = [EncSal].CustomerID
  LEFT JOIN [Person].[BusinessEntityContact] [PerBEC] ON [PerBEC].PersonID  = [Cust].PersonID
  LEFT JOIN [Person].[Person] [Per] ON [Per].BusinessEntityID  = [PerBEC].BusinessEntityID
  GROUP BY YEAR([EncSal].[ShipDate])
           ,[Per].FirstName
		   ,[Per].LastName
 ORDER BY YEAR([EncSal].[ShipDate]) DESC
          ,[Per].FirstName DESC
		  ,[Per].LastName DESC-- FOR DEFAULT ASC

--- ########### POR A�O Y CLIENTE ##################
--- ## FLOOR REDONDEA AL ENTERO INFERIOR INMEDIATO
---(95)
  SELECT  TOP(4)
      YEAR([EncSal].[ShipDate]) [Periodo]
	  ,ISNULL([Per].FirstName, 'CONSUMIDOR FINAL') [FirstName]
	  ,ISNULL([Per].LastName, 'S/LastName') [LastName]
      ,SUM([EncSal].[TotalDue]) [TotalDueOriginal]
	  ,FLOOR(SUM([EncSal].[TotalDue])) [TotalDue]
  FROM [AdventureWorks2016_EXT].[Sales].[SalesOrderHeader] [EncSal]
  LEFT JOIN [Sales].[Customer] [Cust] ON [Cust].CustomerID = [EncSal].CustomerID
  LEFT JOIN [Person].[BusinessEntityContact] [PerBEC] ON [PerBEC].PersonID  = [Cust].PersonID
  LEFT JOIN [Person].[Person] [Per] ON [Per].BusinessEntityID  = [PerBEC].BusinessEntityID
  GROUP BY YEAR([EncSal].[ShipDate])
           ,[Per].FirstName
		   ,[Per].LastName
 ORDER BY YEAR([EncSal].[ShipDate]) DESC
          ,[Per].FirstName DESC
		  ,[Per].LastName DESC-- FOR DEFAULT ASC

--------------------------------------------
--- #################################################
--- #### CALCULO CON RAIZ CUADRADA
--- #################################################
---(96)

DECLARE @VALOR_RAIZ INTEGER = 4
DECLARE @RESULT AS DECIMAL(24,5)


SELECT @RESULT = SQRT(@VALOR_RAIZ)

PRINT ('RAIZ CUADRADA DE ' + CONVERT(VARCHAR(2),@VALOR_RAIZ))
PRINT ('ES ')
PRINT(@RESULT)

--- #######################################################
--- #### CALCULO DEVUELVE EL VALOR ELEVADO A UN POTENCIA
--- #######################################################
---(97)

--- ### DONDE 5 SE ELEVA A LA TERCERA POTENCIA

DECLARE @Resultado AS FLOAT 

SELECT @Resultado = POWER(5, 3) ;

PRINT (@Resultado)


-- #función EXP para calcular el valor exponencial de 2, que es aproximadamente 7.389. 
-- #La consulta devuelve el resultado "7.38905609893065",
---(98)

SELECT EXP(2) AS Resultado;

-- # función LOG para calcular el logaritmo natural de 10, que es aproximadamente 2.303. 
-- # La consulta devuelve el resultado "2.30258509299405"
---(99)

SELECT LOG(10) AS Resultado;

