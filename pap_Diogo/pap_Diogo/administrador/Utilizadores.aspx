<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="Utilizadores.aspx.cs" Inherits="pap_Diogo.administrador.Utilizadores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="col-6">
        <h1 class="display-6">Lista de utilizadores</h1>
        <asp:GridView CssClass="table table-borderless" GridLines="None" ID="GridUtilizadores" OnRowDataBound="GridUtilizadores_RowDataBound" OnSelectedIndexChanged="GridUtilizadores_SelectedIndexChanged" AutoGenerateSelectButton="True" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID_Utilizador" DataSourceID="SqlUtilizadores">
            <Columns>
                <asp:BoundField DataField="ID_Utilizador" HeaderText="ID_Utilizador" ReadOnly="True" SortExpression="ID_Utilizador" />
                <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                <asp:BoundField DataField="Telefone" HeaderText="Telefone" SortExpression="Telefone" />
                <asp:BoundField DataField="Data_de_registo" HeaderText="Data_de_registo" SortExpression="Data_de_registo" DataFormatString="{0:d}" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="Image2" runat="server" Height="20px" Width="20px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlUtilizadores" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT U.ID_Utilizador, U.Nome, U.Telefone, [Data de registo] AS Data_de_registo, US.UserName FROM [Utilizador] U JOIN Users US ON U.ID_Utilizador = US.UserId ORDER BY [Nome]"></asp:SqlDataSource>
    </div>
    <div class="col-6">
        <h1 class="display-6">Informação do utilizador</h1>

        <table class="table table-borderless">
            <tr>
                <th>Nome:</th>
                <td>
                    <asp:Label ID="textNome" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>
                    <asp:Label ID="textEmail" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <th>Telefone:</th>
                <td>
                    <asp:Label ID="textNumero" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <th>Data de registo:</th>
                <td>
                    <asp:Label ID="textData" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <th>Distrito:</th>
                <td>
                    <asp:Label ID="textDistrito" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <th>Concelho:</th>
                <td>
                    <asp:Label ID="textConcelho" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button runat="server" ID="btnAtivar" CssClass="btn btn-outline-success" Width="200" Text="Ativar" OnClick="btnAtivar_Click" />
                </td>
                <td>
                    <asp:Button runat="server" ID="btnDesativar" CssClass="btn btn-outline-danger" Width="200" Text="Desativar" OnClick="btnDesativar_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
