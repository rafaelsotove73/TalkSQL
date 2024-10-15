
--- ### ###################################################
--- ### CUANTOS MIEMBROS DEL PERSONAL SON HOMBRE Y MUJER
--- ### ###################################################
--(34) -- SOLUCION MEDIANTE UNA UNION Y DOS SELECT
SELECT        'FEMENINO::' [genero] 
			  ,count(gender)[Nro]
FROM          HumanResources.vEmployeePersonTemporalInfo
WHERE GENDER = 'F'
UNION
SELECT        'MASCULINO::'[genero]  
              ,count(gender) [Nro]
FROM          HumanResources.vEmployeePersonTemporalInfo
WHERE GENDER = 'M'

--(35)  SOLUCION MEDIANTE UN GROUP BY
SELECT gender
       ,count(gender) [Nro]
FROM HumanResources.vEmployeePersonTemporalInfo
GROUP BY gender

--(36)  SOLUCION MEDIANTE UN  SCRIPT / PROCEDIMIENTO-QUERY
-- ## DECLARACION DE VARIABLE Y SALIDA MEDIANTE AREA MESAJES SQL
-- ################################################################
-----------------------------
DECLARE @FEMENINO VARCHAR(1) = 'F'
DECLARE @MASCULINO VARCHAR(1) = 'M'
DECLARE @MASCULINONRO INTEGER 
DECLARE @FEMENINONRO INTEGER

SELECT @FEMENINONRO =(SELECT count(gender) FROM HumanResources.vEmployeePersonTemporalInfo WHERE GENDER = @FEMENINO)
SELECT @MASCULINONRO =(SELECT count(gender) FROM HumanResources.vEmployeePersonTemporalInfo WHERE GENDER = @MASCULINO)

PRINT('FECHA/HORA DE CALCULO: ' +CONVERT(VARCHAR(40), GETDATE()))
PRINT('NRO. MUJERES: ' +CONVERT(VARCHAR(10),@FEMENINONRO))
PRINT('NRO. HOMBRES ' +CONVERT(VARCHAR(10),@MASCULINONRO))

---------------------------------------------
--(37)  SOLUCION MEDIANTE UN  SCRIPT / PROCEDIMIENTO-QUERY VER 2

DECLARE @FEMENINO1 VARCHAR(1) = 'F',
		@MASCULINO1 VARCHAR(1) = 'M',
		@MASCULINONRO1 INTEGER, 
	    @FEMENINONRO1 INTEGER

SELECT @FEMENINONRO1 =(SELECT count(gender) FROM HumanResources.vEmployeePersonTemporalInfo WHERE GENDER = @FEMENINO1)
SELECT @MASCULINONRO1 =(SELECT count(gender) FROM HumanResources.vEmployeePersonTemporalInfo WHERE GENDER = @MASCULINO1)

PRINT('FECHA/HORA DE CALCULO: ' +CONVERT(VARCHAR(40), GETDATE()))
PRINT('NRO. MUJERES: ' +CONVERT(VARCHAR(10),@FEMENINONRO1))
PRINT('NRO. HOMBRES ' +CONVERT(VARCHAR(10),@MASCULINONRO1))

