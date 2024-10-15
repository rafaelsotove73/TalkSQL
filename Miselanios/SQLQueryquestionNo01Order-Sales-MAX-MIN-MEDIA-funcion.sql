USE [AdventureWorks2016_EXT]
GO

/****** Object:  UserDefinedFunction [dbo].[f_promedio]    Script Date: 09/05/2023 09:42:00 a. m. ******/
DROP FUNCTION [dbo].[f_promedio]
GO

/****** Object:  UserDefinedFunction [dbo].[f_promedio]    Script Date: 09/05/2023 09:42:00 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create function [dbo].[f_promedio]
 (@valor1 decimal(24,5),
  @NElemt int
 )
 returns decimal (24,5)
 as
 begin 
   declare @resultado decimal(24,5)
   set @resultado=(@valor1)/@NElemt
   return @resultado
 end;
GO


