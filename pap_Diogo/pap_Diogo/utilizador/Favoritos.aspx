<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="pap_Diogo.utilizador.Favoritos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="d-flex justify-content-center">
            <asp:GridView CssClass="table table-borderless" GridLines="None" ID="GridFavoritos" AutoGenerateSelectButton="true" OnRowDataBound="GridFavoritos_RowDataBound" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_animal" DataSourceID="SqlFavoritos" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="ID_animal" HeaderText="ID_animal" InsertVisible="False" ReadOnly="True" SortExpression="ID_animal" />
            <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
            <asp:BoundField DataField="Género" HeaderText="Género" SortExpression="Género" />
            <asp:BoundField DataField="Idade" HeaderText="Idade" SortExpression="Idade" />
            <asp:BoundField DataField="Raça" HeaderText="Raça" SortExpression="Raça" />
            <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
            <asp:BoundField DataField="Distrito" HeaderText="Distrito" SortExpression="Distrito" />
            <asp:BoundField DataField="Concelho" HeaderText="Concelho" SortExpression="Concelho" />
        </Columns>
                <SelectedRowStyle BackColor="#CDD1D1" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlFavoritos" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT A.ID_animal, A.Nome, A.Género, A.Idade, R.Nome 'Raça', T.Nome 'Tipo', D.Nome 'Distrito', C.Nome 'Concelho'
FROM Favoritos F JOIN Animal A ON F.Animal = A.ID_animal 
JOIN Utilizador U ON F.Utilizador = U.ID_Utilizador
JOIN Raça R ON A.Raça = R.ID_Raça
JOIN Tipo T ON R.Tipo = T.ID_Tipo
JOIN Concelho C ON A.Concelho = C.ID
JOIN Distrito D ON C.Distrito = D.ID
WHERE F.Utilizador = @id">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="User" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
    <div class="d-flex justify-content-center mt-3">
        <asp:Button runat="server" ID="btnAnimal" OnClick="btnAnimal_Click" Text="Ir para página do animal" CssClass="btn btn-outline-secondary" />
    </div>
    <div class="d-flex justify-content-center mt-3">
        <asp:Button runat="server" ID="btnRemover" OnClick="btnRemover_Click" Text="Remover dos favoritos" CssClass="btn btn-outline-danger" />
    </div>
</asp:Content>
