<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="AnimaisPendentes.aspx.cs" Inherits="pap_Diogo.utilizador.AnimaisPendentes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <h2>Animais pendentes</h2>

    <div class="col-6">
        <asp:GridView ID="GridAnimais" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridAnimais_RowDataBound" AutoGenerateSelectButton="true" DataKeyNames="ID_animal" DataSourceID="SqlAnimais" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="ID_animal" HeaderText="ID_animal" InsertVisible="False" ReadOnly="True" SortExpression="ID_animal" />
            <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
            <asp:BoundField DataField="Género" HeaderText="Género" SortExpression="Género" />
            <asp:BoundField DataField="Idade" HeaderText="Idade" SortExpression="Idade" />
            <asp:BoundField DataField="Porte" HeaderText="Porte" SortExpression="Porte" />
            <asp:BoundField DataField="Raça" HeaderText="Raça" SortExpression="Raça" />
        </Columns>
    </asp:GridView>
    
    <asp:SqlDataSource ID="SqlAnimais" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT			A.ID_animal, A.Nome, A.Género, A.Idade, A.Porte, R.Nome 'Raça'
FROM			Animal A JOIN Utilizador_Animal UA ON A.ID_animal = UA.Animal
				JOIN Utilizador U ON U.ID_Utilizador = UA.Utilizador
				JOIN Raça R ON A.Raça = R.ID_Raça
				WHERE U.ID_Utilizador = @id">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="user" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
    
</asp:Content>
