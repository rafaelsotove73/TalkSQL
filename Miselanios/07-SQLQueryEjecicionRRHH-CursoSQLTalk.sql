 -----------------------------------
 --- Employee + JobTitle With Where
 ----------------------------------
 
 SELECT 
	[HRvE].FirstName
	,[HRvE].LastName
	,[HRvE].[Gender]
	,[InEmp].[NationalIDNumber]
	,[InEmp].[JobTitle]
	FROM HumanResources.vEmployeePersonTemporalInfo [HRvE], [HumanResources].[Employee] [InEmp]
	WHERE [InEmp].BusinessEntityID = [HRvE].BusinessEntityID


 ---------------------------------------
 --- Employee + JobTitle With INNER JOIN
 ---------------------------------------
 
 SELECT 
	[HRvE].FirstName
	,[HRvE].LastName
	,[HRvE].[Gender]
	,[InEmp].[NationalIDNumber]
	,[InEmp].[JobTitle]
	FROM HumanResources.vEmployeePersonTemporalInfo [HRvE] 
	INNER JOIN [HumanResources].[Employee] [InEmp] ON [InEmp].BusinessEntityID = [HRvE].BusinessEntityID

 ----------------------------------------------------
 --- Employee + JobTitle With INNER JOIN + Order by
 ---------------------------------------------------

 SELECT 
	([HRvE].FirstName + [HRvE].LastName) [Full.Name]
	,[HRvE].[Gender]
	,[InEmp].[NationalIDNumber]
	,[InEmp].[JobTitle]
	FROM HumanResources.vEmployeePersonTemporalInfo [HRvE] 
	INNER JOIN [HumanResources].[Employee] [InEmp] ON [InEmp].BusinessEntityID = [HRvE].BusinessEntityID
	order by ([HRvE].FirstName + [HRvE].LastName)