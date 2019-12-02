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
           if (!IsPostBack) {
                cargarMenues();
            }
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
            dibujarMenuDinamico(todos);

            //Para la grilla Modal
            Session["losMenues"] = todos;
            gvMenues.DataSource = todos;
            gvMenues.DataBind();

        }

        private void dibujarMenuDinamico(object todos)
        {
           var losMenues = todos as List<Negocio.CoreServicio.Opcion>;
            string htmlConcat = string.Empty;

            foreach (var item in losMenues.Where(m => m.Baja == true).ToList())
            {
                switch (item.Tipo)
                {
                    case 1: htmlConcat = htmlConcat + @"<div class='breakfast menu-restaurant'> 
                                            <span class='clearfix'>
                                                <a class='menu-title' href='#' data-meal-img='assets/img/restaurant/rib.jpg'>Desayuno #" + item.Id + "</a>" +
                                                "<span style='left: 166px; right: 44px;' class='menu-line'></span><span class='menu-price'>$" + item.Precio + "</span>" +
                                                "</span><span class='menu-subtitle'>" + item.Nombre + "</span></div>"; break;
                    case 2: htmlConcat = htmlConcat + @"<div class='lunch menu-restaurant'><span class='clearfix'><a class='menu-title' href='#' data-meal-img='assets/img/restaurant/rib.jpg'>Almuerzo #"+item.Id+"</a>" +
                            "<span style='left: 166px; right: 44px;' class='menu-line'></span><span class='menu-price'>$"+item.Precio+"</span></span>" +
                            "<span class='menu-subtitle'>"+item.Nombre+"</span></div>";
                        break;

                    case 3: htmlConcat = htmlConcat + @"<div class='dinner menu-restaurant'><span class='clearfix'><a class='menu-title' href='#' data-meal-img='assets/img/restaurant/rib.jpg'>Cena #"+item.Id+"</a>" +
                            "<span style='left: 166px; right: 44px;' class='menu-line'></span>" +
                            "<span class='menu-price'>$"+item.Precio+"</span></span>" +
                            "<span class='menu-subtitle'>"+item.Nombre+"</span></div>";
                        break;
                }
            }

            lblMenuDinamico.Text = htmlConcat;
        }

        protected void btnOcultarGrilla_Click(object sender, EventArgs e)
        {
            // grillaMenúes.Visible = false;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Negocio.CoreServicio.Opcion nuevoMenu = new Negocio.CoreServicio.Opcion();
            nuevoMenu.Nombre = txtAddMenu.Text;
            nuevoMenu.Precio = long.Parse(txtAddPrecio.Text);
            nuevoMenu.Tipo = int.Parse(ddlAddTipo.SelectedItem.Value);

            var accion = Negocio.CoreServicio.AgregarMenu(nuevoMenu);
            if (accion)
            {
                string script = @"<script type='text/javascript'>
                            alerta('El menu se agrego correctamente');
                        </script>";

                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
            else
            {
                string script = @"<script type='text/javascript'>
                            alerta('No se pudo agregar el menu');
                        </script>";

                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
        }
    }
}