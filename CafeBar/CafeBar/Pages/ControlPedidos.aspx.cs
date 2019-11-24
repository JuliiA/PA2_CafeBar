using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Negocio;

namespace CafeBar.Pages
{
    public partial class ControlPedidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarGrillaConPedidos(string.Empty, string.Empty, string.Empty);
            Control control = (Control)modifPedido.FindControl("divActualizar");
            control.Visible = true;

            if (!IsPostBack)
            {
                CargarFiltros();
            }
        }

        private void CargarFiltros()
        {
            Filtros(ddlEstadoFiltro, PedidoServicio.ObtenerFiltrosEstados());
            Filtros(ddlFechaFiltro, PedidoServicio.ObtenerFiltrosFecha());
            Filtros(ddlClienteFiltro, PedidoServicio.ObtenerFiltrosCliente());
        }

        private void Filtros(DropDownList ddlFiltro, List<CoreServicio.Opcion> filtros)
        {
            ddlFiltro.DataSource = filtros;
            ddlFiltro.DataValueField = "Id";
            ddlFiltro.DataTextField = "Nombre";
            ddlFiltro.DataBind();
        }
        private void CargarGrillaConPedidos(string fecha, string cliente, string estado)
        {
            var losPedidos = PedidoServicio.ObtenerPedidos(fecha, cliente, estado); /// trae todos los pedidos sin filtros
            grdPedidos.DataSource = losPedidos;
            grdPedidos.DataBind();
        }

        protected void grdPedidos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Se obtiene indice de la row seleccionada
            int index = Convert.ToInt32(e.CommandArgument);
            // Obtengo el id de la entidad que se esta editando
            int id = (int)grdPedidos.DataKeys[index].Value;

            if (e.CommandName == "cmdEditar") {
                contieneFormUC.Visible = true;
                panelVerPedido.Visible = false;

                var pedidoEditado = PedidoServicio.BuscarPorId(id);

                editarDatosEnForm(pedidoEditado, id);
            }

            if (e.CommandName == "cmdVer")
            {
                contieneFormUC.Visible = false;               
                
                panelVerPedido.Visible = true;

                lblPedido.Text = PedidoServicio.VerPedido(id);
            }

            if (e.CommandName == "cmdEliminar")
            {
                bool okDelete = PedidoServicio.BorrarPedido(id);
                contieneFormUC.Visible = false;
                panelVerPedido.Visible = false;
                CargarGrillaConPedidos(string.Empty, string.Empty,string.Empty);
            }

            if (e.CommandName == "cmdCambiar")
            {
                bool okDelete = PedidoServicio.CambiarEstado(id);
                contieneFormUC.Visible = false;
                panelVerPedido.Visible = false;
                CargarGrillaConPedidos(string.Empty, string.Empty, string.Empty);
            }
        }

        private void editarDatosEnForm(object pedidoEditado, int idPedido)
        {
            HiddenField hidden = (HiddenField)modifPedido.FindControl("hideID");
            hidden.Value = idPedido.ToString();
            TextBox txtfecha = (TextBox)modifPedido.FindControl("txtFecha");
            TextBox txtcliente = (TextBox)modifPedido.FindControl("txtCliente");
            DropDownList ddlmenu = (DropDownList)modifPedido.FindControl("ddlMenues");
            TextBox txtmprecio = (TextBox)modifPedido.FindControl("txtPrecioMenu");
            DropDownList ddlbebida = (DropDownList)modifPedido.FindControl("ddlBebidas");
            TextBox txtbprecio = (TextBox)modifPedido.FindControl("txtPrecioBebida");
            DropDownList ddlpostre = (DropDownList)modifPedido.FindControl("ddlPostres");
            TextBox txtpprecio = (TextBox)modifPedido.FindControl("txtPrecioPostre");
            RadioButtonList radioButton = (RadioButtonList)modifPedido.FindControl("rdFormaPago");

            var tFecha = pedidoEditado.GetType().GetRuntimeProperty("Fecha")?.GetValue(pedidoEditado);
            var tCliente = pedidoEditado.GetType().GetRuntimeProperty("Cliente")?.GetValue(pedidoEditado);
            
            var tMenu  = pedidoEditado.GetType().GetRuntimeProperty("Menu")?.GetValue(pedidoEditado);
            var tMPrecio = pedidoEditado.GetType().GetRuntimeProperty("MenuPrecio")?.GetValue(pedidoEditado);
            var losMenus = CoreServicio.GetMenu() as List<CoreServicio.Opcion>;

            var tBebida = pedidoEditado.GetType().GetRuntimeProperty("Bebida")?.GetValue(pedidoEditado);
            var tBPrecio = pedidoEditado.GetType().GetRuntimeProperty("BebidaPrecio")?.GetValue(pedidoEditado);
            var lasBebidas = CoreServicio.GetBebidas() as List<CoreServicio.Opcion>;

            var tPostre = pedidoEditado.GetType().GetRuntimeProperty("Postre")?.GetValue(pedidoEditado);
            var tPPrecio = pedidoEditado.GetType().GetRuntimeProperty("PostrePrecio")?.GetValue(pedidoEditado);
            var losPostres = CoreServicio.GetPostre() as List<CoreServicio.Opcion>;

            CoreServicio.Opcion elMenu = losMenus.Where(p => p.Nombre == tMenu.ToString()).FirstOrDefault();
            CoreServicio.Opcion laBebida = lasBebidas.Where(p => p.Nombre == tBebida.ToString()).FirstOrDefault();
            CoreServicio.Opcion elPostre = losPostres.Where(p => p.Nombre == tPostre.ToString()).FirstOrDefault();

            txtfecha.Text = Convert.ToDateTime(tFecha).ToString("dd/MM/yyyy");
            txtcliente.Text = tCliente.ToString();
            ddlmenu.SelectedItem.Value = elMenu.Precio.ToString();
            txtmprecio.Text = Convert.ToInt64(tMPrecio).ToString();
            ddlmenu.SelectedItem.Text = elMenu.Nombre;
            ddlbebida.SelectedItem.Value = laBebida.Precio.ToString();
            ddlbebida.SelectedItem.Text = laBebida.Nombre;
            txtbprecio.Text = Convert.ToInt64(tBPrecio).ToString();
            ddlpostre.SelectedItem.Value = elPostre.Precio.ToString();
            ddlpostre.SelectedItem.Text = elPostre.Nombre;
            txtpprecio.Text = Convert.ToInt64(tPPrecio).ToString();
         }

        protected void grdPedidos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                switch (Convert.ToInt32(e.Row.Cells[3].Text))
                {
                    case 1: e.Row.Cells[3].Text = "En espera "; break;
                    case 0: e.Row.Cells[3].Text = "Cerrado";
                        e.Row.Cells[4].Controls.Clear();
                        e.Row.Cells[5].Controls.Clear();
                        e.Row.Cells[6].Controls.Clear();
                        e.Row.Cells[7].Controls.Clear();
                        break;
                }

            }
        }
        
        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            CargarGrillaConPedidos(ddlFechaFiltro.SelectedItem.Text, ddlClienteFiltro.SelectedItem.Text, ddlEstadoFiltro.SelectedItem.Text);
        }
    }
}