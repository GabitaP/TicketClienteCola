//------------------------------------------------------------------------------
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
    
    public partial class SP_GET_PROCESAMIENTO_Result
    {
        public int PROC_ID { get; set; }
        public string PROC_ID_CLIENT { get; set; }
        public string PROC_NAME_CLIENT { get; set; }
        public int PROC_COLA_ID { get; set; }
        public System.DateTime PROC_START_TIME { get; set; }
        public System.DateTime PROC_END_TIME { get; set; }
        public string PROC_DESCRIPTION { get; set; }
        public string PROC_ESTADO { get; set; }
    }
}
