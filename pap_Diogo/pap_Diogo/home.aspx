<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="pap_Diogo.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    
    <h1 class="display-6 mt-4">home page</h1>

    <div>
        <asp:DataList ID="DataListAnimais" runat="server" DataKeyField="ID_animal" DataSourceID="SqlDataSource1" RepeatColumns="2" RepeatDirection="Horizontal">
            <ItemTemplate>
                <asp:Label ID="ID_animalLabel" runat="server" Text='<%# Eval("ID_animal") %>' Visible="false" />
                <br />
                <asp:Image ID="Image2" runat="server" Height="250px" ImageUrl='<%# Eval("Foto") %>' Width="250px" />
                <br />
                <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' />
                <br />
                Raça:
                <asp:Label ID="RaçaLabel" runat="server" Text='<%# Eval("Raça") %>' />
                <br />                
                Género:
                <asp:Label ID="GéneroLabel" runat="server" Text='<%# Eval("Género") %>' />
                <br />
                Porte:
                <asp:Label ID="PorteLabel" runat="server" Text='<%# Eval("Porte") %>' />
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ID_animal], [Nome], [Raça], [Foto], [Género], [Porte] FROM [Animal]"></asp:SqlDataSource>

        <asp:LinkButton runat="server" ID="linkPrimeira1" OnClick="linkPrimeira1_Click">Primeiro</asp:LinkButton>
        <asp:LinkButton runat="server" ID="linkAnterior1" OnClick="linkAnterior1_Click">Anterior</asp:LinkButton>
        <asp:LinkButton runat="server" ID="linkSeguinte1" OnClick="linkSeguinte1_Click">Seguinte</asp:LinkButton>
        <asp:LinkButton runat="server" ID="linkUltimo1" OnClick="linkUltimo1_Click">Último</asp:LinkButton>
        
    </div>
    
</asp:Content>
