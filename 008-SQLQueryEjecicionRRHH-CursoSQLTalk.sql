
--- ##################################################################
--- ### NRO. DE CONTRATACIONES DE EMPLEADOS POR A�OS
--- ##################################################################
---(45)

-----------------------------
--- Employee x year
-----------------------------

SELECT 
	year([InEmp].[HireDate]) [Year]
	,count([InEmp].[HireDate]) [Employee.Year]
	FROM HumanResources.vEmployeePersonTemporalInfo [HRvE] 
	INNER JOIN [HumanResources].[Employee] [InEmp] ON [InEmp].BusinessEntityID = [HRvE].BusinessEntityID
	group by year([HireDate])

--- ##################################################################
--- ### NRO. DE CONTRATACIONES DE EMPLEADOS POR MES-A�O
--- ##################################################################
---(45)
-----------------------------
--- Employee x Month and year
-----------------------------

SELECT 
	YEAR([InEmp].[HireDate]) [Year]
	,MONTH([InEmp].[HireDate]) [Month]
	,DATENAME (MONTH, DATEADD(MONTH, MONTH([InEmp].[HireDate]) - 1, '1900-01-01')) [MonthStr]
	,COUNT([InEmp].[HireDate]) [Employee.Month]
	FROM HumanResources.vEmployeePersonTemporalInfo [HRvE] 
	INNER JOIN [HumanResources].[Employee] [InEmp] ON [InEmp].BusinessEntityID = [HRvE].BusinessEntityID
	GROUP BY YEAR([HireDate]),MONTH([InEmp].[HireDate])
	ORDER BY YEAR([HireDate]),MONTH([InEmp].[HireDate])

---- =========================================





USE AdventureWorks2016_EXT
  SELECT 
    [TraProd].[TransactionID]
	,[ProBase].[ProductNumber]
	,[ProBase].[Name] 
    ,[TraProd].[TransactionDate]                                                    ----> NATIVO FECHA Y HORA
	,FORMAT(cast(GETDATE() as time), N'hh\.mm') [DateTes02]                         ----> 00.00
    ,FORMAT(cast(GETDATE() as time), N'hh\:mm') [DateTes02.1]                       ----> 00:00
	,FORMAT(SYSDATETIME(), N'hh:mm tt') AS DateTes03                                ----> 00:00 AM
    ,FORMAT(SYSDATETIME(), N'hh:mm t') AS DateTes031                                ----> 00:00 A
	,FORMAT(CAST(SYSDATETIME() AS datetime2), N'HH:mm') [DateTes04]               -- returns 14:00
    ,SYSDATETIME() [DteTime]
    ,GETDATE() [DteTimeGT]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID 
  ORDER BY [TraProd].[TransactionDate]

  ---DATEADD()
  


