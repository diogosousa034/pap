<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="InfoAnimal.aspx.cs" Inherits="pap_Diogo.InfoAnimal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <style>
        .textAMid{
            width:150px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <div>
        <div class="mb-4 d-flex justify-content-center">
            <asp:Image class="w-50 rounded" ID="AnimalImageView" runat="server" />
        </div>
    </div>
    <div>
        <table class="table table-borderless d-flex justify-content-center">
            <tr>
                <th class="text-end">Nome:</th>
                <td class="textAMid">
                    <asp:Label ID="textNome" Width="200" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th class="text-end">Género:</th>
                <td class="textAMid">
                    <asp:Label ID="textGénero" Width="200" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th class="text-end">Idade:</th>
                <td class="textAMid">
                    <asp:Label ID="textIdade" Width="200" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th class="text-end">Porte:</th>
                <td class="textAMid">
                    <asp:Label ID="textPorte" Width="200" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th class="text-end">Características:</th>
                <td class="textAMid">
                    <asp:Label ID="textCaracteristicas" Width="200" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th class="text-end">Tipo:</th>
                <td class="textAMid">
                    <asp:Label ID="textTipo" Width="200" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th class="text-end">Raça:</th>
                <td class="textAMid">
                    <asp:Label ID="textRaça" Width="200" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th class="text-end">Cor:</th>
                <td class="textAMid">
                    <asp:Label ID="textCor" Width="200" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th class="text-end">Desparazitado:</th>
                <td class="textAMid">
                    <asp:CheckBox ID="CheckDesparazitado" Width="200" runat="server" /></td>
            </tr>
            <tr>
                <th class="text-end">Vacinas:</th>
                <td class="textAMid">
                    <asp:Label ID="textVacinas" Width="200" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th class="text-end">Esterelizado:</th>
                <td class="textAMid">
                    <asp:CheckBox ID="CheckEsterelizado" Width="200" runat="server" /></td>
            </tr>
            <tr>
                <th class="text-end">Descrição:</th>
                <td class="textAMid">
                    <asp:Label ID="textDescricao" Width="200" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th class="text-end">Concelho:</th>
                <td class="textAMid">
                    <asp:Label ID="textConcelho" Width="200" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="text-end">
                    <asp:Button runat="server" CssClass="btn btn-outline-primary rounded-pill" ID="btnAdotarPendente" OnClick="btnAdotarPendente_Click" Text="Adotar" /></td>
                <td>
                    <asp:Button runat="server" CssClass="btn btn-outline-primary rounded-pill" ID="btnFavoritos" OnClick="btnFavoritos_Click" Text="Favoritos" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Label CssClass="text-danger" runat="server" ID="textError"></asp:Label>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
