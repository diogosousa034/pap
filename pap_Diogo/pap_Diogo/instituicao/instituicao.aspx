<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="instituicao.aspx.cs" Inherits="pap_Diogo.instituicao.instituicao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <div class="container">
        <h1 class="display-6 mt-4">
            <asp:Label ID="nomeInstituição" runat="server" CssClass="display-6" />
        </h1>

        <div class="row mt-3">
            <asp:GridView CssClass="table table-borderless" GridLines="None" ID="gridAnimais" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnRowDataBound="gridAnimais_RowDataBound" DataKeyNames="ID_animal" DataSourceID="sqlAnimais">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ID_animal" HeaderText="ID_animal" InsertVisible="False" ReadOnly="True" SortExpression="ID_animal" />
                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                    <asp:BoundField DataField="Data de publicaçao" HeaderText="Data de publicaçao" SortExpression="Data de publicaçao" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                    <asp:BoundField DataField="Raça" HeaderText="Raça" SortExpression="Raça" />
                    <asp:BoundField DataField="Utilizador" HeaderText="Utilizador" HtmlEncode="False" SortExpression="Utilizador" />
                    <asp:BoundField DataField="Data de adoção final" HeaderText="Data de adoção final" HtmlEncode="False" SortExpression="Data de adoção final" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Image ID="Image2" runat="server" Height="20px" Width="20px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <SelectedRowStyle BackColor="#CDD1D1" />
            </asp:GridView>
            <asp:SqlDataSource ID="sqlAnimais" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                SelectCommand="SELECT A.ID_animal, A.Nome, a.[Data de publicaçao], T.Nome 'Tipo', R.Nome 'Raça', a.Utilizador, a.[Data de adoção final] FROM Animal A JOIN Raça R ON A.Raça = R.ID_Raça JOIN Tipo T ON R.Tipo = T.ID_Tipo WHERE Instituiçao = @Instituiçao ORDER BY A.[Data de publicaçao] DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="Instituiçao" SessionField="user" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="mt-3 d-flex mb-3 justify-content-center">
            <div>
                <asp:LinkButton Text="Novo animal" runat="server" CssClass="btn btn-outline-primary" ID="linkNovoAnimal" OnClick="linkNovoAnimal_Click" Width="200" />
                <asp:LinkButton Text="Editar dados do animal" runat="server" CssClass="btn btn-outline-primary ms-4" ID="linkEditar" OnClick="linkEditar_Click" Width="200" />
                <asp:LinkButton Text="Remover animal" runat="server" CssClass="btn btn-outline-danger ms-4" ID="linkRemover" OnClick="linkRemover_Click" Width="200" />
            </div>
        </div>
    </div>

</asp:Content>
