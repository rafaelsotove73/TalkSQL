 --- ######################################################
 --- ###  CUANTOS EMPLEADOS EN LA ORGANIZACION TIENE ENTRE
 --- ### 10 Y 12 A�OS, ENTRE 13 Y 15 Y MAS DE 16
 --- ######################################################
 ---(46)

 USE AdventureWorks2016_EXT
 
 SELECT 
	[HRvE].FirstName
	,[HRvE].LastName
---	,[HRvE].[Gender]
	,[InEmp].[NationalIDNumber]
	,[InEmp].[JobTitle]
	,CONVERT(date,[InEmp].[HireDate],103) [HireDate]
	,(DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) [Antiquity.Date]
	,CASE 
           WHEN (DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) >= 10 AND (DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) <=12  
           THEN '10-12'
           WHEN (DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) >= 13 AND (DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) <=15  
           THEN '13-15'
           ELSE '>16'
       END [detail.Ant]
	FROM HumanResources.vEmployeePersonTemporalInfo [HRvE] 
	INNER JOIN [HumanResources].[Employee] [InEmp] ON [InEmp].BusinessEntityID = [HRvE].BusinessEntityID


 --- ######################################################
 --- ###  SUMATORIA
 --- ###  10 Y 12 A�OS, ENTRE 13 Y 15 Y MAS DE 16
 --- ######################################################
 ---(47)

SELECT 
	CASE 
           WHEN (DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) >= 10 AND (DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) <=12  
           THEN '10-12'
           WHEN (DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) >= 13 AND (DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) <=15  
           THEN '13-15'
           ELSE '>16'
       END [Antiquity.Label]
	   ,count(*) [Antiquity.Employee]
	FROM HumanResources.vEmployeePersonTemporalInfo [HRvE] 
	INNER JOIN [HumanResources].[Employee] [InEmp] ON [InEmp].BusinessEntityID = [HRvE].BusinessEntityID
	group by CASE 
           WHEN (DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) >= 10 AND (DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) <=12  
           THEN '10-12'
           WHEN (DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) >= 13 AND (DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) <=15  
           THEN '13-15'
           ELSE '>16'
       END

 --- ######################################################
 --- ###  SUMATORIA
 --- ###  10 Y 12 A�OS, ENTRE 13 Y 15 Y MAS DE 16
 --- ###  BETWEEN
 --- ######################################################
 ---(48)

SELECT 
    CASE 
        WHEN YEAR(GETDATE()) - YEAR([InEmp].[HireDate]) BETWEEN 10 AND 12 THEN '10-12'
        WHEN YEAR(GETDATE()) - YEAR([InEmp].[HireDate]) BETWEEN 13 AND 15 THEN '13-15'
        ELSE '>16'
    END AS [Antiquity.Label],
    COUNT(*) AS [Antiquity.Employee]
FROM 
    [HumanResources].vEmployeePersonTemporalInfo [HRvE] 
    INNER JOIN [HumanResources].[Employee] [InEmp] ON [InEmp].BusinessEntityID = [HRvE].BusinessEntityID
GROUP BY 
    CASE 
        WHEN YEAR(GETDATE()) - YEAR([InEmp].[HireDate]) BETWEEN 10 AND 12 THEN '10-12'
        WHEN YEAR(GETDATE()) - YEAR([InEmp].[HireDate]) BETWEEN 13 AND 15 THEN '13-15'
        ELSE '>16'
    END

 --- ######################################################
 --- ###  SUMATORIA OPTIMIZADO
 --- ###  10 Y 12 A�OS, ENTRE 13 Y 15 Y MAS DE 16
 --- ###  BETWEEN
 --- ######################################################
 ---(49)


SELECT 
    CASE 
        WHEN Antiquity BETWEEN 10 AND 12 THEN '10-12'
        WHEN Antiquity BETWEEN 13 AND 15 THEN '13-15'
        ELSE '>16'
    END AS [Antiquity.Label],
    COUNT(*) AS [Antiquity.Employee]
FROM 
    (
        SELECT 
            [InEmp].[BusinessEntityID],
            YEAR(GETDATE()) - YEAR([InEmp].[HireDate]) AS [Antiquity]
        FROM 
            [HumanResources].[Employee] [InEmp]
    ) [DerivedTable]
    INNER JOIN [HumanResources].vEmployeePersonTemporalInfo [HRvE] ON [HRvE].BusinessEntityID = [DerivedTable].BusinessEntityID
