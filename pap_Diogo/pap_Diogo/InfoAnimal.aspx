<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="InfoAnimal.aspx.cs" Inherits="pap_Diogo.InfoAnimal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <asp:Image Width="250" Height="210" ID="AnimalImageView" runat="server" />
    <asp:Label ID="textNome" runat="server"></asp:Label>
    <asp:Label ID="textGénero" runat="server"></asp:Label>
    <asp:Label ID="textIdade" runat="server"></asp:Label>
    <asp:Label ID="textPorte" runat="server"></asp:Label>
    <asp:Label ID="textCaracteristicas" runat="server"></asp:Label>
    <asp:Label ID="textTipo" runat="server"></asp:Label>
    <asp:Label ID="textRaça" runat="server"></asp:Label>
    <asp:Label ID="textCor" runat="server"></asp:Label>
    <br />
    Desparazitado: 
    <br />
    <asp:CheckBox ID="CheckDesparazitado" runat="server" />
    <asp:Label ID="textVacinas" runat="server"></asp:Label>
    <br />
    Esterelizado: 
    <br />
    <asp:CheckBox ID="CheckEsterelizado" runat="server" />
    <asp:Label ID="textDescricao" runat="server"></asp:Label>
    <asp:Label ID="textConcelho" runat="server"></asp:Label>



</asp:Content>
