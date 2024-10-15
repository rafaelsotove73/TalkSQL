--- #############################################
--- ### PREGUNTA NRO 10
--- #############################################
---(60)
USE AdventureWorks2016_EXT

DECLARE @TempMenory_EmployeePayHistory TABLE(
    IdAnaly int IDENTITY(1,1),
	[VBusinessEntityID] INTEGER,
	[vRate] [money],
	[vPayFrequency] [tinyint]
)


PRINT('INSERT INTO')

  INSERT INTO @TempMenory_EmployeePayHistory 
        ([VBusinessEntityID], [vRate],[vPayFrequency])
  SELECT [BusinessEntityID],  [Rate],[PayFrequency] 
  FROM [AdventureWorks2016_EXT].[HumanResources].[EmployeePayHistory]

---(61)
PRINT('UPDATE')

  UPDATE @TempMenory_EmployeePayHistory
  SET [VPayFrequency] = 30
  
PRINT('SELECT ORIGINAL')

SELECT * FROM @TempMenory_EmployeePayHistory

PRINT('PRIMER SELECT SIN FORMATO')

  SELECT [TMemory].[VBusinessEntityID]
    ,[HRvE].FirstName 
	,[HRvE].LastName 
	,[HRvE].JobTitle 
	,[TMemory].[vRate] [PayHours]
	,[TMemory].[vPayFrequency]
	,(([TMemory].[vRate]*8)*[TMemory].[vPayFrequency]) [PayMonth]
FROM @TempMenory_EmployeePayHistory [TMemory]
FULL JOIN HumanResources.vEmployeePersonTemporalInfo [HRvE] ON [HRvE].BusinessEntityID = [TMemory].VBusinessEntityID 

PRINT('SEGUNDO SELECT CON FORMATO FORMATO')

SELECT [TMemory].[VBusinessEntityID]
    ,[HRvE].FirstName 
	,[HRvE].LastName 
	,[HRvE].JobTitle 
	,FORMAT([TMemory].[vRate], 'N', 'de-de') [PayHours] 
	,FORMAT([TMemory].[vPayFrequency], 'N', 'de-de') [vPayFrequency]
	,FORMAT((([TMemory].[vRate]*8)*[TMemory].[vPayFrequency]), 'N', 'de-de') [PayMonth]
FROM @TempMenory_EmployeePayHistory [TMemory]
FULL JOIN HumanResources.vEmployeePersonTemporalInfo [HRvE] ON [HRvE].BusinessEntityID = [TMemory].VBusinessEntityID 

---### DELETE NO ACEPTA ALIAS

PRINT('EJECUTO DELETE')

---(62)
DELETE  FROM @TempMenory_EmployeePayHistory WHERE [vRate] = 25

PRINT('ULTIMO SELECT')

SELECT * FROM @TempMenory_EmployeePayHistory