GROUP BY 
    CASE 
        WHEN Antiquity BETWEEN 10 AND 12 THEN '10-12'
        WHEN Antiquity BETWEEN 13 AND 15 THEN '13-15'
        ELSE '>16'
    END


    ---------------------------------
    --- DATEPART()
    ---------------------------------
    ---(50)

    SELECT 
	[HRvE].FirstName
	,[HRvE].LastName
	,[InEmp].[JobTitle]
	,CONVERT(date,[InEmp].[HireDate],103) [HireDate]
    ,DATEPART(Day, [InEmp].[HireDate]) [IN.Date.Day]
    ,DATEPART(MONTH, [InEmp].[HireDate]) [IN.Date.Month]
    ,DATEPART(YEAR, [InEmp].[HireDate]) [IN.Date.Year]
	,(DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) [Antiquity.Date]
	FROM HumanResources.vEmployeePersonTemporalInfo [HRvE] 
	INNER JOIN [HumanResources].[Employee] [InEmp] ON [InEmp].BusinessEntityID = [HRvE].BusinessEntityID


   SET LANGUAGE 'English' ----> RESULTADO DE LENGUAJES
   ---(51)

    SELECT 
	[HRvE].FirstName
	,[HRvE].LastName
	,[InEmp].[JobTitle]
	,CONVERT(date,[InEmp].[HireDate],103) [HireDate]
    ,DATEPART(Day, [InEmp].[HireDate]) [IN.Date.Day]
    ,DATEPART(MONTH, [InEmp].[HireDate]) [IN.Date.Month]
    ,LEFT(DATENAME(month, DATEADD(month,DATEPART(MONTH, [InEmp].[HireDate]) - 1, '1900-01-01')), 3) AS MesTextoAbreviado
    ,DATEPART(YEAR, [InEmp].[HireDate]) [IN.Date.Year]
	,(DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) [Antiquity.Date]
	FROM HumanResources.vEmployeePersonTemporalInfo [HRvE] 
	INNER JOIN [HumanResources].[Employee] [InEmp] ON [InEmp].BusinessEntityID = [HRvE].BusinessEntityID





    /*
    ##############################################################################################
    ===> DATEPART(MONTH, [InEmp].[HireDate]): La función DATEPART() 
    se utiliza para extraer el número del mes de la columna [HireDate] en la tabla 
    [InEmp] (suponiendo que esa es la estructura de tu consulta). Esto devuelve el número 
    del mes correspondiente a la fecha de contratación.
   
    ===> DATEFROMPARTS(2000, DATEPART(MONTH, [InEmp].[HireDate]), 1): Utilizando el número 
    del mes obtenido anteriormente, la función DATEFROMPARTS() crea una nueva fecha en la que el 
    año se establece en 2000, el mes se establece en el número extraído y el día se establece en 1. 
    Esto crea una fecha específica en el año 2000 con el mes correspondiente al número obtenido.
   
    ===> FORMAT(DATEFROMPARTS(2000, DATEPART(MONTH, [InEmp].[HireDate]), 1), 'MMMM'): La función 
    FORMAT() se utiliza para formatear la fecha obtenida anteriormente en el formato 'MMMM', 
    que representa el nombre completo del mes. Esto convierte la fecha en el nombre del mes 
    correspondiente.

     ===> AS MesTexto: Esta cláusula establece el alias "MesTexto" para el resultado obtenido, 
     que es el nombre completo del mes.

    SET LANGUAGE 'English'

    SELECT FORMAT(DATEFROMPARTS(2000, MesNumero, 1), 'MMMM') AS MesTexto
    FROM TuTabla
    ###############################################################################################
    */

    ---(52)

    SELECT 
	[HRvE].FirstName
	,[HRvE].LastName
	,[InEmp].[JobTitle]
	,CONVERT(date,[InEmp].[HireDate],103) [HireDate]
    ,DATEPART(Day, [InEmp].[HireDate]) [IN.Date.Day]
    ,DATEPART(MONTH, [InEmp].[HireDate]) [IN.Date.Month]
    ,FORMAT(DATEFROMPARTS(DATEPART(YEAR, [InEmp].[HireDate]), DATEPART(MONTH, [InEmp].[HireDate]), 1), 'MMMM') AS MesTexto
    ,DATEPART(YEAR, [InEmp].[HireDate]) [IN.Date.Year]
	,(DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) [Antiquity.Date]
	FROM HumanResources.vEmployeePersonTemporalInfo [HRvE] 
	INNER JOIN [HumanResources].[Employee] [InEmp] ON [InEmp].BusinessEntityID = [HRvE].BusinessEntityID



    SET LANGUAGE 'Spanish' ----> RESULTADO DE LENGUAJES
    ---(53)

    SELECT 
	[HRvE].FirstName
	,[HRvE].LastName
	,[InEmp].[JobTitle]
	,CONVERT(date,[InEmp].[HireDate],103) [HireDate]
    ,DATEPART(Day, [InEmp].[HireDate]) [IN.Date.Day]
    ,DATEPART(MONTH, [InEmp].[HireDate]) [IN.Date.Month]
    ,LEFT(DATENAME(month, DATEADD(month,DATEPART(MONTH, [InEmp].[HireDate]) - 1, '1900-01-01')), 3) AS MesTextoAbreviado
    ,DATEPART(YEAR, [InEmp].[HireDate]) [IN.Date.Year]
	,(DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) [Antiquity.Date]
	FROM HumanResources.vEmployeePersonTemporalInfo [HRvE] 
	INNER JOIN [HumanResources].[Employee] [InEmp] ON [InEmp].BusinessEntityID = [HRvE].BusinessEntityID



    /*
    ###########################################################################################
    ###########################################################################################

    ===> DATEPART(MONTH, [InEmp].[HireDate]): La función DATEPART() 
    se utiliza para extraer el número del mes de la columna [HireDate] en la tabla 
    [InEmp] (suponiendo que esa es la estructura de tu consulta). Esto devuelve el número 
    del mes correspondiente a la fecha de contratación.
   
    ===> DATEFROMPARTS(2000, DATEPART(MONTH, [InEmp].[HireDate]), 1): Utilizando el número 
    del mes obtenido anteriormente, la función DATEFROMPARTS() crea una nueva fecha en la que el 
    año se establece en 2000, el mes se establece en el número extraído y el día se establece en 1. 
    Esto crea una fecha específica en el año 2000 con el mes correspondiente al número obtenido.
   
    ===> FORMAT(DATEFROMPARTS(2000, DATEPART(MONTH, [InEmp].[HireDate]), 1), 'MMMM'): La función 
    FORMAT() se utiliza para formatear la fecha obtenida anteriormente en el formato 'MMMM', 
    que representa el nombre completo del mes. Esto convierte la fecha en el nombre del mes 
    correspondiente.

     ===> AS MesTexto: Esta cláusula establece el alias "MesTexto" para el resultado obtenido, 
     que es el nombre completo del mes.

    SET LANGUAGE 'English'

    SELECT FORMAT(DATEFROMPARTS(2000, MesNumero, 1), 'MMMM') AS MesTexto
    FROM TuTabla

    ###############################################################################################
    ###############################################################################################
    */

    ---(54)

    SELECT 
	[HRvE].FirstName
	,[HRvE].LastName
	,[InEmp].[JobTitle]
	,CONVERT(date,[InEmp].[HireDate],103) [HireDate]
    ,DATEPART(Day, [InEmp].[HireDate]) [IN.Date.Day]
    ,DATEPART(MONTH, [InEmp].[HireDate]) [IN.Date.Month]
    ,FORMAT(DATEFROMPARTS(DATEPART(YEAR, [InEmp].[HireDate]), DATEPART(MONTH, [InEmp].[HireDate]), 1), 'MMMM') AS MesTexto
    ,DATEPART(YEAR, [InEmp].[HireDate]) [IN.Date.Year]
	,(DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) [Antiquity.Date]
	FROM HumanResources.vEmployeePersonTemporalInfo [HRvE] 
	INNER JOIN [HumanResources].[Employee] [InEmp] ON [InEmp].BusinessEntityID = [HRvE].BusinessEntityID

    --- #############################################################################################
    --- ###  REEMPLAZO  DATEPART POR SOLO LA FUNCION YEAR() / MONTH() / DAY()
    --- #############################################################################################

    ---(55)

    SELECT 
	[HRvE].FirstName
	,[HRvE].LastName
	,[InEmp].[JobTitle]
	,CONVERT(date,[InEmp].[HireDate],103) [HireDate]
    ,DAY([InEmp].[HireDate]) [IN.Date.Day]
    ,MONTH([InEmp].[HireDate]) [IN.Date.Month]
    ,YEAR([InEmp].[HireDate]) [IN.Date.Year]
    ,FORMAT(DATEFROMPARTS(DATEPART(YEAR, [InEmp].[HireDate]), DATEPART(MONTH, [InEmp].[HireDate]), 1), 'MMMM') AS MesTexto
	,(DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) [Antiquity.Date]
	FROM HumanResources.vEmployeePersonTemporalInfo [HRvE] 
	INNER JOIN [HumanResources].[Employee] [InEmp] ON [InEmp].BusinessEntityID = [HRvE].BusinessEntityID

