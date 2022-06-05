<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="instituicao.aspx.cs" Inherits="pap_Diogo.instituicao.instituicao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <style>
        .legenda {
            text-align: right;
            padding-right: 15px;
        }
    </style>

    <div class="container">
        <h1 class="display-6 mt-4">
            <asp:Label ID="nomeInstituição" runat="server" CssClass="display-6" />
        </h1>

        <div class="row mt-3">
            <asp:GridView ID="gridAnimais" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="ID_animal" DataSourceID="sqlAnimais">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ID_animal" HeaderText="ID_animal" InsertVisible="False" ReadOnly="True" SortExpression="ID_animal" />
                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                    <asp:BoundField DataField="Data de publicaçao" HeaderText="Data de publicaçao" SortExpression="Data de publicaçao" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                    <asp:BoundField DataField="Raça" HeaderText="Raça" SortExpression="Raça" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sqlAnimais" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                SelectCommand="SELECT A.ID_animal, A.Nome, a.[Data de publicaçao], T.Nome 'Tipo', R.Nome 'Raça' FROM Animal A JOIN Raça R ON A.Raça = R.ID_Raça JOIN Tipo T ON R.Tipo = T.ID_Tipo WHERE Instituiçao = @Instituiçao ORDER BY A.[Data de publicaçao] DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="Instituiçao" SessionField="user" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <div class="row mt-3">
            <div class="col-8">
                <asp:LinkButton Text="Novo animal" runat="server" CssClass="btn btn-primary" ID="linkNovoAnimal" OnClick="linkNovoAnimal_Click" Width="200" />
                <asp:LinkButton Text="Editar dados do animal" runat="server" CssClass="btn btn-primary ms-4" ID="linkEditar" OnClick="linkEditar_Click" Width="200" />
            </div>
        </div>      
    </div>

</asp:Content>
