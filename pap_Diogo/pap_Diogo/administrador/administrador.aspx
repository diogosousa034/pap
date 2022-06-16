<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="administrador.aspx.cs" Inherits="pap_Diogo.administrador.administrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <h1 class="display-1 mt-border-4 text-danger fw-bolder">Administrador</h1>
    <asp:HyperLink runat="server" NavigateUrl="~/administrador/DistritosConcelhos.aspx" >Editar distritos e concelhos</asp:HyperLink>

</asp:Content>
