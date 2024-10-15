--- #############################################
--- ### PREGUNTA NRO 10
--- #############################################


DECLARE @VMayCAnaliticaMS TABLE(
    IdAnaly int IDENTITY(1,1),
	[VBusinessEntityID] INTEGER,
    [vRateChangeDate] [datetime],
	[vRate] [money],
	[vPayFrequency] [tinyint]
)

--SELECT [BusinessEntityID]
--      ,[RateChangeDate]
--      ,[Rate]
--      ,[PayFrequency]
--      ,[ModifiedDate]
--  FROM [AdventureWorks2016_EXT].[HumanResources].[EmployeePayHistory]

  INSERT INTO @VMayCAnaliticaMS 
        ([VBusinessEntityID], [vRateChangeDate],[vRate],[vPayFrequency])
  SELECT [BusinessEntityID], [RateChangeDate], [Rate],[PayFrequency] 
  FROM [AdventureWorks2016_EXT].[HumanResources].[EmployeePayHistory]

  UPDATE @VMayCAnaliticaMS
  SET [VPayFrequency] = 30

  SELECT [VBusinessEntityID],
    [vRateChangeDate],
	[vRate] [money],
	[vPayFrequency],
	(([vRate]*8)*[vPayFrequency]) [PayMonth]
FROM @VMayCAnaliticaMS

--- ##############################################
--- mone cantidad por hora, se multiplica 
--- por 8 horas al dia por 30 dias
--- ##############################################


  ---SELECT * FROM @VMayCAnaliticaMS



