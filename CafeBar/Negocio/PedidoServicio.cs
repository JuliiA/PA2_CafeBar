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
        public class PedidoFormulario
        {
            public int id { get; set; }
            public string fecha { get; set; }
            public string cliente { get; set; }
            public string menu { get; set; }
            public string menuPrecio { get; set; }
            public string bebida { get; set; }
            public string bebidaprecio { get; set; }
            public string postre { get; set; }
            public string postreprecio { get; set; }
            public string formapago { get; set; }
        }

        public static bool Actualizar(PedidoFormulario pForm)
        {
            var nFecha = pForm.fecha.Split('/');

            Pedido nPedido = new Pedido
            {
                PedidoID = pForm.id, ///ID testing --> quitar con el identity de data model
                Fecha = new DateTime(Convert.ToInt32(nFecha[2]), Convert.ToInt32(nFecha[1]), Convert.ToInt32(nFecha[0])),
                Cliente = pForm.cliente,
                Menu = pForm.menu,
                MenuPrecio = Convert.ToInt64(pForm.menuPrecio),
                Bebida = pForm.bebida,
                BebidaPrecio = Convert.ToInt64(pForm.bebidaprecio),
                Postre = pForm.postre,
                PostrePrecio = Convert.ToInt64(pForm.postreprecio),
                ConEnvio = 1,
                Estado = 1,
                Baja = 0 //0 no esta dado de baja - 1 si esta
            };

            try
            {
               var ok = PedidoDatos.AltaOModificacion(nPedido);
                if (ok && pForm.id != 0)
                    FacturaDatos.ActualizarImporte(pForm.id, nPedido.MenuPrecio, nPedido.BebidaPrecio, nPedido.PostrePrecio);

                return ok;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<CoreServicio.Opcion> ObtenerFiltrosCliente()
        {
            List<String> clientes = PedidoDatos.ClientesParaFiltrar();
            List<CoreServicio.Opcion> opcions = new List<CoreServicio.Opcion>();

            if (clientes.Count > 0)
            {
                for (int i = 0; i < clientes.Count; i++)
                {
                    CoreServicio.Opcion opcion = new CoreServicio.Opcion();
                    opcion.Id = i;
                    opcion.Nombre = clientes[i].ToString();

                    opcions.Add(opcion);
                }
            }

            return opcions;
        }

        public static List<CoreServicio.Opcion> ObtenerFiltrosFecha()
        {
            List<DateTime> fechas = PedidoDatos.FechasParaFiltrar();
            List<CoreServicio.Opcion> opcions = new List<CoreServicio.Opcion>();

            if (fechas.Count > 0)
            {
                for (int i = 0; i < fechas.Count; i++)
                {
                    CoreServicio.Opcion opcion = new CoreServicio.Opcion();
                    opcion.Id = i;
                    opcion.Nombre = fechas[i].ToString("dd/MM/yyyy");

                    opcions.Add(opcion);
                }
            }

            return opcions;
        }

        public static List<CoreServicio.Opcion> ObtenerFiltrosEstados()
        {
            List<CoreServicio.Opcion> opcions = new List<CoreServicio.Opcion>();
            opcions.Add(new CoreServicio.Opcion { Id = 1, Nombre="En espera" });
            opcions.Add(new CoreServicio.Opcion { Id = 0, Nombre="Cerrado" });

            return opcions;
        }

        public static object ObtenerPedidos(string fecha, string cliente, string estado)
        {
            var data = PedidoDatos.GetAllPedidos() as List<Pedido>;
            if (!String.IsNullOrEmpty(fecha) && fecha != "Select All") {
                var nFecha = fecha.Split('/');
                data = data.Where(d => d.Fecha == new DateTime(Convert.ToInt32(nFecha[2]), Convert.ToInt32(nFecha[1]), Convert.ToInt32(nFecha[0])))
                            .ToList();                           
            }

            if (!String.IsNullOrEmpty(cliente) && cliente != "Select All") {
                data = data.Where(c => c.Cliente == cliente).ToList();
            }

            if (!String.IsNullOrEmpty(estado) && estado != "Select All") {
                int idEstado = estado == "Cerrado" ? 0 : 1;
                data = data.Where(e => e.Estado == idEstado).ToList();
            }
            return data;
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
