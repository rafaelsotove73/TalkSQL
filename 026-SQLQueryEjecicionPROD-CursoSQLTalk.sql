
--- ## ### ########################################
--- ## ### SELECT DE PRODUCCION POR ZONA O AREA
--- ## ### BASE V1.0
--- ## ### #######################################
--- (156)
USE AdventureWorks2016_EXT

SELECT 
       [WorO].[WorkOrderID]
      ,[WorO].[ProductID]
      ,[WorO].[OperationSequence]
      ,[WorO].[LocationID]
	    ,[loc].[Name] [DescricionLocate] 
      ,[WorO].[ScheduledStartDate]
      ,[WorO].[ScheduledEndDate]
      ,[WorO].[ActualStartDate]
      ,[WorO].[ActualEndDate]
      ,[WorO].[ActualResourceHrs]
      ,[WorO].[PlannedCost]
      ,[WorO].[ActualCost]
      ,[WorO].[ModifiedDate]
  FROM [AdventureWorks2016_EXT].[Production].[WorkOrderRouting][WorO]
  INNER JOIN [Production].[Location] [loc] ON [loc].LocationID = [WorO].LocationID


  --- ########################################
  --- ### AGRUPACION POR LOCATION
  --- ########################################
  --- (157)

  ---Vers 1.1

USE AdventureWorks2016_EXT
  
SELECT [WorO].[WorkOrderID]
      ,[WorO].[ProductID]
      ,[WorO].[OperationSequence]
      ,[WorO].[LocationID]
	  ,[loc].[Name] [DescricionLocate] 
      --,[WorO].[ScheduledStartDate]
      --,[WorO].[ScheduledEndDate]
      --,[WorO].[ActualStartDate]
      --,[WorO].[ActualEndDate]
      ,[WorO].[ActualResourceHrs]
      ,[WorO].[PlannedCost]
      ,[WorO].[ActualCost]
      ---,[WorO].[ModifiedDate]
  FROM [AdventureWorks2016_EXT].[Production].[WorkOrderRouting][WorO]
  INNER JOIN [Production].[Location] [loc] ON [loc].LocationID = [WorO].LocationID

--- ## ### ########################################
--- ## ### SELECT DE PRODUCCION POR ZONA O AREA
--- ## ### BASE V1.2
--- ## ### #######################################
--- (158)

---Vers 1.2

  SELECT 
       [WorO].[OperationSequence]
	    ,[loc].[Name] [DescricionLocate] 
      ,[WorO].[ActualResourceHrs]
      ,[WorO].[PlannedCost]
      ,[WorO].[ActualCost]
  FROM [AdventureWorks2016_EXT].[Production].[WorkOrderRouting][WorO]
  INNER JOIN [Production].[Location] [loc] ON [loc].LocationID = [WorO].LocationID

--- ## ### ######################################################
--- ## ### SELECT DE PRODUCCION POR ZONA O AREA
--- ## ### SUMA CON FORMATO  CON SEPARADOR FORMATO DECIMAL (,)
--- ## ### ######################################################
---         Vers 1.3       
--- (159)

SELECT [WorO].[LocationID]
	    ,[loc].[Name] [DescricionLocate]
	    ,FORMAT(SUM([WorO].[ActualResourceHrs]), 'N', 'de-de') [SumResourceHrs]
	    ,FORMAT(SUM([WorO].[PlannedCost]), 'N', 'de-de') [SumPlannedCost]
	    ,FORMAT(SUM([WorO].[ActualCost]), 'N', 'de-de') [SumActualCost]
FROM [AdventureWorks2016_EXT].[Production].[WorkOrderRouting][WorO]
  INNER JOIN [Production].[Location] [loc] ON [loc].LocationID = [WorO].LocationID
  GROUP BY [WorO].[LocationID]
		      ,[loc].[Name] 

--- 1.106.432,25
---#########


--- ## ### ######################################################
--- ## ### SELECT DE PRODUCCION POR ZONA O AREA
--- ## ### SUMA CON FORMATO CON SEPARADOR FORMATO DECIMAL (.)
--- ## ### ######################################################
---         Vers 1.4       
--- (160)


SELECT [WorO].[LocationID]
	  ,[loc].[Name] [DescricionLocate]
	  ,FORMAT(SUM([WorO].[ActualResourceHrs]), 'C','en-US') [SumResourceHrs]
	  ,FORMAT(SUM([WorO].[PlannedCost]), 'C','en-US') [SumPlannedCost]
	  ,FORMAT(SUM([WorO].[ActualCost]), 'C','en-US') [SumActualCost]
FROM [AdventureWorks2016_EXT].[Production].[WorkOrderRouting][WorO]
INNER JOIN [Production].[Location] [loc] ON [loc].LocationID = [WorO].LocationID
GROUP BY [WorO].[LocationID]
		    ,[loc].[Name] 


---- $1,106,432.25

--- ################################################################
--- ###  MAXIMO DE CATIDAD DE PRODUCCION
--- ################################################################
--- ################################################################
--- (161)


SELECT MAX([WorO].[PlannedCost]) [MaxPlannedCost]
	  ,MIN([WorO].[PlannedCost]) [MinPlannedCost] 
    FROM [AdventureWorks2016_EXT].[Production].[WorkOrderRouting][WorO]
	  WHERE [WorO].[LocationID] = 50
		   
/*
50	Subassembly
30	Debur and Polish
10	Frame Forming
45	Specialized Paint
60	Final Assembly
40	Paint
20	Frame Welding
*/

--- ################################################################
--- ###  MAXIMO DE CATIDAD DE PRODUCCION PO AREA O ZONA
--- ################################################################
--- ################################################################
--- (162)

SELECT [WorO].[LocationID]
	    ,[loc].[Name] [DescricionLocate]
	    ,(SELECT TOP(1) MAX([WorO].[PlannedCost]) 
        FROM [AdventureWorks2016_EXT].[Production].[WorkOrderRouting][Wor1]
        WHERE [Wor1].[LocationID] = [WorO].[LocationID]) [MaxPlannedCost]
FROM [AdventureWorks2016_EXT].[Production].[WorkOrderRouting][WorO]
INNER JOIN [Production].[Location] [loc] ON [loc].LocationID = [WorO].LocationID
GROUP BY [WorO].[LocationID]
		     ,[l
         oc].[Name] 
		  