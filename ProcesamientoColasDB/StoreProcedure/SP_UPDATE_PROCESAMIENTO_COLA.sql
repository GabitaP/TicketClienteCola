USE [SistemeColas]
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_PROCESAMIENTO_COLA]    Script Date: 16/02/2021 0:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_UPDATE_PROCESAMIENTO_COLA]          
(          
    @COLA VARCHAR(50)       
)          
as 
DECLARE
@idAtencion int
Begin

	--Busco el id proximo a atender
	SELECT @idAtencion=MIN(PROC_ID) 
	FROM PROCESAMIENTO_COLA WITH (NOLOCK)
	WHERE PROC_COLA_ID=@COLA
	AND PROC_ESTADO='PENDIENTE'

	--Obtiene registro pendiente atención y lo finaliza
	UPDATE PROCESAMIENTO_COLA
	SET PROC_ESTADO='FINALIZADO'
	WHERE PROC_COLA_ID=@COLA
	AND PROC_ESTADO='ATENDIENDO'

	--Selecciona el nuevo cliente
	UPDATE PROCESAMIENTO_COLA 
	SET PROC_ESTADO='ATENDIENDO'
	WHERE PROC_COLA_ID=@COLA
	AND PROC_ESTADO='PENDIENTE'
	AND PROC_ID=@idAtencion
End 
