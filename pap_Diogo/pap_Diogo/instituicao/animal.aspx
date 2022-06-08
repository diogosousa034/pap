<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="animal.aspx.cs" Inherits="pap_Diogo.instituicao.animal" %>

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
        <div class="row">
            <table class="table table-borderless">
                <tr>
                    <th class="legenda">Nome:</th>
                    <td>
                        <asp:TextBox ID="textNome" runat="server" CssClass="form-control" Width="350"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="legenda">Género:</th>
                    <td>
                        <asp:RadioButton ID="GeneroM" runat="server" Text="Masculino" GroupName="Genero" />
                        <asp:RadioButton ID="GeneroF" runat="server" Text="Feminino" GroupName="Genero" />
                    </td>
                </tr>
                <tr>
                    <th class="legenda">Idade:</th>
                    <td>
                        <asp:DropDownList runat="server" ID="DropDownData">
                            <asp:ListItem Text="Bebé"></asp:ListItem>
                            <asp:ListItem Text="Jovem"></asp:ListItem>
                            <asp:ListItem Text="Adulto"></asp:ListItem>
                            <asp:ListItem Text="Sénior"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <th class="legenda">Porte:</th>
                    <td>
                        <asp:RadioButton ID="PorteG" runat="server" Text="Grande" GroupName="Porte" />
                        <asp:RadioButton ID="PorteM" runat="server" Text="Médio" GroupName="Porte" />
                        <asp:RadioButton ID="PorteP" runat="server" Text="Pequeno" GroupName="Porte" />
                    </td>
                </tr>
                <tr>
                    <th class="legenda">Foto:</th>
                    <td>
                        <asp:FileUpload ID="ImagemAnimal" CssClass="form-control" Width="350" runat="server" onchange="document.getElementById('AnimalImageView').src = window.URL.createObjectURL(this.files[0])" />
                    </td>
                </tr>
                <tr>
                    <th class="legenda">Características:</th>
                    <td>
                        <asp:TextBox ID="textCaracterísticas" runat="server" CssClass="form-control" Width="400"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="legenda">Tipo:</th>
                    <td>
                        <asp:DropDownList ID="DropDownTipo" runat="server" AutoPostBack="True" DataSourceID="sqlTipo" DataTextField="Nome" DataValueField="ID_Tipo"></asp:DropDownList>
                        <asp:SqlDataSource ID="sqlTipo" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ID_Tipo], [Nome] FROM [Tipo] ORDER BY [Nome]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <th class="legenda">Raça:</th>
                    <td>
                        <asp:DropDownList ID="DropDownRaça" runat="server" DataSourceID="sqlRaça" DataTextField="Nome" DataValueField="ID_Raça"></asp:DropDownList>
                        <asp:SqlDataSource ID="sqlRaça" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ID_Raça], [Nome] FROM [Raça] WHERE ([Tipo] = @Tipo) ORDER BY [Nome]">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownTipo" Name="Tipo" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <th class="legenda">Distrito:</th>
                    <td>
                        <asp:DropDownList ID="DropDownDistrito" runat="server" AutoPostBack="True" DataSourceID="SqlDistrito" DataTextField="Nome" DataValueField="ID"></asp:DropDownList>

                        <asp:SqlDataSource ID="SqlDistrito" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ID], [Nome] FROM [Distrito] ORDER BY [Nome]"></asp:SqlDataSource>

                    </td>
                </tr>
                <tr>
                    <th class="legenda">Concelho:</th>
                    <td>
                        <asp:DropDownList ID="DropDownConcelho" runat="server" DataSourceID="SqlConcelho" DataTextField="Nome" DataValueField="ID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlConcelho" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ID], [Nome] FROM [Concelho] WHERE ([Distrito] = @Distrito) ORDER BY [Nome]">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownDistrito" Name="Distrito" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <th class="legenda">Cor:</th>
                    <td>
                        <asp:TextBox ID="textCor" runat="server" CssClass="form-control" Width="170"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="legenda">Desparazitado:</th>
                    <td>
                        <asp:CheckBox ID="CheckDesparazitado" runat="server" />
                    </td>
                </tr>
                <tr>
                    <th class="legenda">Vacinas:</th>
                    <td>
                        <asp:TextBox ID="textVacinas" runat="server" CssClass="form-control" Width="250"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="legenda">Esterelizado:</th>
                    <td>
                        <asp:CheckBox ID="CheckEsterelizado" runat="server" />
                    </td>
                </tr>
                <tr>
                    <th class="legenda">Descrição:</th>
                    <td>
                        <asp:TextBox ID="textDescricao" runat="server" CssClass="form-control" Width="250"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="legenda">Imagem:</th>
                    <td>
                        <asp:Image Width="250" Height="210" ID="AnimalImageView" runat="server" />
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <td>
                        <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar" CssClass="btn btn-success rounded-pill" Width="150" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
