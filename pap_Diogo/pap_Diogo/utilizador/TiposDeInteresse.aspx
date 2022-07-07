<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="TiposDeInteresse.aspx.cs" Inherits="pap_Diogo.utilizador.TiposDeInteresse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="d-flex justify-content-center">
        <div class="col-4">
            <h1 class="display-6">Interesse</h1>
            Distrito:<br />
            <asp:DropDownList CssClass="form-select w-100" runat="server" ID="dropDistritos" AutoPostBack="True" DataSourceID="SqlDistrito" DataTextField="Nome" DataValueField="ID">
                <asp:ListItem Value="0" Text="Qualquer distrito"></asp:ListItem>
            </asp:DropDownList>         
            <asp:SqlDataSource ID="SqlDistrito" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ID], [Nome] FROM [Distrito] ORDER BY [Nome]"></asp:SqlDataSource>
            <br />
            Concelho:<br />
            <asp:DropDownList CssClass="form-select w-100" runat="server" ID="dropConcelhos" AutoPostBack="True" DataSourceID="SqlConcelho" DataTextField="Nome" DataValueField="ID">
                <asp:ListItem Value="0" Text="Qualquer concelho"></asp:ListItem>
            </asp:DropDownList>         
            <asp:SqlDataSource ID="SqlConcelho" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ID], [Nome] FROM [Concelho] WHERE ([Distrito] = @Distrito) ORDER BY [Nome]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dropDistritos" Name="Distrito" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            Tipo<br />
            <asp:DropDownList CssClass="form-select w-100" runat="server" ID="dropTipos" AutoPostBack="True" DataSourceID="SqlTipo" DataTextField="Nome" DataValueField="ID_Tipo">
                <asp:ListItem Value="0" Text="Qualquer tipo"></asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlTipo" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ID_Tipo], [Nome] FROM [Tipo] ORDER BY [Nome]"></asp:SqlDataSource>
            <br />
            Raça:<br />
            <asp:DropDownList CssClass="form-select w-100" runat="server" ID="dropRaças" AutoPostBack="True" DataSourceID="SqlRaca" DataTextField="Nome" DataValueField="ID_Raça">
                <asp:ListItem Value="0" Text="Qualquer raça"></asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlRaca" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ID_Raça], [Nome] FROM [Raça] WHERE ([Tipo] = @Tipo) ORDER BY [Nome]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dropTipos" Name="Tipo" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            Idade:<br />
            <asp:DropDownList CssClass="form-select w-100" runat="server" ID="dropIdade" AutoPostBack="True">
                <asp:ListItem Value="0" Text="Qualquer idade"></asp:ListItem>
                <asp:ListItem Text="Bebé"></asp:ListItem>
                <asp:ListItem Text="Jovem"></asp:ListItem>
                <asp:ListItem Text="Adulto"></asp:ListItem>
                <asp:ListItem Text="Sénior"></asp:ListItem>
            </asp:DropDownList><br />
            Género:<br />
            <asp:DropDownList CssClass="form-select w-100" runat="server" ID="dropGenero" AutoPostBack="True">
                <asp:ListItem Value="0" Text="Qualquer género"></asp:ListItem>
                <asp:ListItem Text="Feminino"></asp:ListItem>
                <asp:ListItem Text="Masculino"></asp:ListItem>
            </asp:DropDownList><br />
            Porte:<br />
            <asp:DropDownList CssClass="form-select w-100" runat="server" ID="dropPorte" AutoPostBack="True">
                <asp:ListItem Value="0" Text="Qualquer porte"></asp:ListItem>
                <asp:ListItem Text="Pequeno"></asp:ListItem>
                <asp:ListItem Text="Médio"></asp:ListItem>
                <asp:ListItem Text="Grande"></asp:ListItem>
            </asp:DropDownList><br />
            <div class="d-flex justify-content-center mb-3">
                <asp:Button runat="server" CssClass="btn btn-outline-secondary" ID="btnGuardar" Text="Guardar" OnClick="btnGuardar_Click"/>
            </div>
        </div>
    </div>
</asp:Content>
