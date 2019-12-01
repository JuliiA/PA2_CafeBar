<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/SiteCafeBar.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="SalonMesas.aspx.cs" Inherits="CafeBar.Pages.SalonMesas" %>
<%@Register TagPrefix="uc" TagName="Pedido" Src="~/Pages/ucABMPedido.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title> .:. Home .:. </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <!-- menu -->
  <section id="menu-list" class="section-padding">
    <div class="container">
      <div class="row">
        <div class="col-md-12 text-center marb-35">
          <h1 class="header-h">Menu List</h1>
          <%--<p class="header-p">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy
            <br>nibh euismod tincidunt ut laoreet dolore magna aliquam. </p>--%>
        </div>

        <div class="col-md-12  text-center" id="menu-flters">
          <ul>
            <li><a class="filter active" data-filter=".menu-restaurant">Ver Todo</a></li>
            <li><a class="filter" data-filter=".breakfast">Desayuno</a></li>
            <li><a class="filter" data-filter=".lunch">Almuerzo</a></li>
            <li><a class="filter" data-filter=".dinner">Cena</a></li>
          </ul>
        </div>

        <div id="menu-wrapper">

          <div class="breakfast menu-restaurant">
            <span class="clearfix">
              <a class="menu-title" href="#" data-meal-img="assets/img/restaurant/rib.jpg">Desayuno #1</a>
              <span style="left: 166px; right: 44px;" class="menu-line"></span>
              <span class="menu-price">$120.00</span>
            </span>
            <span class="menu-subtitle">Café + Leche + Medialunas</span>
          </div>

          <div class="breakfast menu-restaurant">
            <span class="clearfix">
              <a class="menu-title" href="#" data-meal-img="assets/img/restaurant/rib.jpg">Desayuno #2</a>
              <span style="left: 166px; right: 44px;" class="menu-line"></span>
              <span class="menu-price">$150.00</span>
            </span>
            <span class="menu-subtitle">Capuccino + Tostado</span>
          </div>

          <div class="breakfast menu-restaurant">
            <span class="clearfix">
              <a class="menu-title" href="#" data-meal-img="assets/img/restaurant/rib.jpg">Desayuno #3</a>
              <span style="left: 166px; right: 44px;" class="menu-line"></span>
              <span class="menu-price">$140.00</span>
            </span>
            <span class="menu-subtitle">Té (o jugo) + Tostado</span>
          </div>

          <div class="breakfast menu-restaurant">
            <span class="clearfix">
              <a class="menu-title" href="#" data-meal-img="assets/img/restaurant/rib.jpg">Desayuno #4</a>
              <span style="left: 166px; right: 44px;" class="menu-line"></span>
              <span class="menu-price">$80.00</span>
            </span>
            <span class="menu-subtitle">Café solo</span>
          </div>
            
          <div class="lunch menu-restaurant">
            <span class="clearfix">
              <a class="menu-title" href="#" data-meal-img="assets/img/restaurant/rib.jpg">Almuerzo #1</a>
              <span style="left: 166px; right: 44px;" class="menu-line"></span>
              <span class="menu-price">$160.00</span>
            </span>
            <span class="menu-subtitle">Tallarines</span>
          </div>

          <div class="lunch menu-restaurant">
            <span class="clearfix">
              <a class="menu-title" href="#" data-meal-img="assets/img/restaurant/rib.jpg">Almuerzo #2</a>
              <span style="left: 166px; right: 44px;" class="menu-line"></span>
              <span class="menu-price">$150.00</span>
            </span>
            <span class="menu-subtitle">Tarta</span>
          </div>

          <div class="lunch menu-restaurant">
            <span class="clearfix">
              <a class="menu-title" href="#" data-meal-img="assets/img/restaurant/rib.jpg">Almuerzo #3</a>
              <span style="left: 166px; right: 44px;" class="menu-line"></span>
              <span class="menu-price">$150.00</span>
            </span>
            <span class="menu-subtitle">Lasagna</span>
          </div>
            
          <div class="dinner menu-restaurant">
            <span class="clearfix">
              <a class="menu-title" href="#" data-meal-img="assets/img/restaurant/rib.jpg">Cena #1</a>
              <span style="left: 166px; right: 44px;" class="menu-line"></span>
              <span class="menu-price">$180.00</span>
            </span>
            <span class="menu-subtitle">Arroz Con Pollo</span>
          </div>

          <div class="dinner menu-restaurant">
            <span class="clearfix">
              <a class="menu-title" href="#" data-meal-img="assets/img/restaurant/rib.jpg">Cena #2</a>
              <span style="left: 166px; right: 44px;" class="menu-line"></span>
              <span class="menu-price">$190.00</span>
            </span>
            <span class="menu-subtitle">Milanesa + Guarnicion</span>
          </div>

          <div class="dinner menu-restaurant">
            <span class="clearfix">
              <a class="menu-title" href="#" data-meal-img="assets/img/restaurant/rib.jpg">Cena #3</a>
              <span style="left: 166px; right: 44px;" class="menu-line"></span>
              <span class="menu-price">$150.00</span>
            </span>
            <span class="menu-subtitle">Lasagna</span>
          </div>
        </div>
          <!-- edicion de datos del menu -->
          <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title">Editar Datos del Menú</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                        <asp:GridView ID="gvMenues" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Id" Visible="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="hdId" runat="server" Visible="false" Text='<%# Eval("Id") %>'></asp:TextBox>
                                        <%--<asp:HiddenField ID="hdId" runat="server" Value='<%# Eval("Id") %>'/>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtNombre" runat="server" Text='<%# Eval("Nombre") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Precio">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtPrecio" runat="server" Text='<%# Eval("Precio") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Tipo">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlTipo" runat="server" SelectedValue='<%# Eval("Tipo") %>'>
                                            <asp:ListItem Text="Desayuno" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Almuerzo" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Cena" Value="3"></asp:ListItem>
                                        </asp:DropDownList>
                                     </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mostrar">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("Baja") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>  
                        </asp:GridView>
                    </div>
                  <div class="modal-footer">
                        <asp:Button ID="btnConfirmarPrecios" runat="server" CssClass="btn btn-read-more" Text="Confirmar Cambios" CausesValidation="false" OnClick="btnConfirmarPrecios_Click" />
                        <asp:Button ID="btnOcultarGrilla" runat="server" CssClass="btn btn-default" Text="Cancelar" CausesValidation="false" OnClick="btnOcultarGrilla_Click" />
                 </div>
                </div>
              </div>
            </div>

            <br />
            <!-- AREA DE BOTONES EDICION MENU -->
          <%--<asp:LinkButton ID="lnkEditar" CssClass="btn btn-default" data-toggle="modal" data-target="#dataRegister" runat="server" CausesValidation="false" OnClick="lnkEditar_Click"><i class="fa fa-list-alt"></i>Editar Precios del Menú</asp:LinkButton>--%>
            <asp:LinkButton ID="lnkEditar" CssClass="btn btn-default" data-toggle="modal" data-target="#exampleModal" runat="server" CausesValidation="false"><i class="fa fa-list-alt"></i>Editar Precios del Menú</asp:LinkButton>
            <asp:LinkButton ID="lnkAgrear" CssClass="btn btn-default" runat="server" CausesValidation="false"><i class="fa fa-plus-circle"></i> Agregar Menú</asp:LinkButton>

      </div>
    </div>
  </section>
  <!--/ menu -->
  <section id="about" class="section-padding">
    <div class="container">
      <div class="row">
        <div class="col-md-12 text-center marb-35">
            <a href="ControlPedidos.aspx" class="btn btn-lg btn-warning"> VER TODOS LOS PEDIDOS</a> 
            <a href="AltaPedido.aspx" class="btn btn-lg btn-warning"> CREAR NUEVO PEDIDO</a> 
        </div>
      </div>
    </div>
  </section>
</asp:Content>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="LeftColumnContent" Runat="Server">
   <uc:Pedido ID="ucForm" runat="server"></uc:Pedido>
</asp:Content>--%>