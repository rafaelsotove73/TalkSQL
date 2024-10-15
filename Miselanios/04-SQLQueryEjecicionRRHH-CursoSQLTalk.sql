
--- ### #########################################################
--- ###  GENERA EDAD DE EMPLEADO Y SUMINISTRA DATOS BASICOS: 
--- ### CONVERT,RESTA ENTRE FECHAS DATEDIFF, GETDATE, INNER - JOIN
--- ### TRABAJA CON ALIAS DE TABLAS Y CAMPOS
--- ### #########################################################
---(38)
select [HRvE].FirstName 
	  ,[HRvE].LastName
	  ,[HRvE].Gender 
	  ,CONVERT(VARCHAR(10),[HR_ET].BirthDate,103) [BirthDate]
	  ,(DATEDIFF (YEAR, [HR_ET].BirthDate , GETDATE())) [YearBron]
FROM  HumanResources.vEmployeePersonTemporalInfo [HRvE]
inner join HumanResources.Employee_Temporal [HR_ET] 
ON [HR_ET].BusinessEntityID = [HRvE].BusinessEntityID;


-- ## ########################################################
---## ADICIONA UN ORDEN POR EDAD ACENDENTE
-- ## ########################################################
---(39)
select [HRvE].FirstName 
	  ,[HRvE].LastName
	  ,[HRvE].Gender 
	  ,CONVERT(VARCHAR(10),[HR_ET].BirthDate,103) [BirthDate]
	  ,(DATEDIFF (YEAR, [HR_ET].BirthDate , GETDATE())) [YearBron]
FROM  HumanResources.vEmployeePersonTemporalInfo [HRvE]
inner join HumanResources.Employee_Temporal [HR_ET] 
ON [HR_ET].BusinessEntityID = [HRvE].BusinessEntityID
order by (DATEDIFF (YEAR, [HR_ET].BirthDate , GETDATE()));

-- ## ########################################################
---## ADICIONA UNA COLUMNA CON EL A�O DE NACIMIENTO
-- ## ########################################################
---(40)

select [HRvE].FirstName 
	  ,[HRvE].LastName
	  ,[HRvE].Gender 
	  ,CONVERT(VARCHAR(10),[HR_ET].BirthDate,103) [BirthDate]
	  ,year([HR_ET].BirthDate) [year]
	  ,(DATEDIFF (YEAR, [HR_ET].BirthDate , GETDATE())) [YearBron]
FROM  HumanResources.vEmployeePersonTemporalInfo [HRvE]
inner join HumanResources.Employee_Temporal [HR_ET] 
	ON [HR_ET].BusinessEntityID = [HRvE].BusinessEntityID
order by (DATEDIFF (YEAR, [HR_ET].BirthDate , GETDATE()));

---(41)

select [HRvE].FirstName 
	  ,[HRvE].LastName
	  ,[HRvE].Gender 
	  ,CONVERT(VARCHAR(10),[HR_ET].BirthDate,103) [BirthDate]
	  ,year([HR_ET].BirthDate) [year]
	  ,(DATEDIFF (YEAR, [HR_ET].BirthDate , GETDATE())) [YearBron]
FROM  HumanResources.vEmployeePersonTemporalInfo [HRvE]
inner join HumanResources.Employee_Temporal [HR_ET] 
	ON [HR_ET].BusinessEntityID = [HRvE].BusinessEntityID
order by [YearBron];

-- ## ########################################################
---## AGRUPA LOS EMPLEADOS POR EDAD Y TOTALIZA 
---## MUESTRA DE COMENTAR CAMPOS EN UN SELECT
-- ## ########################################################
---(42)

select /*[HRvE].FirstName 
	  ,[HRvE].LastName
	  ,[HRvE].Gender 
	  ,CONVERT(VARCHAR(10),[HR_ET].BirthDate,103) [BirthDate]
	  ,year([HR_ET].BirthDate) [year]*/
	  (DATEDIFF (YEAR, [HR_ET].BirthDate , GETDATE())) [YearBron]
	  ,count(*) 'count employee'
FROM  HumanResources.vEmployeePersonTemporalInfo [HRvE]
inner join HumanResources.Employee_Temporal [HR_ET] 
ON [HR_ET].BusinessEntityID = [HRvE].BusinessEntityID
group by (DATEDIFF (YEAR, [HR_ET].BirthDate , GETDATE()));



-- ## ########################################################
---## AGRUPA LOS EMPLEADOS POR EDAD, GENERO Y TOTALIZA 
-- ## ########################################################
---(43)

select (DATEDIFF (YEAR, [HR_ET].BirthDate , GETDATE())) [YearBron]
      ,[HRvE].Gender [Gender]
	  ,count(*) 'count employee'
FROM  HumanResources.vEmployeePersonTemporalInfo [HRvE]
inner join HumanResources.Employee_Temporal [HR_ET] 
ON [HR_ET].BusinessEntityID = [HRvE].BusinessEntityID
group by [HRvE].Gender, (DATEDIFF (YEAR, [HR_ET].BirthDate , GETDATE()));

