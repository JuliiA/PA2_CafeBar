//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Datos
{
    using System;
    using System.Collections.Generic;
    
    public partial class Pedido
    {
        public int PedidoID { get; set; }
        public System.DateTime Fecha { get; set; }
        public string Cliente { get; set; }
        public string Menu { get; set; }
        public decimal MenuPrecio { get; set; }
        public string Bebida { get; set; }
        public Nullable<decimal> BebidaPrecio { get; set; }
        public string Postre { get; set; }
        public Nullable<decimal> PostrePrecio { get; set; }
        public Nullable<int> ConEnvio { get; set; }
        public int Estado { get; set; }
        public int FacturaID { get; set; }
        public Nullable<int> Baja { get; set; }
    
        public virtual Factura Factura { get; set; }
    }
}