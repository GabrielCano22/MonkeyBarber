//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Proyecto_final_barberia.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Turno
    {
        public string cod_turno { get; set; }
        [DataType(DataType.Date)]
        public Nullable<System.DateTime> fecha { get; set; }
        public Nullable<System.TimeSpan> hora { get; set; }
        public Nullable<int> valor { get; set; }
        public string nombre_cliente { get; set; }
        public string nombre_barbero { get; set; }
        public Nullable<bool> activo { get; set; }
    }
}
