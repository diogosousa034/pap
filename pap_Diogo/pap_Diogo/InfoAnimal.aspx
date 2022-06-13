<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="InfoAnimal.aspx.cs" Inherits="pap_Diogo.InfoAnimal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <div class="col-8 w-100 mb-4 d-flex justify-content-center">
        <div class="w-50">
            <asp:Image class="w-100 rounded" ID="AnimalImageView" runat="server" />
        </div>
    </div>
    <table>
        <tr>
            <th class="text-end">Nome:</th>
            <td>
                <asp:Label ID="textNome" runat="server"></asp:Label></td>
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
    </table>

</asp:Content>
