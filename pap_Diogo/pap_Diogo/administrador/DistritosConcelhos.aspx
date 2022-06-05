<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="DistritosConcelhos.aspx.cs" Inherits="pap_Diogo.administrador.DistritosConcelhos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <table class="table table-borderless">
        <tr>
            <td>
                <h2>Distritos</h2>
                <asp:GridView ID="GridDistritos" runat="server" AutoGenerateSelectButton="true"  OnSelectedIndexChanged="GridDistritos_SelectedIndexChanged" OnRowDataBound="GridDistritos_RowDataBound"></asp:GridView>
                Distrito <asp:TextBox ID="textDistrito" runat="server"></asp:TextBox><br />
                <asp:Button ID="btnAdicionar" Text="Adicionar distrito" OnClick="btnAdicionar_Click" CssClass="btn btn-secondary rounded" runat="server"/>
                <asp:Button ID="btnEditar" Text="Editar distrito" OnClick="btnEditar_Click" CssClass="btn btn-secondary rounded" runat="server"/>
                <asp:Button ID="btnRemover" Text="Remover distrito" OnClick="btnRemover_Click" CssClass="btn btn-secondary rounded" runat="server"/>
            </td>
            <td>
                <h2>Concelhos</h2>
                <asp:GridView ID="GridConcelhos" runat="server" AutoGenerateSelectButton="true" OnSelectedIndexChanged="GridConcelhos_SelectedIndexChanged" OnRowDataBound="GridConcelhos_RowDataBound"></asp:GridView>
                Concelho <asp:TextBox ID="textConcelho" runat="server"></asp:TextBox><br />
                <asp:Button ID="btnAdicionarConcelho" Text="Adicionar Concelho" OnClick="btnAdicionarConcelho_Click"  CssClass="btn btn-secondary rounded" runat="server"/>
                <asp:Button ID="btnEditarConcelho" Text="Editar Concelho" OnClick="btnEditarConcelho_Click"  CssClass="btn btn-secondary rounded" runat="server"/>
                <asp:Button ID="btnRemoverConcelho" Text="Remover Concelho" OnClick="btnRemoverConcelho_Click" CssClass="btn btn-secondary rounded" runat="server"/>
            </td>
        </tr>
    </table>
</asp:Content>
