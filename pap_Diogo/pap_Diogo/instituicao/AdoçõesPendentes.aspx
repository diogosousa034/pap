<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="AdoçõesPendentes.aspx.cs" Inherits="pap_Diogo.instituicao.AdoçõesPendentes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="col-6">
        <h1 class="display-6">Adoções pendentes</h1>

        <asp:GridView class="table table-borderless" ID="GridAnimais" runat="server" AutoGenerateSelectButton="True" OnRowDataBound="GridAnimais_RowDataBound" OnSelectedIndexChanged="GridAnimais_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="ID_animal" DataSourceID="sqlAnimaisPendentes">
            <Columns>
                <asp:BoundField DataField="ID_animal" HeaderText="ID_animal" InsertVisible="False" ReadOnly="True" SortExpression="ID_animal" />
                <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                <asp:BoundField DataField="Raça" HeaderText="Raça" SortExpression="Raça" />
                <asp:BoundField DataField="Data" DataFormatString="{0:d}" HeaderText="Data" SortExpression="Data" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="sqlAnimaisPendentes" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT			A.ID_animal, A.Nome, T.Nome 'Tipo', R.Nome 'Raça', A.[Data de publicaçao] 'Data'
FROM			Animal A JOIN Instituiçao I ON A.Instituiçao = I.ID_Instituiçao
				JOIN Raça R ON A.Raça = R.ID_Raça
				JOIN Tipo T ON R.Tipo = T.ID_Tipo
WHERE			A.[Data adoçao] IS NULL AND A.Utilizador IS NULL AND I.ID_Instituiçao = @id
ORDER BY		A.Nome">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="user" />
            </SelectParameters>
        </asp:SqlDataSource>

        <h1 class="display-6">Utilizadores interessados</h1>

        <asp:GridView class="table table-borderless" runat="server" ID="gridUtilizadores" OnRowDataBound="gridUtilizadores_RowDataBound" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gridUtilizadores_SelectedIndexChanged" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID_Utilizador" DataSourceID="sqlUtilizadores">
            <Columns>
                <asp:BoundField DataField="ID_Utilizador" HeaderText="ID_Utilizador" ReadOnly="True" SortExpression="ID_Utilizador" />
                <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Data de registo" DataFormatString="{0:d}" HeaderText="Data de registo" SortExpression="Data de registo" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="sqlUtilizadores" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT			ID_Utilizador,Nome, Email, [Data de registo]
FROM			Utilizador
WHERE			ID_Utilizador IN(SELECT Utilizador FROM Utilizador_Animal UA WHERE UA.Animal = @id_animal)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridAnimais" Name="id_animal" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div class="col-6">
        <h1 class="display-6">Informação do utilizador</h1>
        
        <table class="table table-borderless">
            <tr>
                <th>Nome:</th>
                <td><asp:Label ID="textNome" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th>Email:</th>
                <td><asp:Label ID="textEmail" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th>Telefone:</th>
                <td><asp:Label ID="textNumero" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th>Data de registo:</th>
                <td><asp:Label ID="textData" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th>Distrito:</th>
                <td><asp:Label ID="textDistrito" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th>Concelho:</th>
                <td><asp:Label ID="textConcelho" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td></td>
                <td><asp:Button runat="server" ID="btnDoar" CssClass="btn btn-primary rounded-pill" Text="Doar" OnClick="btnDoar_Click" /></td>
            </tr>
        </table>
    </div>

</asp:Content>
