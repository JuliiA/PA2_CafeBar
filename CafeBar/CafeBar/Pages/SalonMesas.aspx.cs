using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CafeBar.Pages
{
    public partial class SalonMesas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //
            // servicio.mesa.validarSiHayPedidoPendiente()
           if (!IsPostBack) { cargarMenues(); }
        }
        
        protected void btnTodosLosPedidos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/ControlPedidos.aspx");
        }

        protected void btnConfirmarPrecios_Click(object sender, EventArgs e)
        {
            List<Negocio.CoreServicio.Opcion> t = Session["losMenues"] as List<Negocio.CoreServicio.Opcion>;
            
            List<Negocio.CoreServicio.Opcion> list = new List<Negocio.CoreServicio.Opcion>();

            foreach (GridViewRow row in gvMenues.Rows)
            {
                var id = row.FindControl("hdId") as TextBox;
                var nombre = row.FindControl("txtNombre") as TextBox;
                var precio = row.FindControl("txtPrecio") as TextBox;
                var tipo = row.FindControl("ddlTipo") as DropDownList;
                var chk = row.FindControl("CheckBox1") as CheckBox;

                Negocio.CoreServicio.Opcion opUpd = new Negocio.CoreServicio.Opcion()
                {
                    Id = int.Parse(id.Text),
                    Nombre = nombre.Text,
                    Precio = long.Parse(precio.Text),
                    Tipo = int.Parse(tipo.SelectedItem.Value),
                    Baja = chk.Checked
                };
                
                var item = t.Where(x => x.Id == Convert.ToInt32(opUpd.Id)).FirstOrDefault();

                if (!(item.Nombre == opUpd.Nombre && item.Precio == opUpd.Precio && item.Tipo == opUpd.Tipo && item.Baja == opUpd.Baja))
                {
                    list.Add(opUpd);
                }
                
                
            }

            Negocio.CoreServicio.ActualizarMenues(list);
            cargarMenues();
        }

        protected void lnkEditar_Click(object sender, EventArgs e)
        {
            //grillaMenúes.Visible = true;
            cargarMenues();
        }

        private void cargarMenues()
        {
            var todos = Negocio.CoreServicio.GetMenu();
            Session["losMenues"] = todos;
            gvMenues.DataSource = todos;
            gvMenues.DataBind();

        }

        protected void btnOcultarGrilla_Click(object sender, EventArgs e)
        {
            // grillaMenúes.Visible = false;
        }
    }
}