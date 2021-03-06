USE [SistemeColas]
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_PROCESAMIENTO_COLA]    Script Date: 16/02/2021 0:19:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_INSERT_PROCESAMIENTO_COLA]          
(          
    @ID_CLI VARCHAR(50),           
    @NAME_CLI VARCHAR(50)          
)          
as
DECLARE
@numCola1 bigint, @numCola2 bigint,
@proc_cola1 int, @proc_cola2 int,
@horafin1 int, @horafin2 int,
@idProc bigint       
Begin

	--Obtener cantidad de registros e identificador de cada cola
	SELECT @numCola1=count(*),@proc_cola1=PROC_COLA_ID
	FROM PROCESAMIENTO_COLA WITH(NOLOCK)
	WHERE PROC_COLA_ID=1 AND PROC_ESTADO in ('ATENDIENDO','PENDIENTE') 
	GROUP BY PROC_COLA_ID

	SELECT @numCola2=count(*),@proc_cola2=PROC_COLA_ID
	FROM PROCESAMIENTO_COLA WITH(NOLOCK)
	WHERE PROC_COLA_ID=2 AND PROC_ESTADO in ('ATENDIENDO','PENDIENTE') 
	GROUP BY PROC_COLA_ID

	--Tiempo total que demora en la atención
	SELECT @horafin1=SUM(a.totalMin) from (
	SELECT CASE WHEN PROC_ESTADO='ATENDIENDO' THEN datediff(MINUTE,PROC_START_TIME,getdate()) 
	WHEN datediff(MINUTE,PROC_END_TIME,PROC_START_TIME)<0 THEN datediff(MINUTE,PROC_START_TIME,PROC_END_TIME) 
	ELSE datediff(MINUTE,PROC_END_TIME,PROC_START_TIME) END AS totalMin
	FROM PROCESAMIENTO_COLA WITH(NOLOCK)
	WHERE PROC_ESTADO IN ('ATENDIENDO','PENDIENTE') 
	AND PROC_COLA_ID=1) a

	SELECT @horafin2=SUM(a.totalMin) from (
	SELECT CASE WHEN PROC_ESTADO='ATENDIENDO' THEN datediff(MINUTE,PROC_START_TIME,getdate()) 
	WHEN datediff(MINUTE,PROC_END_TIME,PROC_START_TIME)<0 THEN datediff(MINUTE,PROC_START_TIME,PROC_END_TIME) 
	ELSE datediff(MINUTE,PROC_END_TIME,PROC_START_TIME) END AS totalMin
	FROM PROCESAMIENTO_COLA WITH(NOLOCK)
	WHERE PROC_ESTADO IN ('ATENDIENDO','PENDIENTE') 
	AND PROC_COLA_ID=2) a

	--Obtiene el maximo ID de la tabla
	SELECT @idProc=COALESCE(MAX(PROC_ID), 0) + 1 FROM [dbo].[PROCESAMIENTO_COLA]
	
	--Comparación de minutos pendientes de atención
	IF (@horafin1>@horafin2)
		BEGIN			
			INSERT INTO [dbo].[PROCESAMIENTO_COLA] 
			VALUES (@idProc,@ID_CLI,@NAME_CLI,@proc_cola2,GETDATE(),DATEADD(mi,3,GETDATE()),'NUEVO INGRESO','PENDIENTE')
		END
	ELSE 
		BEGIN
			IF(@proc_cola1 IS NULL AND @proc_cola2 IS NULL)
				BEGIN
					SELECT @proc_cola1=1
					INSERT INTO [dbo].[PROCESAMIENTO_COLA] 
					VALUES (@idProc,@ID_CLI,@NAME_CLI,@proc_cola1,GETDATE(),DATEADD(mi,2,GETDATE()),'NUEVO INGRESO','PENDIENTE')
				END
			ELSE IF (@proc_cola1 IS NULL AND @proc_cola2 IS NOT NULL)
				BEGIN
					SELECT @proc_cola1=1
					INSERT INTO [dbo].[PROCESAMIENTO_COLA] 
					VALUES (@idProc,@ID_CLI,@NAME_CLI,@proc_cola1,GETDATE(),DATEADD(mi,2,GETDATE()),'NUEVO INGRESO','PENDIENTE')
				END
			ELSE IF (@proc_cola1 IS NOT NULL AND @proc_cola2 IS NULL)
				BEGIN
					SELECT @proc_cola1=2
					INSERT INTO [dbo].[PROCESAMIENTO_COLA] 
					VALUES (@idProc,@ID_CLI,@NAME_CLI,@proc_cola1,GETDATE(),DATEADD(mi,3,GETDATE()),'NUEVO INGRESO','PENDIENTE')
				END
			ELSE 
				BEGIN
					INSERT INTO [dbo].[PROCESAMIENTO_COLA] 
					VALUES (@idProc,@ID_CLI,@NAME_CLI,@proc_cola1,GETDATE(),DATEADD(mi,2,GETDATE()),'NUEVO INGRESO','PENDIENTE')
				END
		END	    
End 
