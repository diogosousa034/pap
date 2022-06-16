<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="EditarInstituição.aspx.cs" Inherits="pap_Diogo.instituicao.EditarInstituição" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">   
    <div class="col-6">
        <h2>Editar perfil de instituição</h2>
        <table>
            <tr>
                <th>Nome:</th>
                <td>
                    <asp:TextBox ID="textNome" runat="server" /></td>
            </tr>
            <tr>
                <th>Morada:</th>
                <td>
                    <asp:TextBox ID="textMorada" runat="server" /></td>
            </tr>
            <tr>
                <th>Localidade:</th>
                <td>
                    <asp:TextBox ID="textLocalidade" runat="server" /></td>
            </tr>
            <tr>
                <th>Código postal:</th>
                <td>
                    <asp:TextBox ID="textCodigoPostal" runat="server" /></td>
            </tr>
            <tr>
                <th>Telefone:</th>
                <td>
                    <asp:TextBox ID="textTelefone" runat="server" /></td>
            </tr>
            <tr>
                <th>Telemóvel:</th>
                <td>
                    <asp:TextBox ID="textTelemovel" runat="server" /></td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>
                    <asp:TextBox ID="textEmail" runat="server" /></td>
            </tr>
            <tr>
                <th>URL:</th>
                <td>
                    <asp:TextBox ID="textURL" runat="server" /></td>
            </tr>
            <tr>
                <th>3 Words</th>
                <td>
                    <asp:TextBox ID="text3Words" runat="server" /></td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="DropDownDistritos" runat="server" AutoPostBack="True" DataSourceID="SqlDistrito" DataTextField="Nome" DataValueField="ID"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDistrito" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Nome], [ID] FROM [Distrito] ORDER BY [Nome]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownConcelhos" runat="server" DataSourceID="SqlDConcelhos" DataTextField="Nome" DataValueField="ID"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDConcelhos" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ID], [Nome] FROM [Concelho] WHERE ([Distrito] = @Distrito) ORDER BY [Nome]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownDistritos" Name="Distrito" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnEditar" runat="server" OnClick="btnEditar_Click" Text="Editar" CssClass="btn btn-primary" />
                </td>
            </tr>
        </table>
    </div>
    <div class="col-6">
        <asp:ChangePassword ID="ChangePassword1" runat="server">
        </asp:ChangePassword>
    </div>
</asp:Content>
