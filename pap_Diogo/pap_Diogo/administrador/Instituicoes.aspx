<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="Instituicoes.aspx.cs" Inherits="pap_Diogo.administrador.Instituicoes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <div class="col-6">
        <h1 class="display-6">Instituições para aprovação</h1>

        <asp:GridView ID="GridInsituições" AutoGenerateSelectButton="true" OnSelectedIndexChanged="GridInsituições_SelectedIndexChanged" OnRowDataBound="GridInsituições_RowDataBound" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID_Instituiçao" DataSourceID="SqlInsituições">
            <Columns>
                <asp:BoundField DataField="ID_Instituiçao" HeaderText="ID_Instituiçao" ReadOnly="True" SortExpression="ID_Instituiçao" />
                <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                <asp:BoundField DataField="Data_de_registo" DataFormatString="{0:d}" HeaderText="Data_de_registo" SortExpression="Data_de_registo" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlInsituições" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ID_Instituiçao], [Nome], [Data de registo] AS Data_de_registo FROM [Instituiçao] ORDER BY [Data de registo] DESC"></asp:SqlDataSource>
    </div>
    <div class="col-6">
        <h1 class="display-6">Dados da instituição</h1>
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
                    <asp:Label ID="textMorada" runat="server" ></asp:Label>
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
                    <asp:Label ID="textTelefone" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <th>Telemóvel:</th>
                <td>
                    <asp:Label ID="textTelemovel" runat="server" ></asp:Label>    
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
                    <asp:Label ID="textURL" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <th>3 Words</th>
                <td>
                    <asp:Label ID="text3Words" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <th>Data de registo:</th>
                <td>
                    <asp:Label ID="textData" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <th>Distrito:</th>
                <td>
                    <asp:Label ID="textDistrito" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <th>Concelho:</th>
                <td>
                    <asp:Label ID="textConcelho" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td><asp:Button ID="btnAprovar" runat="server" CssClass="btn btn-success rounded-pill" OnClick="btnAprovar_Click" Text="Aprovar"/></td>
                <td><asp:Button ID="btnRemover" runat="server" CssClass="btn btn-danger rounded-pill" OnClick="btnRemover_Click" Text="Remover"/></td>
            </tr>
           
        </table>
    </div>


</asp:Content>
