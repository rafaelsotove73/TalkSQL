--- === ==============================================================
--- ===  FOMATOS DE FECHA / FORMAT / CASE /  =========================
--- === ==============================================================

  SELECT 
       [TraProd].[TransactionID]
      ,[TraProd].[ProductID]
	  ,[ProBase].[ProductNumber]
	  ,[ProBase].[Name] 
	  ,[ProBase].[Color]
      ,[TraProd].[ReferenceOrderID]
      ,[TraProd].[ReferenceOrderLineID]
      ,[TraProd].[TransactionDate]
	  ,FORMAT( [TraProd].[TransactionDate], 'd', 'en-US' ) 'US English'  
      ,FORMAT( [TraProd].[TransactionDate], 'd', 'en-gb' ) 'British English'  
      ,FORMAT( [TraProd].[TransactionDate], 'd', 'de-de' ) 'German'  
      ,FORMAT( [TraProd].[TransactionDate], 'd', 'zh-cn' ) 'Chinese Simplified (PRC)'
	  ,FORMAT( [TraProd].[TransactionDate], 'dd/MM/yyyy', 'en-US' ) [DateCustomizada]
	  ,FORMAT(cast([TraProd].[TransactionDate] as time), N'hh\.mm') [DateTes01-]   
      ,FORMAT(cast([TraProd].[TransactionDate] as time), N'hh\:mm') [DateTes01.1] 
	  ,FORMAT(cast(GETDATE() as time), N'hh\.mm') [DateTes02]     
      ,FORMAT(cast(GETDATE() as time), N'hh\:mm') [DateTes02.1] 
	  ,FORMAT(SYSDATETIME(), N'hh:mm tt') AS DateTes03 
      ,FORMAT(SYSDATETIME(), N'hh:mm t') AS DateTes031
	  ,FORMAT(CAST(SYSDATETIME() AS datetime2), N'hh:mm tt') [DateTes04] 
      ,FORMAT(CAST(SYSDATETIME() AS datetime2), N'hh:mm t')  [DateTes04.1]
	  ,FORMAT(CAST(SYSDATETIME() AS datetime2), N'hh:mm tt') [DateTes05] 
      ,FORMAT(CAST(SYSDATETIME() AS datetime2), N'hh:mm t')  [DateTes05.1]
	  ,FORMAT(CAST(SYSDATETIME() AS datetime2), N'HH:mm') -- returns 14:00
      ,[TraProd].[Quantity]
      ,[TraProd].[ActualCost]
	  ,FORMAT([TraProd].[ActualCost], 'N', 'en-us') AS NumericFormat  
      ,FORMAT([TraProd].[ActualCost], 'G', 'en-us') AS [General Format]  
      ,FORMAT([TraProd].[ActualCost], 'C', 'en-us') AS 'Currency Format'  
  FROM [Production].[TransactionHistoryArchive] [TraProd]
  INNER JOIN [Production].[Product] [ProBase] ON [ProBase].ProductID = [TraProd].ProductID 
  ORDER BY [TraProd].[TransactionDate]

  ---------------------------
  ---------------------------
SELECT FORMAT(cast('07:35' as time), N'hh\.mm');  --> returns 07.35  
SELECT FORMAT(cast('07:35' as time), N'hh\:mm');  --> returns 07:35
SELECT FORMAT(SYSDATETIME(), N'hh:mm tt'); -- returns 03:46 PM
SELECT FORMAT(SYSDATETIME(), N'hh:mm t'); -- returns 03:46 P
select FORMAT(CAST('2018-01-01 01:00' AS datetime2), N'hh:mm tt') -- returns 01:00 AM
select FORMAT(CAST('2018-01-01 01:00' AS datetime2), N'hh:mm t')  -- returns 01:00 A
select FORMAT(CAST('2018-01-01 14:00' AS datetime2), N'hh:mm tt') -- returns 02:00 PM
select FORMAT(CAST('2018-01-01 14:00' AS datetime2), N'hh:mm t') -- returns 02:00 P
select FORMAT(CAST('2018-01-01 14:00' AS datetime2), N'HH:mm') -- returns 14:00


