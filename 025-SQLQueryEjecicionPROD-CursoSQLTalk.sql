--- ### ## ##############################################################
--- ### ## #  SELECT CON MULTIPLES FORMATOS DE FECHA FUNCION DE OBTENER 
--- ### ## # FECHA HORA SYSDATETIME / DATATIME , EJEMPLOS DE FORMAS 
--- ### ## # DECLARAR ALIAS PARA CAMPOS, FORMATOS PARA NUMEROS
--- ### ## ##############################################################
--- (153)

USE AdventureWorks2016_EXT
  SELECT 
    [TraProd].[TransactionID]
	  ,[ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
    ,[TraProd].[TransactionDate]                                                    ----> NATIVO FECHA Y HORA
	  ,FORMAT( [TraProd].[TransactionDate], 'd', 'en-US' ) 'US English'               ---->  f.US-M/dd/yyyy
    ,FORMAT( [TraProd].[TransactionDate], 'd', 'en-gb' ) 'British English'          ---->  f.gB-dd/MM/yyyy
    ,FORMAT( [TraProd].[TransactionDate], 'd', 'de-de' ) 'German'                   ---->  f.Ge-dd.MM.yyyy  
    ,FORMAT( [TraProd].[TransactionDate], 'd', 'zh-cn' ) 'Chinese Simplified (PRC)' ---->  f.Ge-dd.MM.yyyy  
	  ,FORMAT( [TraProd].[TransactionDate], 'dd-MM-yyyy', 'en-US' ) [DateCustomizada]
	  ,FORMAT(cast([TraProd].[TransactionDate] as time), N'hh\.mm') [DateTes01-]      ----> 00:00
	  ,FORMAT(cast(GETDATE() as time), N'hh\.mm') [DateTes02]                         ----> 00.00
    ,FORMAT(cast(GETDATE() as time), N'hh\:mm') [DateTes02.1]                       ----> 00:00
	  ,FORMAT(SYSDATETIME(), N'hh:mm tt') AS DateTes03                                ----> 00:00 AM
    ,FORMAT(SYSDATETIME(), N'hh:mm t') AS DateTes031                                ----> 00:00 A
	  ,FORMAT(CAST(SYSDATETIME() AS datetime2), N'HH:mm') [DateTes04]               -- returns 14:00
    ,[TraProd].[Quantity]
    ,[TraProd].[ActualCost]
	  ,FORMAT([TraProd].[ActualCost], 'N', 'en-us') AS NumericFormat  
    ,FORMAT([TraProd].[ActualCost], 'G', 'en-us') AS [General Format]  
    ,FORMAT([TraProd].[ActualCost], 'C', 'en-us') AS 'Currency Format'  
    ,SYSDATETIME() [DteTime]
    ,GETDATE() [DteTimeGT]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID 
  ORDER BY [TraProd].[TransactionDate]

  ---------------------------
  ---------------------------
--- ### ## ##############################################################
--- ### ## ##############################################################
--- ### ## #  FORMATOS HORAS POR SEPARADOS
--- ### ## ##############################################################
---(153)


SELECT FORMAT(cast('07:35' as time), N'hh\.mm');  --> returns 07.35    --- (141)
SELECT FORMAT(SYSDATETIME(), N'hh:mm tt'); -- returns 03:46 PM         --- (142)
SELECT FORMAT(SYSDATETIME(), N'hh:mm t'); -- returns 03:46 P           --- (143)
select FORMAT(CAST('2018-01-01 01:00' AS datetime2), N'hh:mm tt') -- returns 01:00 AM  --- (144)
select FORMAT(CAST('2018-01-01 14:00' AS datetime2), N'hh:mm t') -- returns 02:00 P    --- (145)
select FORMAT(CAST('2018-01-01 14:00' AS datetime2), N'HH:mm') -- returns 14:00        --- (146)

--- ### ## ##############################################################
--- ### ## #  EJEMPLOS DOS SELECT CON FUNCION CONCAT
--- ### ## ##############################################################


---(154)
SELECT CONCAT ( 'Happy ', 'Birthday ', 11, '/', '25' ) AS Result;

---(155)
  SELECT 
	  [ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,[ProBase].[Color]
	  ,CONCAT ( [ProBase].[ProductNumber], '-', [ProBase].[Name] ,'-', ISNULL([ProBase].[Color],'Whyte') ) [ConcatString01]
	  ,[ProBase].[ProductNumber] + ' ' + [ProBase].[Name] + ' '+ [ProBase].[Color] [ConcatString02]
      ,[TraProd].[TransactionDate]
      ,[TraProd].[Quantity]
      ,[TraProd].[ActualCost]
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID  
        AND NOT([Color] IS NULL)  ORDER BY [TraProd].[TransactionDate]

