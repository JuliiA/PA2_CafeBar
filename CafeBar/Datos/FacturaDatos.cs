using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class FacturaDatos
    {
        //private static CafeBarContext context = new CafeBarContext();
       
        public static Factura BuscarPorId(int facturaID)
        {
            CafeBarContext context = new CafeBarContext();
            var qFactura = from f in context.Facturas
                          where f.FacturaID == facturaID 
                          select f;

            return qFactura.FirstOrDefault();
        }

        /// <summary>
        /// Va a borrar por la FK
        /// </summary>
        /// <param name="pedidoID"></param>
        internal static void BorrarFactura(int pedidoID)
        {
            try
            {
                CafeBarContext context = new CafeBarContext();
                Factura factura = BuscarPorPedidoId(pedidoID);
                factura.Baja = 1;
                context.Entry(factura).State = EntityState.Modified;
                context.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static Factura BuscarPorPedidoId(int pedidoID)
        {
            CafeBarContext context = new CafeBarContext();
            var factura = (from f in context.Facturas
                            where f.Pedido.PedidoID == pedidoID
                            select f);
            return factura.FirstOrDefault();
        }

        public static void ActualizarImporte(int id, string precioTotal)
        {
            CafeBarContext context = new CafeBarContext();
            Factura upd = (from f in context.Facturas
                           where f.Pedido.PedidoID == id
                           select f).FirstOrDefault();
            upd.Total = Convert.ToDecimal(precioTotal.Split('$')[1]);
            context.Entry(upd).State = EntityState.Modified;
            context.SaveChanges();
        }

        internal static void ActualizarFactura(Factura facturaBD)
        {
            CafeBarContext context = new CafeBarContext();
            context.Entry(facturaBD).State = EntityState.Modified;
            context.SaveChanges();
        }

        public static bool CambiarFactura(int id)
        {
            CafeBarContext context = new CafeBarContext();
            Factura factura = BuscarPorPedidoId(id);
            factura.Estado = 0;
            context.Entry(factura).State = EntityState.Modified;
            context.SaveChanges();

            return true;
        }

        ///  EnEspera = 1, Pagado = 2
    }
}
