DECLARE  @xmlresume xml
         ,@Change_xmlresume xml
		 ,@Change_xmlresumeStr VARCHAR(max)
         ,@Datem DATE
		 ,@Linea integer = 0

 DECLARE CursXmlResumen CURSOR FOR 
 SELECT [Resume]
      ,[ModifiedDate]
  FROM [AdventureWorks2016_EXT].[HumanResources].[JobCandidate];
  
  OPEN CursXmlResumen

  FETCH NEXT FROM CursXmlResumen INTO @xmlresume, @Datem

  WHILE (@@FETCH_STATUS = 0)
	BEGIN 
		SELECT  @Linea = @Linea + 1
		IF @Linea =  1
		  BEGIN
			PRINT ('#######################' )
			PRINT ('#######################' )

			PRINT ('Nro registro:: ' + CONVERT(VARCHAR(10),@Linea))
			PRINT ('XML ' + CONVERT(VARCHAR(MAX),@xmlresume))
			SELECT @Change_xmlresumeStr = CONVERT(VARCHAR(max),@xmlresume) 
			SELECT @Change_xmlresumeStr = REPLACE(@Change_xmlresumeStr,'ns:','')

			PRINT ('@@@@@@@@@@@@@@@@@@@@@@@')
			PRINT ('@@@@@@@@@@@@@@@@@@@@@@@')

			PRINT(@Change_xmlresumeStr)

			PRINT ('========================')
			PRINT ('========================')

			SELECT  @Change_xmlresume  = CONVERT(VARCHAR(xml),@Change_xmlresumeStr) 

			---SELECT 	* FROM @Change_xmlresume.nodes('/Resume/Name') 


		  END
	
		FETCH NEXT FROM CursXmlResumen INTO @xmlresume, @Datem

		
	END

	CLOSE CursXmlResumen       
	DEALLOCATE CursXmlResumen 