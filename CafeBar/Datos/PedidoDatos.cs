using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class PedidoDatos
    {

        public static bool AltaOModificacion(Pedido nPedido)
        {
            CafeBarContext context = new CafeBarContext();
            try
            {
                if (nPedido.PedidoID == 0)
                {
                    //es una alta
                    Factura facturaBD = new Factura
                    {
                        FacturaID = 0,
                        Total = nPedido.MenuPrecio + nPedido.BebidaPrecio + nPedido.PostrePrecio,
                        Estado = 1,
                        Fecha = DateTime.Now,
                        FormaPago = 1,
                        Baja = 0,
                        Pedido = nPedido
                    };
                    context.Facturas.Add(facturaBD);
                    context.Pedidos.Add(nPedido);
                    
                }
                else
                {
                    //es una modificacion
                    var upd = context.Pedidos.Where(x => x.PedidoID == nPedido.PedidoID).FirstOrDefault();
                    //upd = nPedido;
                    context.Entry(upd).CurrentValues.SetValues(nPedido);
                }
                context.SaveChanges();
                return true;   
            }
            catch (Exception c) {
            
                return false;
                throw c;
            }
           
        }

        public static object GetAllPedidos() {
            CafeBarContext context = new CafeBarContext();
            var todosLosPedidos = (
                        from p in context.Pedidos
                        where p.Baja == 0
                        select p
                ).ToList();

            return todosLosPedidos;
        }

        public static Pedido GetPedido(int PedidoID) {
            CafeBarContext context = new CafeBarContext();
            //return null;
            var qPedido = from p in context.Pedidos
                          where p.PedidoID == PedidoID
                          select p;

            return qPedido.FirstOrDefault();
        }

        public static bool BorrarPedido(int PedidoID) {
           try
            {
                CafeBarContext context = new CafeBarContext();
                //Borrar tambien la factura asociada
                FacturaDatos.BorrarFactura(PedidoID);

                Pedido pedido = GetPedido(PedidoID);
                pedido.Baja = 1;
                context.Entry(pedido).State = EntityState.Modified;
                context.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
                throw e;
            }
        }

        public static bool Pagar(int id)
        {
            CafeBarContext context = new CafeBarContext();
            Pedido pedido = GetPedido(id);
            pedido.Estado = 0;
            context.Entry(pedido).State = EntityState.Modified;
            context.SaveChanges();
            return true;
        }
    }
}
