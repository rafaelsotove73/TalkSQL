SELECT 
[NaDpto].[Name] [Dpto.Name]
,count([NaDpto].[Name]) [No.EmployeePerson]
FROM HumanResources.vEmployeePersonTemporalInfo [HRvE] 
INNER JOIN [HumanResources].EmployeeDepartmentHistory [BDpto] ON [BDpto].BusinessEntityID = [HRvE].BusinessEntityID
INNER JOIN .[HumanResources].[Department] [NaDpto] ON [NaDpto].DepartmentID = [BDpto].DepartmentID
group by
[NaDpto].[Name]
