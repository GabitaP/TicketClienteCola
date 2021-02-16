using ProcesamientoColasDB;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ProcesamientoColasNegocio
{
    public class BProcesamientoColas : IDisposable
    {   
        //Procedimiento almacenado para obtener registros por cola
        public static List<SP_GET_PROCESAMIENTO_Result> GetColaID(int cola)
        {
            try
            {
                var db = new SistemeColasEntities();
                var datos = db.SP_GET_PROCESAMIENTO(cola).ToList();
                if (datos.Any())
                    return datos;
                else
                    return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //Procedimiento almacenado para agredar registros de cliente para atender
        public static int Insert_NewCliente(string idCli,string cliente)
        {
            try
            {
                var db = new SistemeColasEntities();                
                var datos = db.SP_INSERT_PROCESAMIENTO_COLA(idCli,cliente).ToString();
                if (datos.Any())
                    return datos.First();
                else
                    return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //Actualización de registros por el timer
        public static int Actualizar_Cola(int cola)
        {
            try
            {
                var db = new SistemeColasEntities();
                var datos = db.SP_UPDATE_PROCESAMIENTO_COLA(cola.ToString()).ToString();
                if (datos.Any())
                    return datos.First();
                else
                    return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        
        #region IDisposable
        void IDisposable.Dispose()
        {
            //throw new NotImplementedException();
        }
        #endregion
    }
}
