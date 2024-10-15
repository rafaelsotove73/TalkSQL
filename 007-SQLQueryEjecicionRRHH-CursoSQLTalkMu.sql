--### #####################################
--### GENERAR LISTADO DE NOMBRE EMPLEADO, 
--### GENERO,CARGO,  SUB DEPARTAMENTO Y DEPARTAMENTO
--### #####################################

--- ####################################################
--  ### employe for departament and group departament
--- ###################################################
---(48)

SELECT 
[HRvE].FirstName
,[HRvE].LastName
,[HRvE].[MaritalStatus]
,[InEmp].JobTitle 
,[NaDpto].[Name] [Sub.Dpto]
,[NaDpto].GroupName [Dpto]
FROM HumanResources.vEmployeePersonTemporalInfo [HRvE] 
INNER JOIN [HumanResources].EmployeeDepartmentHistory [BDpto] 
    ON [BDpto].BusinessEntityID = [HRvE].BusinessEntityID
INNER JOIN .[HumanResources].[Department] [NaDpto] 
    ON [NaDpto].DepartmentID = [BDpto].DepartmentID
INNER JOIN [HumanResources].[Employee] [InEmp] 
    ON [InEmp].BusinessEntityID = [HRvE].BusinessEntityID;

--- ##########################################################
--  ### count employee for departament and group departament
--- ##########################################################
---(49)

SELECT 
 [NaDpto].[Name] [Sub.Dpto]
,[NaDpto].GroupName [Dpto]
,count([NaDpto].[Name]) [No.EmployeePerson]
FROM HumanResources.vEmployeePersonTemporalInfo [HRvE] 
INNER JOIN [HumanResources].EmployeeDepartmentHistory [BDpto] 
    ON [BDpto].BusinessEntityID = [HRvE].BusinessEntityID
INNER JOIN .[HumanResources].[Department] [NaDpto] 
    ON [NaDpto].DepartmentID = [BDpto].DepartmentID
GROUP BY [NaDpto].[Name]
,[NaDpto].GroupName
ORDER BY [NaDpto].GroupName;


--- #############################################################
--  ### count employee gender for departament and group departament 
--- #############################################################
---(50)

SELECT 
IIF([HRvE].[MaritalStatus] = 'S', 'SOLTERO(A)','CASADO(O)') [Gender]
,[NaDpto].[Name] [Sub.Dpto]
,[NaDpto].GroupName [Dpto]
,count([NaDpto].[Name]) [No.EmployeePerson]
FROM HumanResources.vEmployeePersonTemporalInfo [HRvE] 
INNER JOIN [HumanResources].EmployeeDepartmentHistory [BDpto] 
    ON [BDpto].BusinessEntityID = [HRvE].BusinessEntityID
INNER JOIN [HumanResources].[Department] [NaDpto] 
    ON [NaDpto].DepartmentID = [BDpto].DepartmentID
group by
[HRvE].[MaritalStatus]
,[NaDpto].[Name]
,[NaDpto].GroupName;



--- ##########################################################
--  ### count employee gender for departament and group departament 
--  ### en una sola columna "COUNT" - "CASE"
--- ##########################################################
---(51)


SELECT 
    [NaDpto].GroupName AS [Dpto],
    [NaDpto].[Name] AS [Sub.Dpto],
    COUNT(CASE 
          WHEN [HRvE].[MaritalStatus] = 'M' 
            THEN 1  END) AS [No.EmployeePerson.Marrier],
    COUNT(CASE 
          WHEN [HRvE].[MaritalStatus] = 'S' THEN 1 END) AS [No.EmployeePerson.Single],
    COUNT([NaDpto].[Name]) AS [No.EmployeePerson]
FROM 
    [HumanResources].vEmployeePersonTemporalInfo [HRvE] 
    INNER JOIN [HumanResources].EmployeeDepartmentHistory [BDpto] 
        ON [BDpto].BusinessEntityID = [HRvE].BusinessEntityID
    INNER JOIN [HumanResources].[Department] [NaDpto] 
        ON [NaDpto].DepartmentID = [BDpto].DepartmentID
GROUP BY 
    [NaDpto].GroupName,
    [NaDpto].[Name]

--- ##########################################################
--  ### count employee gender for departament and group departament 
--  ### en una sola columna COUNT -- "IF"
--- ##########################################################
---(52)


SELECT 
    [NaDpto].GroupName AS [Dpto],
    [NaDpto].[Name] AS [Sub.Dpto],
    COUNT(IIF ([HRvE].[MaritalStatus] = 'M',1,0) ) AS [No.EmployeePerson.Marrier],
    COUNT(IIF ([HRvE].[MaritalStatus] = 'S',1,0) ) AS [No.EmployeePerson.Single],
    COUNT([NaDpto].[Name]) AS [No.EmployeePerson]
FROM 
    [HumanResources].vEmployeePersonTemporalInfo [HRvE] 
    INNER JOIN [HumanResources].EmployeeDepartmentHistory [BDpto] 
        ON [BDpto].BusinessEntityID = [HRvE].BusinessEntityID
    INNER JOIN [HumanResources].[Department] [NaDpto] 
        ON [NaDpto].DepartmentID = [BDpto].DepartmentID
GROUP BY 
    [NaDpto].GroupName,
    [NaDpto].[Name]

