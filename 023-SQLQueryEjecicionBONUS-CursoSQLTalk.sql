--- ### ## ##############################################################
--- ### ## PROCEDIMIENTO ALMACENADO PARA LLENAR LABLA FISICA EN 
--- ### ## MEMORIA  ESTA SOLUCION ES LA SEGUNDA PARTE DE UNA  SOLUCION
--- ### ## DE TRES PARTES:
--- ### ##   1.- CREACION DE TABLA FISICA EN MEMORIA
--- ### ##   2.- CREACION DE PROCESO ALMACENADO
--- ### ##   3.- CREACION DE UNA TAREA DE SQL QUE JECUTARA 
--- ### ##        MEDIANTE EL AGENTE DE SQL
--- ### ## ###################################################
---(144)

USE [AdventureWorks2016_EXT]
GO

/****** Object:  StoredProcedure [dbo].[TestTransactionProductionCorr]    Script Date: 16/05/2023 05:32:30 a. m. ******/
DROP PROCEDURE [dbo].[TestFullLoadTableMemory] 
GO

/****** Object:  StoredProcedure [dbo].[TestTransactionProductionCorr]    Script Date: 16/05/2023 05:32:30 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<RAFAEL SIMON SOTO >
-- Create date: <15/05/2023,,>
-- Description:	<LLENA TABLA FISIAC EN MEMORIA,,>
-- =============================================
CREATE PROCEDURE [dbo].[TestFullLoadTableMemory] 
AS
BEGIN
	
	SET NOCOUNT ON;

    
DELETE [dbo].[SalesOrderDetailInMem];

	
INSERT INTO [dbo].[SalesOrderDetailInMem]
      SELECT [SalesOrderID] 
       ,[SalesOrderDetailID] 
       ,[CarrierTrackingNumber]    
       ,[OrderQty] 
       ,[ProductID]
       ,[UnitPrice]
       ,[UnitPriceDiscount]
       FROM [Sales].[SalesOrderDetail];


END
GO

--- ### ## ##############################################################
--- ### ##  LLAMO PROCEDIMIENTO ALMACENO EN FORMA MANUAL PARA COMPROBAR
--- ### ## ##############################################################
---(145)


USE [AdventureWorks2016_EXT]
GO

DECLARE @RC int

-- TODO: Set parameter values here.

EXECUTE @RC = [dbo].[TestFullLoadTableMemory] 
GO


SELECT * FROM [dbo].[SalesOrderDetailInMem]


--- ### ## ######################################################################
--- ### ##  CODIGO EXPORTADO DE JOB(TRABAJO PROGRAMADO) ==> 
--- ### ##llAMADA A UN PROCEDIMIENTO ALMACENADO
--- ### ## ######################################################################
---(146)


USE [msdb]
GO

/****** Object:  Job [Full_loadTableMemory]    Script Date: 16/05/2023 06:38:30 p. m. ******/
EXEC msdb.dbo.sp_delete_job @job_id=N'41e4e373-fb3e-4e6e-8952-a54450dc13e4', @delete_unused_schedule=1
GO

/****** Object:  Job [Full_loadTableMemory]    Script Date: 16/05/2023 06:38:30 p. m. ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 16/05/2023 06:38:30 p. m. ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Full_loadTableMemory', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Llena tabla temporal', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'Horus', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [RUN_FULL_LOAD]    Script Date: 16/05/2023 06:38:30 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'RUN_FULL_LOAD', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'USE [AdventureWorks2016_EXT]
GO

DECLARE @RC int

-- TODO: Set parameter values here.

EXECUTE @RC = [dbo].[TestFullLoadTableMemory] 
GO', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'HORARIO_FULL_LOAD', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=49, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20230516, 
		@active_end_date=99991231, 
		@active_start_time=10000, 
		@active_end_time=235959, 
		@schedule_uid=N'a0182aa5-ad43-4227-9fca-acbcac246fe2'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO


