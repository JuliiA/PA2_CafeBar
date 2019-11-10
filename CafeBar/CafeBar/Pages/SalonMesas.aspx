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

      </div>
    </div>
  </section>
  <!--/ menu -->
  <section id="about" class="section-padding">
    <div class="container">
      <div class="row">
        <div class="col-md-12 text-center marb-35">
            <a href="ControlPedidos.aspx" class="btn btn-lg btn-warning"> VER TODOS LOS PEDIDOS</a> 
        </div>
      </div>
    </div>
  </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftColumnContent" Runat="Server">
   <uc:Pedido ID="ucForm" runat="server"></uc:Pedido>
</asp:Content>