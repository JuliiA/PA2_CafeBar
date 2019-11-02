using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class FacturaDatos
    {
        public int FacturaID { get; set; }
        public DateTime Fecha { get; set; }
        public float Total { get; set; }
        public int FormaPago { get; set; }
        public int Estado { get; set; } /// <- EnEspera = 1, Pagado = 2
    }
}
