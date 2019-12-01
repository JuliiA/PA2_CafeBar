using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CafeBar.Pages
{
    public partial class AltaPedido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HiddenField hidden = (HiddenField)ucForm.FindControl("hideID");
            hidden.Value = "0";

            Control control = (Control)ucForm.FindControl("divRegistrar");
            control.Visible = true;
        }
    }
}