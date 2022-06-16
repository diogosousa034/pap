<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="pap_Diogo.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">


    <style>
        .HoverSelected:hover {
            background-color: rgba(0,0,0,0.15);
            cursor: pointer;
        }

    </style>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <h1 class="display-6 mt-4 text-center fw-bold fst-italic">home page</h1>

    <div class="container-fluid">
        <div class="d-flex">
            <div class="col-2">
                Distrito:<br />
                <asp:DropDownList runat="server" ID="dropDistritos" AutoPostBack="True" DataSourceID="sqlDistritos" DataTextField="Nome" DataValueField="ID" AppendDataBoundItems="true" OnSelectedIndexChanged="dropDistritos_SelectedIndexChanged">
                    <asp:ListItem Value="0" Text="Selecione o distrito"></asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="sqlDistritos" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ID], [Nome] FROM [Distrito] ORDER BY [Nome]"></asp:SqlDataSource>
                <br />
                Concelho:<br />
                <asp:DropDownList OnSelectedIndexChanged="dropConcelhos_SelectedIndexChanged" runat="server" ID="dropConcelhos" AutoPostBack="True" DataSourceID="sqlConcelhos" DataTextField="Nome" DataValueField="ID" AppendDataBoundItems="True">
                    <asp:ListItem Value="0" Text="Selecione o concelho"></asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="sqlConcelhos" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ID], [Nome] FROM [Concelho] WHERE ([Distrito] = @Distrito)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="dropDistritos" Name="Distrito" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                Tipo<br />
                <asp:DropDownList runat="server" ID="dropTipos" OnSelectedIndexChanged="dropTipos_SelectedIndexChanged" DataSourceID="sqlTipos" DataTextField="Nome" DataValueField="ID_Tipo" AppendDataBoundItems="true" AutoPostBack="True">
                    <asp:ListItem Value="0" Text="Selecione o tipo"></asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="sqlTipos" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ID_Tipo], [Nome] FROM [Tipo] ORDER BY [Nome]"></asp:SqlDataSource>
                <br />
                Raça:<br />
                <asp:DropDownList runat="server" ID="dropRaças" OnSelectedIndexChanged="dropRaças_SelectedIndexChanged" DataSourceID="sqlRaças" DataTextField="Nome" DataValueField="ID_Raça" AppendDataBoundItems="true" AutoPostBack="True">
                    <asp:ListItem Value="0" Text="Selecione a raça"></asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="sqlRaças" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ID_Raça], [Nome] FROM [Raça] WHERE ([Tipo] = @Tipo) ORDER BY [Nome]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="dropTipos" Name="Tipo" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                Idade:<br />
                <asp:DropDownList runat="server" ID="dropIdade" AutoPostBack="True" OnSelectedIndexChanged="dropIdade_SelectedIndexChanged">
                    <asp:ListItem Value="0" Text="Selecione a idade"></asp:ListItem>
                    <asp:ListItem Text="Bebé"></asp:ListItem>
                    <asp:ListItem Text="Jovem"></asp:ListItem>
                    <asp:ListItem Text="Adulto"></asp:ListItem>
                    <asp:ListItem Text="Sénior"></asp:ListItem>
                </asp:DropDownList><br />
                Género:<br />
                <asp:DropDownList runat="server" ID="dropGenero" AutoPostBack="True" OnSelectedIndexChanged="dropGenero_SelectedIndexChanged">
                    <asp:ListItem Value="0" Text="Selecione o género"></asp:ListItem>
                    <asp:ListItem Text="Feminino"></asp:ListItem>
                    <asp:ListItem Text="Masculino"></asp:ListItem>
                </asp:DropDownList><br />
            </div>
            <div class="col-10 d-flex justify-content-center">
                <asp:DataList ID="DataListAnimais" runat="server" DataKeyField="ID_animal" RepeatColumns="2" RepeatDirection="Horizontal" CellPadding="20" Height="250px" Width="300px">
                    <ItemTemplate>
                        <a href="InfoAnimal.aspx?animalid=<%# Eval("ID_animal") %>" class="text-black text-decoration-none">
                            <asp:Label ID="ID_animalLabel" runat="server" Text='<%# Eval("ID_animal") %>' Visible="false" />
                            <br />
                            <div class="border HoverSelected">
                                <asp:Image ID="Image2" runat="server" Height="250px" ImageUrl='<%# Eval("Foto") %>' Width="300px" />
                                <br />
                                <div class="px-3 pt-1 pb-1 rounded-bottom">
                                    <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' Font-Bold="true" />
                                    <br />
                                    Raça:
                        <asp:Label ID="RaçaLabel" runat="server" Text='<%# Eval("Raça") %>' />
                                    <br />
                                    Género:
                        <asp:Label ID="GéneroLabel" runat="server" Text='<%# Eval("Género") %>' />
                                    <br />
                                    Porte:
                        <asp:Label ID="PorteLabel" runat="server" Text='<%# Eval("Porte") %>' />
                                </div>
                            </div>
                        </a>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>

        <div class="text-center m-4">
            <asp:LinkButton runat="server" ID="linkPrimeira1" OnClick="linkPrimeira1_Click">Primeiro</asp:LinkButton>
            <asp:LinkButton runat="server" ID="linkAnterior1" OnClick="linkAnterior1_Click">Anterior</asp:LinkButton>
            <asp:LinkButton runat="server" ID="linkSeguinte1" OnClick="linkSeguinte1_Click">Seguinte</asp:LinkButton>
            <asp:LinkButton runat="server" ID="linkUltimo1" OnClick="linkUltimo1_Click">Último</asp:LinkButton>
        </div>

    </div>


</asp:Content>
