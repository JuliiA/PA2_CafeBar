<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/SiteCafeBar.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="ControlPedidos.aspx.cs" Inherits="CafeBar.Pages.ControlPedidos" %>
<%@Register TagPrefix="uc" TagName="Pedido" Src="~/Pages/ucABMPedido.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section id="event">
    <div class="bg-color section-padding">
      <div class="container">
        <div class="row">
          <div class="col-xs-12 text-center" style="padding:60px;">
            <h1 class="header-h">Todos los Pedidos</h1>
            <p class="header-p">Los que se muestran son los que están pendientes de entregar</p>
          </div>
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
                                <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                                <asp:BoundField DataField="Cliente" HeaderText="Cliente" />
                                <asp:BoundField DataField="Estado" HeaderText="Estado" />
                                <asp:ButtonField CommandName="cmdEditar" ControlStyle-CssClass="btn btn-info" Text="Editar" />
                                <asp:ButtonField CommandName="cmdVer" ControlStyle-CssClass="btn btn-warning" Text="Ver" />
                                <asp:ButtonField CommandName="cmdEliminar" ControlStyle-CssClass="btn btn-danger" Text="Borrar" />
                                <asp:ButtonField HeaderText="Cambiar Estado" CommandName="cmdCambiar" runat="server" ControlStyle-CssClass="btn btn-success" Text="<i class='glyphicon glyphicon-check'></i>"></asp:ButtonField>
                                   
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
        </div>
      </div>
    </div>
  </section>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftColumnContent" runat="server">
    <div id="contieneFormUC" runat="server" visible="false">
        <uc:Pedido ID="modifPedido" runat="server" />
    </div>
</asp:Content>
