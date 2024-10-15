--- ### ## ##############################################################
--- ### ## #  EJEMPLOS DOS SELECT CON FUNCION CONCAT
--- ### ## ##############################################################


---(147)
SELECT CONCAT ( 'Happy ', 'Birthday ', 11, '/', '25' ) AS Result;

---(148)
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

