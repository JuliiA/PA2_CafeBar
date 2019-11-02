<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucABMPedido.ascx.cs" Inherits="CafeBar.Pages.ucABMPedido" %>
<script type="text/javascript">
    function lnkCalcular() {
        alert("calcular");///llamar a metodo en codebehind
    }
</script>  

<!-- contact -->
  <section id="contact" class="section-padding">
    <div class="container">
      <div class="row">
        <div class="col-md-12 text-center">
          <h1 class="header-h">Ingresaremos tu pedido</h1>
          <p class="header-p">Podés elegir de nuestro menú más arriba
            <br>Elegí entre desayuno, almuerzo o cena! </p>
        </div>
      </div>
      <div class="row msg-row">
        <div class="col-md-4 col-sm-4 mr-15">
          <div class="media-2">
            <div class="media-left">
              <div class="contact-phone bg-1 text-center"><span class="phone-in-talk fa fa-phone"></span></div>
            </div>
            <div class="media-body">
              <h4 class="dark-blue regular">Phone Numbers</h4>
              <p class="light-blue regular alt-p">+440 875369208 - <span class="contacts-sp">Phone Booking</span></p>
            </div>
          </div>
          <div class="media-2">
            <div class="media-left">
              <div class="contact-email bg-14 text-center"><span class="hour-icon fa fa-clock-o"></span></div>
            </div>
            <div class="media-body">
              <h4 class="dark-blue regular">Opening Hours</h4>
              <p class="light-blue regular alt-p"> Monday to Friday 09.00 - 24:00</p>
              <p class="light-blue regular alt-p">
                Friday and Sunday 08:00 - 03.00
              </p>
            </div>
          </div>
        </div>
        <div class="col-md-8 col-sm-8">
          <form action="" method="post" role="form" class="contactForm">
            <div id="sendmessage"></div>
            <div id="errormessage"></div>

            <div class="col-md-6 col-sm-6 contact-form pad-form">
              <div class="form-group label-floating is-empty">
                <input type="date" class="form-control label-floating is-empty" runat="server" name="txtFecha" id="txtFecha" placeholder="Date" data-rule="required" data-msg="This field is required" />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtFecha" ForeColor="#990000"></asp:RequiredFieldValidator>
                  <div class="validation"></div>
              </div>
            </div>
            <div class="col-md-6 col-sm-6 contact-form">
              <div class="form-group">
                <%--<input type="text" name="txtCliente" class="form-control" id="txtCliente" placeholder="Cliente" data-rule="minlen:4" data-msg="Por favor ingrese un cliente a quien facturar" />--%>
                  <asp:TextBox ID="txtCliente" runat="server" Placeholder="Cliente" CssClass="form-control"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCliente" ErrorMessage="Solo se permite texto" ValidationExpression="^[a-zA-Z ]*$" ForeColor="#990000"></asp:RegularExpressionValidator>
                  <div class="validation"></div>                
              </div>
            </div>

            <div class="col-md-6 col-sm-6 contact-form pad-form">
              <div class="form-group">
                  <asp:DropDownList ID="ddlMenues" CssClass="form-control label-floating is-empty" runat="server" data-msg="Seleccione uno de los items" OnSelectedIndexChanged="ddlMenues_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                <%--<input type="email" class="form-control label-floating is-empty" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />--%>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Esta opción es requerida" ControlToValidate="ddlMenues" ForeColor="#990000"></asp:RequiredFieldValidator>
                  <div class="validation"></div>
              </div>
            </div>
            <div class="col-md-6 col-sm-6 contact-form">
              <div class="form-group">
                <%--<input type="time" class="form-control label-floating is-empty" name="time" id="time" placeholder="Time" data-rule="required" data-msg="This field is required" />--%>
                  <asp:TextBox ID="txtPrecioMenu" runat="server" CssClass="form-control label-floating is-empty" Placeholder="$ Precio"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtPrecioMenu" ForeColor="#990000"></asp:RequiredFieldValidator>
                  <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="El monto ingresado no es válido" MaximumValue="1000" MinimumValue="0" ControlToValidate="txtPrecioMenu" Type="Double" ForeColor="#990000"></asp:RangeValidator>
                <div class="validation"></div>
              </div>
            </div>

            <div class="col-md-6 col-sm-6 contact-form pad-form">
              <div class="form-group">
                <%--<input type="text" class="form-control label-floating is-empty" name="phone" id="phone" placeholder="Phone" data-rule="required" data-msg="This field is required" />--%>
                  <asp:DropDownList ID="ddlBebidas" CssClass="form-control label-floating is-empty" runat="server" data-msg="Seleccione uno de los items" OnSelectedIndexChanged="ddlBebidas_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Esta opción es requerida" ControlToValidate="ddlBebidas" ForeColor="#990000"></asp:RequiredFieldValidator>
                <div class="validation"></div>
              </div>
            </div>
            <div class="col-md-6 col-sm-6 contact-form">
              <div class="form-group">
                <%--<input type="text" class="form-control label-floating is-empty" name="people" id="people" placeholder="People" data-rule="required" data-msg="This field is required" />--%>
                  <asp:TextBox ID="txtPrecioBebida" runat="server" CssClass="form-control label-floating is-empty" Placeholder="$ Precio"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtPrecioBebida" ForeColor="#990000"></asp:RequiredFieldValidator>
                  <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="El monto ingresado no es válido" MaximumValue="1000" MinimumValue="0" ControlToValidate="txtPrecioBebida" Type="Double" ForeColor="#990000"></asp:RangeValidator>
                <div class="validation"></div>
              </div>
            </div>
              
             <div class="col-md-6 col-sm-6 contact-form pad-form">
              <div class="form-group">
                <%--<input type="text" class="form-control label-floating is-empty" name="phone" id="phone" placeholder="Phone" data-rule="required" data-msg="This field is required" />--%>
                  <asp:DropDownList ID="ddlPostres" CssClass="form-control label-floating is-empty" runat="server" data-msg="Seleccione uno de los items" OnSelectedIndexChanged="ddlPostres_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Esta opción es requerida" ControlToValidate="ddlPostres" ForeColor="#990000"></asp:RequiredFieldValidator>
                <div class="validation"></div>
              </div>
            </div>
            <div class="col-md-6 col-sm-6 contact-form">
              <div class="form-group">
                <%--<input type="text" class="form-control label-floating is-empty" name="people" id="people" placeholder="People" data-rule="required" data-msg="This field is required" />--%>
                  <asp:TextBox ID="txtPrecioPostre" runat="server" CssClass="form-control label-floating is-empty" Placeholder="$ Precio"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtPrecioPostre" ForeColor="#990000"></asp:RequiredFieldValidator>
                  <asp:RangeValidator ID="RangeValidator3" runat="server" ErrorMessage="El monto ingresado no es válido" MaximumValue="1000" MinimumValue="0" ControlToValidate="txtPrecioPostre" Type="Double" ForeColor="#990000"></asp:RangeValidator>
                <div class="validation"></div>
              </div>
            </div>
            <div class="col-md-12 btnpad">
              <div class="contacts-btn-pad">
                  <asp:LinkButton ID="lnkCalcular" runat="server" CssClass="btn btn-md btn-warning" OnClientClick="javascript: lnkCalcular();">Calcular Total</asp:LinkButton>
              </div>
            </div>

            <div class="col-md-12 btnpad">
              <div class="form-group label-floating is-empty">
                  <asp:Label ID="lblCalculoTotal" runat="server" Text="$"></asp:Label>
              </div>

            </div>

           <div class="col-md-12 contact-form">
               <div class="form-group label-floating is-empty">
                   <asp:Label ID="lblFormato" runat="server" Text="Forma de Pago:"></asp:Label>
                </div>
               <div class="form-group label-floating is-empty">
                   <asp:RadioButtonList CssClass="form-control" ID="rdFormaPago" runat="server">
                       <asp:ListItem Selected="True" Value="1" Text="Efectivo"></asp:ListItem>
                       <asp:ListItem Value="2" Text="Tarjeta"></asp:ListItem>
                   </asp:RadioButtonList>
              </div>

            </div>

            <div class="col-md-12 contact-form">
                <div class="col-md-5 btnpad"> 
                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar Pedido" CssClass="btn btn-imfo btn-read-more" OnClick="btnRegistrar_Click"/> 
                </div>
                <div class="col-md-5 btnpad"> 
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-default btn-read-more"/> 
                </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
  <!-- / contact -->
