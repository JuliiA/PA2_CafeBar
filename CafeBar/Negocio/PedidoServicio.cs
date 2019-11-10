using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;

namespace Negocio
{
    public class PedidoServicio
    {
        public static bool Actualizar(int id, string fecha, string cliente, 
                                        string menu, string menuPrecio, string bebida, string bebidaPrecio, string postre, string postrePrecio, 
                                        string precioTotal, string formaPago)
        {
            Pedido nPedido = new Pedido
            {
                PedidoID = id, ///ID testing --> quitar con el identity de data model
                Fecha = Convert.ToDateTime(fecha),
                Cliente = cliente,
                Menu = menu,
                MenuPrecio = Convert.ToInt64(menuPrecio),
                Bebida = bebida,
                BebidaPrecio = Convert.ToInt64(bebidaPrecio),
                Postre = postre,
                PostrePrecio = Convert.ToInt64(postrePrecio),
                ConEnvio = 1,
                Estado = 1,
                Baja = 0 //0 no esta dado de baja - 1 si esta
            };

            try
            {
               var ok = PedidoDatos.AltaOModificacion(nPedido);
                if (ok && id != 0)
                    FacturaDatos.ActualizarImporte(id, precioTotal);

                return ok;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static object ObtenerPedidos()
        {
            return PedidoDatos.GetAllPedidos();
        }


        public static object BuscarPorId(int id)
        {
            return PedidoDatos.GetPedido(id);
        }

        public static string VerPedido(int p)
        {
            Pedido pedidoSeleccionado = (Pedido)BuscarPorId(p);// 
            Factura facturaDePedido = FacturaDatos.BuscarPorPedidoId(pedidoSeleccionado.PedidoID);
            string formaPago = facturaDePedido.FormaPago == 1 ? "Efectivo" : "Tarjeta";
            string cardPedido = "<div class='col-md-4' style='Background-color: #fff; color: #442525; margin-left: 30%;'>"
                                  + "<div class='theme-box'> <div class='theme-info'>"
                                  + "<div class='clearfix'><h2>" + pedidoSeleccionado.Cliente + "</h2>" + "<h4>" + pedidoSeleccionado.Fecha.ToShortDateString() + "</h4>" +
                                        "<div class='theme-downloads'>" + pedidoSeleccionado.Menu + " - $" + pedidoSeleccionado.MenuPrecio + "</div>" +
                                    "</div><p> Bebida: " + pedidoSeleccionado.Bebida + " - $" + pedidoSeleccionado.BebidaPrecio + "</p>" +
                                    "<div class='buttons'>Postre: "+ pedidoSeleccionado.Postre +" - $" +pedidoSeleccionado.PostrePrecio+"</div></div></div>"+
                                    "<div class='theme-box'> <div class='theme-info'>" +
                                        "<div class='clearfix'><h2> FACTURA N 00000" + facturaDePedido.FacturaID + "</h2>"+
                                            "<h4>"+ facturaDePedido.Fecha.ToString("dd/MM/yyyy HH:mm")+" - TOTAL: "+facturaDePedido.Total+"</h4>["+ formaPago +"]</div>"+
                                    "</div></div>" +
                                "</div>";
            return cardPedido;
        }

        public static bool CambiarEstado(int id)
        {
            try
            {
                if (PedidoDatos.Pagar(id))
                {
                    var ok = FacturaDatos.CambiarFactura(id);
                    return ok;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                return false;
                throw;
            }            
        }

        public static bool BorrarPedido(int id)
        {
            return PedidoDatos.BorrarPedido(id);
        }
    }
}
