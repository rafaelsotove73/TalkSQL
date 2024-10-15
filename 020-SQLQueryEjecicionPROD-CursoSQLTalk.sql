  
--- ### ##############################################################################
--- ### ##   GENERACION DE SELECT DE PRODUCCION ENTRE FECHAS CON BETWEEN
--- ### ##############################################################################
---(123)
  
  USE AdventureWorks2016_EXT;

  SELECT 
	  [ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,[ProBase].[Color]
    ,[TraProd].[Quantity]
    ,[TraProd].[ActualCost]
	  ,CONVERT(DATE,[TraProd].[TransactionDate],103) [TransactionDate]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID 
  WHERE [TraProd].[TransactionDate] BETWEEN '20110401' AND '20110601';

--- ### ##############################################################################
--- ### ##  GENERACION DE SELECT DE PRODUCCION ENTRE FECHAS CON BETWEEN
--- ### ##  COMBINADO CON CONVERT
--- ### ##############################################################################
---(124)

  SELECT 
	  [ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,[ProBase].[Color]
    ,[TraProd].[Quantity]
    ,[TraProd].[ActualCost]
	  ,CONVERT(DATE,[TraProd].[TransactionDate],103) [TransactionDate]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID 
  WHERE CONVERT(DATE,[TraProd].[TransactionDate],103) 
  BETWEEN  CONVERT(DATE,'01-04-2011',103) AND CONVERT(DATE,'01-06-2011',103);

--- ### ##############################################################################
--- ### ##  GENERACION DE SELECT DE PRODUCCION ENTRE FECHAS REEMPLAZO BETWEEN
--- ### ##  POR LOS SIGNO DE MAYOY Y MENOR QUE
--- ### ##############################################################################
---(125)
  
  SELECT 
	  [ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,[ProBase].[Color]
    ,[TraProd].[Quantity]
    ,[TraProd].[ActualCost]
	  ,CONVERT(DATE,[TraProd].[TransactionDate],103) [TransactionDate]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID 
  WHERE (CONVERT(DATE,[TraProd].[TransactionDate],103) >  CONVERT(DATE,'01-04-2011',103)) 
        AND (CONVERT(DATE,[TraProd].[TransactionDate],103) < CONVERT(DATE,'01-06-2011',103));


--- ### ##############################################################################
--- ### ##  GENERACION DE SELECT DE PRODUCCION UTILIZANDO LA SENTENCIA  LIKE
--- ### ## Esto buscará cualquier registro en la tabla [Production].[Product] donde la columna 
--- ### ## [ProductNumber] contenga la cadena "59" en cualquier parte de la cadena de texto. 
--- ### ## En otras palabras, la consulta buscará todos los registros de productos cuyo número de 
--- ### ## producto contenga "59" en cualquier posición.
--- ### ##############################################################################
---(126)

----  REMENBER DESDE ORO ENFOQUE

  SELECT 
	    [ProBase].[ProductNumber]
	    ,[ProBase].[Name] 
	    ,[ProBase].[Color]
      ,[TraProd].[Quantity]
      ,[TraProd].[ActualCost]
      ,[TraProd].[TransactionDate]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID  AND
  [ProBase].[ProductNumber] LIKE '%59%';

--- ### ##############################################################################
--- ### ##  GENERACION DE SELECT DE PRODUCCION UTILIZANDO LA SENTENCIA  LIKE
--- ### ##  En este caso, la consulta buscará todos los registros de productos en la tabla 
--- ### ##  [Production].[Product] cuyo número de producto comience con "CA". El signo de 
--- ### ##  porcentaje % al final del patrón indica que la búsqueda debe incluir todas las 
--- ### ##  cadenas que comienzan con "CA", seguido de cero o más caracteres adicionales.
--- ### ## EL OPERADOR CONDICIONAL FUE COLOCADO EN  DIRECTO EN EL INNER JOIN
--- ### ##############################################################################
---(127)

  SELECT 
	  [ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,[ProBase].[Color]
    ,[TraProd].[Quantity]
    ,[TraProd].[ActualCost]
    ,[TraProd].[TransactionDate]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID  AND
  [ProBase].[ProductNumber] LIKE 'CA%';

--- ### #############################################################################################
--- ### ##  GENERACION DE SELECT DE PRODUCCION UTILIZANDO LA SENTENCIA  LIKE
--- ### ##  En este caso, la consulta buscará todos los registros de productos en la tabla 
--- ### ##  [Production].[Product] cuyo número de producto termine en "59". El signo de porcentaje 
--- ### ##  % al principio del patrón indica que la búsqueda debe incluir todas las cadenas que 
--- ### ##  terminan con "59", precedidas por cero o más caracteres adicionales.
--- ### ## EL OPERADOR CONDICIONAL FUE COLOCADO EN EL WHERE
--- ### #############################################################################################
---(128)

    SELECT 
	  [ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,[ProBase].[Color]
    ,[TraProd].[Quantity]
    ,[TraProd].[ActualCost]
    ,[TraProd].[TransactionDate]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID 
  WHERE [ProBase].[ProductNumber] LIKE '%59';


--- ### #############################################################################################
--- ### ##  GENERACION DE SELECT EL OPERADOR CONDICIONAL UTILIZADO ESTA DIRECTO EN EL INNER JOIN
--- ### ##  DESPUES DEL AND COMPARACION DE CADENA
--- ### #############################################################################################
---(129)


  SELECT 
	  [ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,[ProBase].[Color]
    ,[TraProd].[Quantity]
    ,[TraProd].[ActualCost]
    ,[TraProd].[TransactionDate]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID  
	AND  [ProBase].[ProductNumber] = 'CA-1098';


--- ### #############################################################################################
--- ### ##  GENERACION DE SELECT EL OPERADOR CONDICIONAL UTILIZADO ESTA EN EL WHERE 
--- ### ##  COMPARACION DE CADENA
--- ### #############################################################################################
---(130)

  SELECT 
    [ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,[ProBase].[Color]
    ,[TraProd].[Quantity]
    ,[TraProd].[ActualCost]
    ,[TraProd].[TransactionDate]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID
	WHERE [ProBase].[ProductNumber] = 'CA-1098';

--- ### #############################################################################################
--- ### ##  GENERACION DE SELECT EL OPERADOR CONDICIONAL UTILIZADO ESTA DIRECTO EN EL INNER JOIN
--- ### ##  La consulta selecciona las siguientes columnas de las tablas:
--- ### ## [ProBase].[ProductNumber]
--- ### ## [ProBase].[Name]
--- ### ## [ProBase].[Color]
--- ### ## [TraProd].[Quantity]
--- ### ## [TraProd].[ActualCost]
--- ### ## [TraProd].[TransactionDate]
--- ### ## La cláusula WHERE en esta consulta incluye dos condiciones:
--- ### ## [ProBase].[ProductNumber] = 'CA-1098': Esta condición filtra los registros en los 
--- ### ## que el valor de la columna ProductNumber de la tabla Product es igual a 'CA-1098'.
--- ### ## ([TraProd].[ReferenceOrderLineID] = 11 OR [TraProd].[ReferenceOrderLineID] = 6): 
--- ### ## Esta condición filtra los registros en los que el valor de la columna ReferenceOrderLineID 
--- ### ## de la tabla TransactionHistoryArchive es igual a 11 o 6.
--- ### #############################################################################################
---(131)

---------------------------------------
--- COMPARACION CADENA DE CARACTERES 
--- SENTENCIA "AND" / "OR"  
---------------------------------------

  SELECT 
	  [ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,[ProBase].[Color]
    ,[TraProd].[Quantity]
    ,[TraProd].[ActualCost]
    ,[TraProd].[TransactionDate]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID  
		AND  [ProBase].[ProductNumber] = 'CA-1098' 
		AND  ([TraProd].[ReferenceOrderLineID] = 11 OR [TraProd].[ReferenceOrderLineID] = 6 );

-- ### #############################################################################################
-- ### ##  GENERACION DE SELECT EL OPERADOR CONDICIONAL UTILIZADO  WHERE 
-- ### ## La consulta selecciona las siguientes columnas de las tablas:
-- ### ## [ProBase].[ProductNumber]
-- ### ## [ProBase].[Name]
-- ### ## [ProBase].[Color]
-- ### ## [TraProd].[Quantity]
-- ### ## [TraProd].[ActualCost]
-- ### ## [TraProd].[TransactionDate]
-- ### ## La cláusula WHERE en esta consulta incluye dos condiciones:
-- ### ## [ProBase].[ProductNumber] = 'CA-1098': Esta condición filtra los registros en los que el 
-- ### ## valor de la columna ProductNumber de la tabla Product es igual a 'CA-1098'.
-- ### ## ([TraProd].[ReferenceOrderLineID] = 11 OR [TraProd].[ReferenceOrderLineID] = 6): 
-- ### ## Esta condición filtra los registros en los que el valor de la columna ReferenceOrderLineID 
-- ### ## de la tabla TransactionHistoryArchive es igual a 11 o 6.
-- ### ## En resumen, esta consulta SQL selecciona datos de dos tablas basados en dos condiciones 
-- ### ## de filtro que se encuentran en la cláusula WHERE: el número de producto debe ser igual a 
-- ### ## 'CA-1098' y la columna ReferenceOrderLineID debe ser igual a 11 o 6.
-- ### #############################################################################################
---(132)

  ---------------------------------------
  --- COMPARACION CADENA DE CARACTERES 
  --- SENTECIA "AND" / "OR"  
  ---------------------------------------

  SELECT 
	  [ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,[ProBase].[Color]
    ,[TraProd].[Quantity]
    ,[TraProd].[ActualCost]
    ,[TraProd].[TransactionDate]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID  
  WHERE [ProBase].[ProductNumber] = 'CA-1098' 
		AND  ([TraProd].[ReferenceOrderLineID] = 11 OR [TraProd].[ReferenceOrderLineID] = 6 )


-- ### ## ###########################################################################################
-- ### ## SELECT CON  CONDICIONAL COMPARACION CON CADENA DE CARACTERES CON UN IN
-- ### ## ###########################################################################################
-- ### ## ###########################################################################################
---(133)
  ------------------------------------------
  --- COMPARACION CADENA DE CARACTERES IN
  ------------------------------------------

  SELECT 
	  [ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,[ProBase].[Color]
    ,[TraProd].[Quantity]
    ,[TraProd].[ActualCost]
    ,[TraProd].[TransactionDate]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID  
  WHERE  [ProBase].[ProductNumber] IN('HJ-1213','AR-5381','HJ-1220','SP-2981', 'BE-2908', 'RM-R800');

-- ### ## ###########################################################################################
-- ### ## SELECT CON  CONDICIONAL COMPARACION CON CADENA DE CARACTERES CON UN IN COMPLEMANTEDO 
-- ### ## CON UNA NEGACION UN "NOT"
-- ### ## ###########################################################################################
-- ### ## ###########################################################################################
---(134)

  ------------------------------------------
  --- COMPARACION CADENA DE CARACTERES IN
  --- COMPLEMENTADO CON UN NOT
  ------------------------------------------

  SELECT 
	  [ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,[ProBase].[Color]
    ,[TraProd].[Quantity]
    ,[TraProd].[ActualCost]
    ,[TraProd].[TransactionDate]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID  
  WHERE NOT([ProBase].[ProductNumber] IN('HJ-1213','AR-5381','HJ-1220','SP-2981', 'BE-2908', 'RM-R800'));

-- ### ## ###########################################################################################
-- ### ## SELECT CON  CONDICIONAL COMPARACION CON CADENA DE CARACTERES CON UN IN COMPLEMANTEDO 
-- ### ## CON UNA NEGACION UN "NOT"  Y UN IS NULL
-- ### ## ###########################################################################################
-- ### ## ###########################################################################################
---(135)

  ------------------------------------------
  --- COMPARACION CADENA DE CARACTERES IN
  --- COMPLEMENTADO CON UN NOT Y IS NULL
  ------------------------------------------

  SELECT 
	  [ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,[ProBase].[Color]
    ,[TraProd].[Quantity]
    ,[TraProd].[ActualCost]
    ,[TraProd].[TransactionDate]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID  
  WHERE NOT([ProBase].[ProductNumber] IN('HJ-1213','AR-5381','HJ-1220','SP-2981', 'BE-2908', 'RM-R800'))
     AND [ProBase].[Color] IS NULL;

-- ### ## ###########################################################################################
-- ### ## SELECT CON  CONDICIONAL COMPARACION CON CADENA DE CARACTERES CON UN IN COMPLEMANTEDO 
-- ### ## CON UNA NEGACION UN "NOT", UN IS NULL Y JUEGO CON PARENTESIS
-- ### ## ###########################################################################################
-- ### ## ###########################################################################################
---(136)


  ----------------------------------------------
  --- COMPARACION CADENA DE CARACTERES IN
  --- COMPLEMENTADO CON UN NOT Y NOT - IS NULL
  ----------------------------------------------

SELECT 
	  [ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,[ProBase].[Color]
    ,[TraProd].[Quantity]
    ,[TraProd].[ActualCost]
    ,[TraProd].[TransactionDate]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID  
  WHERE NOT([ProBase].[ProductNumber] IN('HJ-1213','AR-5381','HJ-1220','SP-2981', 'BE-2908', 'RM-R800'))
     AND NOT([ProBase].[Color] IS NULL);

---(137)

SELECT 
	  [ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,[ProBase].[Color]
    ,[TraProd].[Quantity]
    ,[TraProd].[ActualCost]
    ,[TraProd].[TransactionDate]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID  
  WHERE NOT([ProBase].[ProductNumber] IN('HJ-1213','AR-5381','HJ-1220','SP-2981', 'BE-2908', 'RM-R800'))
     AND [ProBase].[Color] IS NOT NULL;

