<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AltaPedido.aspx.cs" Inherits="CafeBar.Pages.AltaPedido" MasterPageFile="~/Pages/SiteCafeBar.Master" %>
<%@Register TagPrefix="uc" TagName="Pedido" Src="~/Pages/ucABMPedido.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
           #banner{ display: none;}
           #agenda{ width:20%}
    </style>
    <title> .:. Alta pedido .:. </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
   <uc:Pedido ID="ucForm" runat="server"></uc:Pedido>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftColumnContent" runat="server">
    <div id="mySidenav" class="sidenav" style="width: 250px;">
        
        <a href="ControlPedidos.aspx">Ver Pedidos</a>
                
        <a href="SalonMesas.aspx">Home</a>
                
    </div>
</asp:Content>