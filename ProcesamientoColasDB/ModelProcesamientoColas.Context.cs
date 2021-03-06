﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProcesamientoColasDB
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class SistemeColasEntities : DbContext
    {
        public SistemeColasEntities()
            : base("name=SistemeColasEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<COLAS> COLAS { get; set; }
        public virtual DbSet<PROCESAMIENTO_COLA> PROCESAMIENTO_COLA { get; set; }
    
        public virtual ObjectResult<SP_GET_PROCESAMIENTO_Result> SP_GET_PROCESAMIENTO(Nullable<int> cOLA)
        {
            var cOLAParameter = cOLA.HasValue ?
                new ObjectParameter("COLA", cOLA) :
                new ObjectParameter("COLA", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_GET_PROCESAMIENTO_Result>("SP_GET_PROCESAMIENTO", cOLAParameter);
        }
    
        public virtual int SP_INSERT_PROCESAMIENTO_COLA(string iD_CLI, string nAME_CLI)
        {
            var iD_CLIParameter = iD_CLI != null ?
                new ObjectParameter("ID_CLI", iD_CLI) :
                new ObjectParameter("ID_CLI", typeof(string));
    
            var nAME_CLIParameter = nAME_CLI != null ?
                new ObjectParameter("NAME_CLI", nAME_CLI) :
                new ObjectParameter("NAME_CLI", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_INSERT_PROCESAMIENTO_COLA", iD_CLIParameter, nAME_CLIParameter);
        }
    
        public virtual int SP_UPDATE_PROCESAMIENTO_COLA(string cOLA)
        {
            var cOLAParameter = cOLA != null ?
                new ObjectParameter("COLA", cOLA) :
                new ObjectParameter("COLA", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_UPDATE_PROCESAMIENTO_COLA", cOLAParameter);
        }
    }
}
