<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="Adotados.aspx.cs" Inherits="pap_Diogo.utilizador.Adotados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="col-8">
        <asp:GridView CssClass="table table-borderless" GridLines="None" runat="server" OnSelectedIndexChanged="GridAnimaisAdotados_SelectedIndexChanged" ID="GridAnimaisAdotados" OnRowDataBound="GridAnimaisAdotados_RowDataBound" AutoGenerateSelectButton="True" AutoGenerateColumns="False" DataSourceID="SqlAdotados" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="ID_animal" HeaderText="ID_animal" SortExpression="ID_animal" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                <asp:BoundField DataField="Género" HeaderText="Género" SortExpression="Género" />
                <asp:BoundField DataField="Idade" HeaderText="Idade" SortExpression="Idade" />
                <asp:BoundField DataField="Raça" HeaderText="Raça" SortExpression="Raça" />
                <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                <asp:BoundField DataField="ID_Instituiçao" HeaderText="ID_Instituiçao" SortExpression="ID_Instituiçao" />
                <asp:BoundField DataField="Instituição" HeaderText="Instituição" SortExpression="Instituição" />
                <asp:BoundField DataField="Data de adoção final" DataFormatString="{0:d}" HeaderText="Data de adoção final" SortExpression="Data de adoção final" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlAdotados" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT A.ID_animal, A.Nome, A.Género, A.Idade, R.Nome 'Raça', T.Nome 'Tipo',I.ID_Instituiçao ,I.Nome 'Instituição', A.[Data de adoção final] FROM Utilizador U JOIN Animal A 
ON U.ID_Utilizador = A.Utilizador
JOIN Raça R ON A.Raça = R.ID_Raça
JOIN Tipo T ON R.Tipo = T.ID_Tipo
JOIN Instituiçao I ON A.Instituiçao = I.ID_Instituiçao
WHERE A.Utilizador = @id AND A.[Data de adoção final] is not null">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="User" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div class="col-4">
        <h1 class="display-6">Instituição</h1>
        <table>
            <tr>
                <th>Nome:</th>
                <td>
                    <asp:Label ID="textNome" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <th>Morada:</th>
                <td>
                    <asp:Label ID="textMorada" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <th>Localidade:</th>
                <td>
                    <asp:Label ID="textLocalidade" runat="server"></asp:Label>

                </td>
            </tr>
            <tr>
                <th>Código postal:</th>
                <td>
                    <asp:Label ID="textCodigoPostal" runat="server"></asp:Label>

                </td>
            </tr>
            <tr>
                <th>Telefone:</th>
                <td>
                    <asp:Label ID="textTelefone2" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <th>Telemóvel:</th>
                <td>
                    <asp:Label ID="textTelemovel" runat="server"></asp:Label>

                </td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>
                    <asp:Label ID="textEmail" runat="server"></asp:Label>

                </td>
            </tr>
            <tr>
                <th>URL:</th>
                <td>
                    <a href="#" runat="server" id="LinkInstitucao"></a>
                </td>
            </tr>
            <tr>
                <th>3 Words</th>
                <td>
                    <asp:Label ID="text3Words" runat="server"></asp:Label>

                </td>
            </tr>
            <tr>
                <th>Distrito</th>
                <td>
                    <asp:Label runat="server" ID="textDistrito"></asp:Label>

                </td>               
            </tr>
            <tr>
                <th>Concelho</th>
                <td>
                    <asp:Label runat="server" ID="textConcelho"></asp:Label>
                </td>
            </tr>
            <%--<tr>
                <td>
                    <asp:Button ID="btnVisitarInstituição" runat="server" OnClick="btnVisitarInstituição_Click" Text="Visitar insituição" CssClass="btn btn-outline-light" />
                </td>
            </tr>--%>
        </table>
    </div>
</asp:Content>
