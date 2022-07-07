<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="Recuperar_password.aspx.cs" Inherits="pap_Diogo.Recuperar_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <h1>Recuperar password</h1>

    <table class="table table-borderless">
        <tr>
            <th>Username</th>
            <td>
                <asp:TextBox runat="server" CssClass="form-control mr-3" Width="200" ID="textUsername"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <th></th>
            <td>
                <asp:Button type="submit" runat="server" ID="ButtonRecuperar" Text="Recuperar password" CssClass="btn btn-dark" OnClick="ButtonRecuperar_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
