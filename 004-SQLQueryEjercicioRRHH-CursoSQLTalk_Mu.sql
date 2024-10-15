
--- ### ###################################################
--- ### CUANTOS MIEMBROS DEL PERSONAL SON HOMBRE Y MUJER
--- ### ###################################################
--(34) -- SOLUCION MEDIANTE UNA UNION Y DOS SELECT


USE AdventureWorks2016_EXT 

SELECT        'SOLTEROS(AS)::' [StadoCivil] 
			  ,count(MaritalStatus)[Nro]
FROM          HumanResources.vEmployeePersonTemporalInfo
WHERE [MaritalStatus]  = 'S'
UNION
SELECT        'CASADOS(AS)::' [StadoCivil]  
              ,count(MaritalStatus) [Nro]
FROM          HumanResources.vEmployeePersonTemporalInfo
WHERE [MaritalStatus] = 'M'

--(35)  SOLUCION MEDIANTE UN GROUP BY
SELECT [MaritalStatus]
       ,count([MaritalStatus]) [Nro]
FROM HumanResources.vEmployeePersonTemporalInfo
GROUP BY [MaritalStatus]

--(36)  SOLUCION MEDIANTE UN  SCRIPT / PROCEDIMIENTO-QUERY
-- ## DECLARACION DE VARIABLE Y SALIDA MEDIANTE AREA MESAJES SQL
-- ################################################################
-----------------------------
DECLARE @SOLTEROS VARCHAR(1) = 'S'
DECLARE @CASADOS VARCHAR(1) = 'M'
DECLARE @SOLTEROSNRO INTEGER 
DECLARE @CASADOSNRO INTEGER

SELECT @SOLTEROSNRO =(SELECT count([MaritalStatus]) FROM HumanResources.vEmployeePersonTemporalInfo WHERE [MaritalStatus] = @SOLTEROS)
SELECT @CASADOSNRO =(SELECT count([MaritalStatus]) FROM HumanResources.vEmployeePersonTemporalInfo WHERE [MaritalStatus] = @CASADOS)

PRINT('FECHA/HORA DE CALCULO: ' +CONVERT(VARCHAR(40), GETDATE()))
PRINT('NRO. SOLTETROS(AS): ' +CONVERT(VARCHAR(10),@SOLTEROSNRO))
PRINT('NRO. CASADOS(AS) ' +CONVERT(VARCHAR(10),@CASADOSNRO))

---------------------------------------------
--(37)  SOLUCION MEDIANTE UN  SCRIPT / PROCEDIMIENTO-QUERY VER 2

DECLARE @SOLTEROS1 VARCHAR(1) = 'S',
		@CASADOS1 VARCHAR(1) = 'M',
		@SOLTEROSNRO1 INTEGER, 
	    @CASADOSNRO1 INTEGER

SELECT @SOLTEROSNRO1 =(SELECT count([MaritalStatus]) FROM HumanResources.vEmployeePersonTemporalInfo WHERE [MaritalStatus] = @SOLTEROS1)
SELECT @CASADOSNRO1 =(SELECT count([MaritalStatus]) FROM HumanResources.vEmployeePersonTemporalInfo WHERE [MaritalStatus] = @CASADOS1)

PRINT('FECHA/HORA DE CALCULO: ' +CONVERT(VARCHAR(40), GETDATE()))
PRINT('NRO. SOLTETROS(AS): ' +CONVERT(VARCHAR(10),@SOLTEROSNRO1))
PRINT('NRO. CASADOS(AS) ' +CONVERT(VARCHAR(10),@CASADOSNRO1))

