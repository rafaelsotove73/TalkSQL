create function f_promedio
 (@valor1 decimal(24,5),
  @valor2 decimal(24,5)
 )
 returns decimal (24,5)
 as
 begin 
   declare @resultado decimal(6,2)
   set @resultado=(@valor1+@valor2)/2
   return @resultado
 end;