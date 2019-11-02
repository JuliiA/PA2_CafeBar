using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class PedidoDatos
    {
        public int PedidoID { get; set; }
        public DateTime Fecha { get; set; }
        public String Cliente { get; set; }
        public String Menu { get; set; }
        public String Bebida { get; set; }
        public String Postre { get; set; }
        public int Estado { get; set; } /// <- EnEspera = 1, Cerrado = 2
        public int FacturaID { get; set; }
    }
}
