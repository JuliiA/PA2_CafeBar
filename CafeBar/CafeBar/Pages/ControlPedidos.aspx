<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/SiteCafeBar.Master" AutoEventWireup="true" CodeBehind="ControlPedidos.aspx.cs" Inherits="CafeBar.Pages.ControlPedidos" %>
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
          <div class="col-md-12" style="padding-bottom:60px;">
            <div class="item active left">
              <div class="col-md-6 col-sm-6 left-images">
                <%--<img src="img/res02.jpg" class="img-responsive">--%>
              </div>
              <div class="col-md-6 col-sm-6 details-text">
                <div class="content-holder">
                  <asp:GridView runat="server" CssClass="table table-hover">

                  </asp:GridView>
                  <a class="btn btn-imfo btn-read-more" href="events-details.html">Read more</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftColumnContent" runat="server">
</asp:Content>
