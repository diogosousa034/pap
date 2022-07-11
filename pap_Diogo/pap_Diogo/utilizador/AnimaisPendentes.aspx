<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="AnimaisPendentes.aspx.cs" Inherits="pap_Diogo.utilizador.AnimaisPendentes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <h2>Animais pendentes</h2>

    <div class="col-6">
        <asp:GridView CssClass="table table-borderless" GridLines="None" ID="GridAnimais" runat="server" OnSelectedIndexChanged="GridAnimais_SelectedIndexChanged" AutoGenerateColumns="False" OnRowDataBound="GridAnimais_RowDataBound" AutoGenerateSelectButton="True" DataKeyNames="ID_animal" DataSourceID="SqlAnimais" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="ID_animal" HeaderText="ID_animal" InsertVisible="False" ReadOnly="True" SortExpression="ID_animal" />
                <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                <asp:BoundField DataField="Género" HeaderText="Género" SortExpression="Género" />
                <asp:BoundField DataField="Idade" HeaderText="Idade" SortExpression="Idade" />
                <asp:BoundField DataField="Porte" HeaderText="Porte" SortExpression="Porte" />
                <asp:BoundField DataField="Raça" HeaderText="Raça" SortExpression="Raça" />
                <asp:BoundField DataField="Utilizador" HeaderText="Utilizador" SortExpression="Utilizador" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="Image2" runat="server" Height="20px" Width="20px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <SelectedRowStyle BackColor="#CDD1D1" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlAnimais" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT			A.ID_animal, A.Nome, A.Género, A.Idade, A.Porte, R.Nome 'Raça', A.Utilizador
FROM			Animal A JOIN Utilizador_Animal UA ON A.ID_animal = UA.Animal
				JOIN Utilizador U ON U.ID_Utilizador = UA.Utilizador
				JOIN Raça R ON A.Raça = R.ID_Raça
				WHERE U.ID_Utilizador = @id AND A.[Data adoçao] IS NULL">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="user" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

    <div class="col-6">
        <div class="w-100 mb-4 d-flex justify-content-center">
            <div class="w-75">
                <asp:Image class="w-100 rounded" ID="AnimalImageView" runat="server" />
            </div>
        </div>
        <table class="mb-3 table table-borderless">
            <tr>
                <th class="text-end">Nome:</th>
                <td>
                    <asp:Label ID="textNomeAnimal" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th class="text-end">Género:</th>
                <td>
                    <asp:Label ID="textGénero" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th class="text-end">Idade:</th>
                <td>
                    <asp:Label ID="textIdade" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th class="text-end">Porte:</th>
                <td>
                    <asp:Label ID="textPorte" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th class="text-end">Características:</th>
                <td>
                    <asp:Label ID="textCaracteristicas" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th class="text-end">Tipo:</th>
                <td>
                    <asp:Label ID="textTipo" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th class="text-end">Raça:</th>
                <td>
                    <asp:Label ID="textRaça" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th class="text-end">Cor:</th>
                <td>
                    <asp:Label ID="textCor" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th class="text-end">Desparazitado:</th>
                <td>
                    <asp:CheckBox ID="CheckDesparazitado" runat="server" /></td>
            </tr>
            <tr>
                <th class="text-end">Vacinas:</th>
                <td>
                    <asp:Label ID="textVacinas" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th class="text-end">Esterelizado:</th>
                <td>
                    <asp:CheckBox ID="CheckEsterelizado" runat="server" /></td>
            </tr>
            <tr>
                <th class="text-end">Descrição:</th>
                <td>
                    <asp:Label ID="textDescricao" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th class="text-end">Concelho:</th>
                <td>
                    <asp:Label ID="textConcelho" runat="server"></asp:Label></td>
            </tr>
            <tr >
                <td>
                    <asp:Button runat="server" CssClass="btn btn-outline-primary rounded-pill" OnClick="btnAceitar_Click" ID="btnAceitar" Text="Aceitar" Width="200" />
                </td>
                <td>
                    <asp:Button runat="server" CssClass="btn btn-outline-danger rounded-pill" OnClick="btnRecusar_Click" ID="btnRecusar" Text="Recusar" Width="200" />
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
