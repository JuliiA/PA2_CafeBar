using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace CafeBar.Pages
{
    public partial class ucABMPedido : System.Web.UI.UserControl
    {
        private static Int64 totalParcial;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                cargaMenuesEnDDL();
                cargaBebidasEnDDL();
                cargarPostresEnDDL();
            }
        }

        private void cargarPostresEnDDL()
        {
            ddlPostres.DataValueField = "Id";
            ddlPostres.DataTextField = "Nombre";

            var listaPostre = CoreServicio.GetPostre();

            ddlPostres.DataSource = listaPostre;
            ddlPostres.DataBind();
        }

        private void cargaBebidasEnDDL()
        {
            ddlBebidas.DataValueField = "Id";
            ddlBebidas.DataTextField = "Nombre";
            var listaBebida = CoreServicio.GetBebidas();
            ddlBebidas.DataSource = listaBebida;
            ddlBebidas.DataBind();
        }

        private void cargaMenuesEnDDL()
        {
            ddlMenues.DataValueField = "Id";
            ddlMenues.DataTextField = "Nombre";
            var listaMenu = CoreServicio.GetMenu() as List<CoreServicio.Opcion>;

            ddlMenues.DataSource = listaMenu.Where(m => m.Baja == true).ToList();
            ddlMenues.DataBind();
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                var menuElegido = ddlMenues.SelectedItem;
                var bebidaElegida = ddlBebidas.SelectedItem;
                var postreElegido = ddlPostres.SelectedItem;
                int id = int.Parse(hideID.Value);

                PedidoServicio.PedidoFormulario pedidoForm = new PedidoServicio.PedidoFormulario();
                pedidoForm.id = id;
                pedidoForm.fecha = txtFecha.Text;
                pedidoForm.cliente = txtCliente.Text;
                pedidoForm.menu = menuElegido.Text;
                pedidoForm.menuPrecio = txtPrecioMenu.Text;
                pedidoForm.bebida = bebidaElegida.Text;
                pedidoForm.bebidaprecio = txtPrecioBebida.Text;
                pedidoForm.postre = postreElegido.Text;
                pedidoForm.postreprecio = txtPrecioPostre.Text;
                pedidoForm.formapago = rdFormaPago.SelectedValue;

                var accion = PedidoServicio.Actualizar(pedidoForm);
                if (accion)
                {
                    //sets the message and the type of alert, than displays the message
                    labelMessage.Text = "El pedido se ha actualizado correctamente";
                    Message.CssClass = string.Format("alert alert-{0} alert-dismissable", "success");
                    Message.Attributes.Add("role", "alert");
                    Message.Visible = true;
                    LimpiarFormulario();
                    if (id > 0) { Page.Response.Redirect(Page.Request.Url.ToString(), true); }
                }
                else
                {
                    labelMessage.Text = "Ha ocurrido un error al intentar actualizar el pedido";
                    Message.CssClass = string.Format("alert alert-{0} alert-dismissable", "danger");
                    Message.Attributes.Add("role", "alert");
                    Message.Visible = true;
                }
            }
        }

        protected void ddlBebidas_SelectedIndexChanged(object sender, EventArgs e)
        {
            var valor = ddlBebidas.SelectedItem.Value;
            var bb = CoreServicio.GetBebidas() as List<CoreServicio.Opcion>;

            txtPrecioBebida.Text = bb.Where(b => b.Id == int.Parse(valor))
                                    .Select(b => b.Precio)
                                    .FirstOrDefault()
                                    .ToString();
            //txtPrecioBebida.Enabled = false;
        }

        protected void ddlMenues_SelectedIndexChanged(object sender, EventArgs e)
        {
            var valor = ddlMenues.SelectedItem.Value;
            var ll = CoreServicio.GetMenu() as List<CoreServicio.Opcion>;
           
            txtPrecioMenu.Text = ll.Where(m => m.Id == int.Parse(valor))
                                    .Select(m => m.Precio)
                                    .FirstOrDefault()
                                    .ToString();
          //  txtPrecioMenu.Enabled = false;
            
        }

        protected void ddlPostres_SelectedIndexChanged(object sender, EventArgs e)
        {
            var valor = ddlPostres.SelectedItem.Value;
            var vv = CoreServicio.GetPostre() as List<CoreServicio.Opcion>;

            txtPrecioPostre.Text = vv.Where(m => m.Id == int.Parse(valor))
                                    .Select(m => m.Precio)
                                    .FirstOrDefault()
                                    .ToString();
            
            //txtPrecioPostre.Enabled = false;
        }


        protected void CalcularPrecioTotal_TextChanged(object sender, EventArgs e)
        {
            //if(!string.IsNullOrEmpty(txtPrecioMenu.Text))
            //    totalParcial = (Convert.ToInt64(txtPrecioMenu.Text));

            // if(!string.IsNullOrEmpty(txtPrecioBebida.Text))
            //    totalParcial = totalParcial + (Convert.ToInt64(txtPrecioBebida.Text));

            // if (!string.IsNullOrEmpty(txtPrecioPostre.Text))
            //     totalParcial = totalParcial + (Convert.ToInt64(txtPrecioPostre.Text));

            // lblCalculoTotal.Text = "Precio Parcial a Pagar:  $" + totalParcial;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            LimpiarFormulario();
        }

        private void LimpiarFormulario()
        {
            txtFecha.Text = String.Empty;
            txtCliente.Text = String.Empty;
            ddlMenues.ClearSelection();
            ddlBebidas.ClearSelection();
            ddlPostres.ClearSelection();
            txtPrecioBebida.Text = String.Empty;
            txtPrecioMenu.Text = String.Empty;
            txtPrecioPostre.Text = String.Empty;
            lblCalculoTotal.Text = String.Empty;
        }
    }
}