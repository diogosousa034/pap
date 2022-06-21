<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="AdoçõesConfirmadas.aspx.cs" Inherits="pap_Diogo.instituicao.AdoçõesConfirmadas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-6">
            <h1 class="display-6">Animais para entraga</h1>
            <asp:GridView ID="GridAnimais" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridAnimais_SelectedIndexChanged" OnRowDataBound="GridAnimais_RowDataBound" AutoGenerateColumns="False" DataKeyNames="ID_animal" DataSourceID="SqlAnimais" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="ID_animal" HeaderText="ID_animal" InsertVisible="False" ReadOnly="True" SortExpression="ID_animal" />
                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                    <asp:BoundField DataField="Género" HeaderText="Género" SortExpression="Género" />
                    <asp:BoundField DataField="Idade" HeaderText="Idade" SortExpression="Idade" />
                    <asp:BoundField DataField="Utilizador" HeaderText="Utilizador" SortExpression="Utilizador" />
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                    <asp:BoundField DataField="Raça" HeaderText="Raça" SortExpression="Raça" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlAnimais" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT A.[ID_animal], A.[Nome], A.[Género], A.[Idade], A.[Utilizador], T.Nome 'Tipo', R.Nome 'Raça' FROM [Animal] A JOIN Raça R ON A.Raça = R.ID_Raça JOIN Tipo T ON R.Tipo = T.ID_Tipo WHERE (([Data de adoção final] IS NULL) AND ([Data adoçao] IS NOT NULL) AND ([Instituiçao] = @Instituiçao)) ORDER BY [Nome]">
                <SelectParameters>
                    <asp:SessionParameter Name="Instituiçao" SessionField="User" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="col-6 d-flex justify-content-end">
            <div>
                <h1 class="display-6">Informação do utilizador</h1>

                <table class="table table-borderless">
                    <tr>
                        <th class="text-end">Nome:</th>
                        <td>
                            <asp:Label ID="textNome" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-end">Email:</th>
                        <td>
                            <asp:Label ID="textEmail" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-end">Telefone:</th>
                        <td>
                            <asp:Label ID="textNumero" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-end">Data de registo:</th>
                        <td>
                            <asp:Label ID="textData" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-end">Distrito:</th>
                        <td>
                            <asp:Label ID="textDistrito" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-end">Concelho:</th>
                        <td>
                            <asp:Label ID="textConcelho" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button runat="server" ID="btnEntregue" CssClass="btn btn-outline-success rounded-pill" Text="Entregue" OnClick="btnEntregue_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
