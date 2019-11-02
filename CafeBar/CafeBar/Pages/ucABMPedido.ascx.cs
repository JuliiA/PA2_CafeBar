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
            if (!Page.IsPostBack) {
                cargaMenuesEnDDL();
                cargaBebidasEnDDL();
                cargarPostresEnDDL();
            }
        }

        private void cargarPostresEnDDL()
        {
            ddlPostres.DataValueField = "Precio";
            ddlPostres.DataTextField = "Nombre";

            var listaPostre = CoreServicio.GetPostre();

            ddlPostres.DataSource = listaPostre;
            ddlPostres.DataBind();
        }

        private void cargaBebidasEnDDL()
        {
            ddlBebidas.DataValueField = "Precio";
            ddlBebidas.DataTextField = "Nombre";
            var listaBebida = CoreServicio.GetBebidas();
            ddlBebidas.DataSource = listaBebida;
            ddlBebidas.DataBind();
        }

        private void cargaMenuesEnDDL()
        {
            ddlMenues.DataValueField = "Precio";
            ddlMenues.DataTextField = "Nombre";
            var listaMenu = CoreServicio.GetMenu();

            ddlMenues.DataSource = listaMenu;
            ddlMenues.DataBind();
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            
        }

        protected void ddlBebidas_SelectedIndexChanged(object sender, EventArgs e)
        {
            var valor = ddlBebidas.SelectedItem.Value;
            txtPrecioBebida.Text = valor;
            //txtPrecioBebida.Enabled = false;
            totalParcial = totalParcial + Convert.ToInt64(valor);
        }

        protected void ddlMenues_SelectedIndexChanged(object sender, EventArgs e)
        {
            var valor = ddlMenues.SelectedItem.Value;
            txtPrecioMenu.Text = valor;
            //txtPrecioMenu.Enabled = false;
            totalParcial = totalParcial + Convert.ToInt64(valor);
            
        }

        protected void ddlPostres_SelectedIndexChanged(object sender, EventArgs e)
        {
            var valor = ddlPostres.SelectedItem.Value;
            txtPrecioPostre.Text = valor;
            // txtPrecioPostre.Enabled = false;
            totalParcial = totalParcial + Convert.ToInt64(valor);
        }

        protected void lnkCalcular_Click(object sender, EventArgs e)
        {
            totalParcial = (Convert.ToInt64(txtPrecioMenu.Text) + Convert.ToInt64(txtPrecioBebida.Text) + Convert.ToInt64(txtPrecioPostre.Text));
            lblCalculoTotal.Text = "$" + totalParcial;
        }

    }
}