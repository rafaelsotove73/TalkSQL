
 USE AdventureWorks2016_EXT


SELECT 
IIF([HRvE].[Gender] = 'F', 'FEMALE','MALE') [Gender]
,[NaDpto].[Name] [Sub.Dpto]
,[NaDpto].GroupName [Dpto]
,count([NaDpto].[Name]) [No.EmployeePerson]
FROM HumanResources.vEmployeePersonTemporalInfo [HRvE] 
INNER JOIN [HumanResources].EmployeeDepartmentHistory [BDpto] 
    ON [BDpto].BusinessEntityID = [HRvE].BusinessEntityID
INNER JOIN [HumanResources].[Department] [NaDpto] 
    ON [NaDpto].DepartmentID = [BDpto].DepartmentID
group by
[HRvE].[Gender]
,[NaDpto].[Name]
,[NaDpto].GroupName;



SELECT * FROM [HumanResources].[Department] [NaDpto]; 



--- AREA DE INVESTIGACION Y DESARROLLO  ---->  AREA A
--- Research and Development,Research and Development

--- AREA DE VENTAS Y ESTUDIO DE MERCADO ---->  AREA B
--- Sales and Marketing, Sales and Marketing, Quality Assurance

--- AREA DE PRODUCCION                  ---->  AREA C
--- Inventory Management, Manufacturing

--- ADMINISTRACION Y CONTROL DE RECURSOS  ---->  AREA C
--- Executive General and Administration


---------------------------------------------------
SELECT * FROM HumanResources.vEmployeePersonTemporalInfo;
