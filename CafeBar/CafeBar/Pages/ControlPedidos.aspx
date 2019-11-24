<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/SiteCafeBar.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="ControlPedidos.aspx.cs" Inherits="CafeBar.Pages.ControlPedidos" %>
<%@Register TagPrefix="uc" TagName="Pedido" Src="~/Pages/ucABMPedido.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section id="event">
    <div class="bg-color section-padding">
      <div class="container">
        <div class="row">
               <!-- Cabecera -->
              <div class="col-xs-12 text-center" style="padding:60px;">
                <h1 class="header-h">Todos los Pedidos</h1>
                <p class="header-p">Los que se muestran son los que están pendientes de entregar</p>
                  <br />
                  <a class="filter active btn btn-read-more" href="SalonMesas.aspx"> <i class="fa fa-list-ul"></i> Nuevo Pedido </a>
              </div>
              <!-- ENd Cabecera -->

              <!-- Filtros -->
              <div class="col-lg-9 details-text" style="margin-left:12%; margin-bottom:1%">
                <div class="col-md-3">
                     <h5><strong>Fecha</strong></h5>
                    <asp:DropDownList AutoPostBack="false" ID="ddlFechaFiltro" runat="server" CssClass="form-control" AppendDataBoundItems="True">
                        <asp:ListItem Text="Select All" Value="99" />
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                  <h5><strong>Cliente</strong></h5>
                    <asp:DropDownList AutoPostBack="false" ID="ddlClienteFiltro" runat="server" CssClass="form-control" AppendDataBoundItems="True">
                        <asp:ListItem Text="Select All" Value="99" />
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                  <h5><strong>Estado</strong></h5>
                    <asp:DropDownList AutoPostBack="false" ID="ddlEstadoFiltro" runat="server" CssClass="form-control" AppendDataBoundItems="True">
                        <asp:ListItem Text="Select All" Value="99" />
                    </asp:DropDownList>
                </div>
                <div class="col-md-1">
                    <br />
                    <asp:Button runat="server" ID="btnFiltrar" OnClick="btnFiltrar_Click" CssClass="btn btn-default" Text="Filtrar" />
                </div>
              </div>
               <!-- END Filtros-->
             <!-- Cuadro Pedidos -->
              <div class="col-md-12" style="padding-bottom:80px; color:#976868">
                <div class="item active left">
                  <div class="col-md-1 col-sm-1 left-images">
                    <%--<img src="img/res02.jpg" class="img-responsive">--%>
                  </div>
                  <div class="col-md-10 col-sm-10 details-text">
                    <div class="content-holder">
                        <div class="">
                            <asp:GridView runat="server" ID="grdPedidos" CssClass="table table-hover" AutoGenerateColumns="False" DataKeyNames="PedidoID" OnRowCommand="grdPedidos_RowCommand" OnRowDataBound="grdPedidos_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="PedidoID" HeaderText="PedidoID" Visible="False" />
                                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" SortExpression="Fecha"/>
                                    <asp:BoundField DataField="Cliente" HeaderText="Cliente" />
                                    <asp:BoundField DataField="Estado" HeaderText="Estado" />
                                    <asp:ButtonField CommandName="cmdEditar" ControlStyle-CssClass="btn btn-info" Text="<i class='fa fa-edit'></i>" />
                                    <asp:ButtonField CommandName="cmdVer" ControlStyle-CssClass="btn btn-warning" Text="<i class='fa fa-eye'></i>" />
                                    <asp:ButtonField CommandName="cmdEliminar" ControlStyle-CssClass="btn btn-danger" Text="<i class='fa fa-trash-o'></i>" />
                                    <asp:ButtonField HeaderText="Cerrar Pedido" CommandName="cmdCambiar" runat="server" ControlStyle-CssClass="btn btn-success" Text="<i class='fa fa-check-square'></i>"></asp:ButtonField>
                                   
                                </Columns>

                            </asp:GridView>
                        </div>
      <%--                <a class="btn btn-imfo btn-read-more" href="events-details.html">Read more</a>--%>
                    </div>
                  </div>
                </div>
                  <!-- -->
                <div id="panelVerPedido" runat="server" visible="false">
                    <asp:Label Id="lblPedido" runat="server" Text=""></asp:Label>
                </div>
              </div>
              <!-- END Cuadro Pedidos -->
       </div>
      </div>  <!-- end Container -->
    </div>
  </section>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftColumnContent" runat="server">
    <div id="contieneFormUC" runat="server" visible="false">
        <uc:Pedido ID="modifPedido" runat="server" />
    </div>
</asp:Content>
