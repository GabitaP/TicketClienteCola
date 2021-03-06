USE [SistemeColas]
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_PROCESAMIENTO]    Script Date: 16/02/2021 0:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_GET_PROCESAMIENTO] 
(          
    @COLA int       
)          
as  
Begin

	--Obtener registros por cola
	SELECT *
	FROM PROCESAMIENTO_COLA WITH(NOLOCK)
	WHERE PROC_COLA_ID=@COLA AND PROC_ESTADO in ('ATENDIENDO','PENDIENTE') 
	ORDER BY PROC_ID

End 
