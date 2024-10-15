---##################################################
---### ANTIGUEDAD POR EMPLEADO, FECHA DE CONTRARACION 
---### Y PROMOCION POR A�OS DE ANTIGUEDAD
---##################################################

------------------------------------------------------
-- TABLE Employee  ===> TABLE THE BEGIN
------------------------------------------------------
---(44)

SELECT [BusinessEntityID]
      ,[NationalIDNumber]
      ,[LoginID]
      ,[OrganizationNode]
      ,[OrganizationLevel]
      ,[JobTitle]
      ,[BirthDate]
      ,[MaritalStatus]
      ---,[Gender]
      ,[HireDate]
      ,[SalariedFlag]
      ,[VacationHours]
      ,[SickLeaveHours]
      ,[CurrentFlag]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2016_EXT].[HumanResources].[Employee];

  ---  ############################


  SELECT * FROM [AdventureWorks2016_EXT].[HumanResources].[Employee];

  --- ### ################################################
  --- ### QUERY IN DEVELOPER  STEP 1
  --- ### DATA: BASIC
  --- ### NOMBRE, APELLIDO, GENERO, ID-NACIONAL, 
  --- ### CARGO OCUPADO, FECHA CONTRATACION, ANTIGUEDAD
  --- ### ################################################
  ---(45)

  SELECT 
	 [HRvE].FirstName
	,[HRvE].LastName
	,[HRvE].[MaritalStatus]
	,[InEmp].[NationalIDNumber]                                            ---> CEDULA
	,[InEmp].[JobTitle]                                                    ---> CARGO
	,convert(date,[InEmp].[HireDate],103) [HireDate]                       ---> FECHA CONTRATACION
	,(DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) [Antiquity.Date]     ---> ANTIGUEDAD EN A�OS
	FROM HumanResources.vEmployeePersonTemporalInfo [HRvE] 
	INNER JOIN [HumanResources].[Employee] [InEmp] 
  ON [InEmp].BusinessEntityID = [HRvE].BusinessEntityID;

  --- ### ################################################
  --- ### QUERY IN DEVELOPER  STEP 2
  --- ### DATA: BASIC
  --- ### NOMBRE, APELLIDO, MaritalStatus, ID-NACIONAL, 
  --- ### CARGO OCUPADO, FECHA CONTRATACION, ANTIGUEDAD
  --- ### CON ANTIGUEDAD MAYOR O IGUAL A 15 PARA PROMOCION
  --- ### MENOR SIN PPROMOCION
  --- ### ################################################
  ---(46)

	SELECT 
	[HRvE].FirstName
	,[HRvE].LastName
	,[HRvE].[MaritalStatus]
	,[InEmp].[NationalIDNumber]
	,[InEmp].[JobTitle]
	,convert(date,[InEmp].[HireDate],103) [HireDate]
	,(DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) [Antiquity.DateYear]
	,IIF ((DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) >= 15,'PROMOTION','NO PROMOTION') [ACTION]
	FROM HumanResources.vEmployeePersonTemporalInfo [HRvE] 
	INNER JOIN [HumanResources].[Employee] [InEmp] 
  ON [InEmp].BusinessEntityID = [HRvE].BusinessEntityID;

  --- ### ################################################
  --- ### QUERY IN DEVELOPER  STEP 3, VARIANTE
  --- ### DATA: BASIC
  --- ### NOMBRE, APELLIDO, MaritalStatus, ID-NACIONAL, 
  --- ### CARGO OCUPADO, FECHA CONTRATACION, ANTIGUEDAD
  --- ### CON ATIGUEDAD MAYOR O IGUAL A 15 PARA PROMOCION
  --- ### MENOR SIN PPROMOCION, CALCULO DE ANTIGUEDAD EN
  --- ### DIAS Y MESES
  --- ### ################################################
  ---(47)


	SELECT 
	[HRvE].FirstName
	,[HRvE].LastName
	,[HRvE].[MaritalStatus]
	,[InEmp].[NationalIDNumber]
	,[InEmp].[JobTitle]
	,convert(date,[InEmp].[HireDate],103) [HireDate]
	,(DATEDIFF (DAY, [InEmp].[HireDate], GETDATE())) [Antiquity.DateDay]
	,(DATEDIFF (MONTH, [InEmp].[HireDate], GETDATE())) [Antiquity.DateMonth]
	,(DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) [Antiquity.DateYear]
	, IIF ((DATEDIFF (YEAR, [InEmp].[HireDate], GETDATE())) >= 15,'PROMOTION','NO PROMOTION') [ACTION]
	FROM HumanResources.vEmployeePersonTemporalInfo [HRvE] 
	INNER JOIN [HumanResources].[Employee] [InEmp] 
  ON [InEmp].BusinessEntityID = [HRvE].BusinessEntityID;
