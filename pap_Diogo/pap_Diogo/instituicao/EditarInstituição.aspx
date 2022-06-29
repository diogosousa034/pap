<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="EditarInstituição.aspx.cs" Inherits="pap_Diogo.instituicao.EditarInstituição" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">   
    <div class="col-6">
        <h2>Editar perfil de instituição</h2>
        <table class="table table-borderless">
            <tr>
                <th>Nome:</th>
                <td>
                    <asp:TextBox CssClass="form-control" Width="250" ID="textNome" runat="server" /></td>
            </tr>
            <tr>
                <th>Morada:</th>
                <td>
                    <asp:TextBox CssClass="form-control" Width="250" ID="textMorada" runat="server" /></td>
            </tr>
            <tr>
                <th>Localidade:</th>
                <td>
                    <asp:TextBox CssClass="form-control" Width="150" ID="textLocalidade" runat="server" /></td>
            </tr>
            <tr>
                <th>Código postal:</th>
                <td>
                    <asp:TextBox CssClass="form-control" Width="100" ID="textCodigoPostal" runat="server" /></td>
            </tr>
            <tr>
                <th>Telefone:</th>
                <td>
                    <asp:TextBox CssClass="form-control" Width="110" ID="textTelefone" runat="server" /></td>
            </tr>
            <tr>
                <th>Telemóvel:</th>
                <td>
                    <asp:TextBox CssClass="form-control" Width="110" ID="textTelemovel" runat="server" /></td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>
                    <asp:TextBox CssClass="form-control" Width="250" ID="textEmail" runat="server" /></td>
            </tr>
            <tr>
                <th>URL:</th>
                <td>
                    <asp:TextBox CssClass="form-control" Width="250" ID="textURL" runat="server" /></td>
            </tr>
            <tr>
                <th>3 Words</th>
                <td>
                    <asp:TextBox CssClass="form-control" Width="250" ID="text3Words" runat="server" /></td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList CssClass="form-select" Width="250" ID="DropDownDistritos" runat="server" AutoPostBack="True" DataSourceID="SqlDistrito" DataTextField="Nome" DataValueField="ID"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDistrito" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Nome], [ID] FROM [Distrito] ORDER BY [Nome]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:DropDownList CssClass="form-select" Width="250" ID="DropDownConcelhos" runat="server" DataSourceID="SqlDConcelhos" DataTextField="Nome" DataValueField="ID"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDConcelhos" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ID], [Nome] FROM [Concelho] WHERE ([Distrito] = @Distrito) ORDER BY [Nome]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownDistritos" Name="Distrito" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td></td>
                <td class="d-flex justify-content-center">
                    <asp:Button ID="btnEditar" Width="250" runat="server" OnClick="btnEditar_Click" Text="Editar" CssClass="btn btn-outline-success" />
                </td>
            </tr>
        </table>
    </div>
    <div class="col-6">
        <asp:ChangePassword ID="ChangePassword1" runat="server">
        </asp:ChangePassword>
    </div>
</asp:Content>
