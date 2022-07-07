<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="EditarUtilizador.aspx.cs" Inherits="pap_Diogo.utilizador.EditarUtilizador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="col-6">
        <h1 class="display-6">Editar dados</h1>

        <table class="table table-borderless">
            <tr>
                <th>Nome:</th>
                <td>
                    <asp:TextBox CssClass="form-control" ID="textNome" Width="250" runat="server" /></td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>
                    <asp:TextBox CssClass="form-control" ID="textEmail" Width="250" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <th>Telefone:</th>
                <td>
                    <asp:TextBox CssClass="form-control" ID="textTelefone" Width="110" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <th>Distrito</th>
                <td>
                    <asp:DropDownList CssClass="form-select" Width="200" ID="dropDownDistrito" runat="server" AutoPostBack="True" DataSourceID="SqlDistritos" DataTextField="Nome" DataValueField="ID"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDistritos" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Nome], [ID] FROM [Distrito] ORDER BY [Nome]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <th>Concelho</th>
                <td>
                    <asp:DropDownList CssClass="form-select" Width="200" ID="dropDownConcelho" runat="server" DataSourceID="SqlConcelho" DataTextField="Nome" DataValueField="ID"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlConcelho" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ID], [Nome] FROM [Concelho] WHERE ([Distrito] = @Distrito) ORDER BY [Nome]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="dropDownDistrito" Name="Distrito" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnEditarUSer" runat="server" OnClick="btnEditarUSer_Click" Text="Editar dados" CssClass="btn btn-primary rounded-pill" /></td>
            </tr>
        </table>
    </div>
    <div class="col-6">
        <h1 class="display-6">Alterar password</h1>
        <asp:ChangePassword ID="ChangePassword1" runat="server">

        </asp:ChangePassword>
    </div>

</asp:Content>
