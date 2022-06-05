<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="criar_conta.aspx.cs" Inherits="pap_Diogo.criar_conta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        table {
            width: 900px;
            border: 0px;
            margin-top: 20px;
            border-collapse: collapse;
        }

        tr {
            height: 50px;
            vertical-align: middle;
        }

        .legenda {
            width: 150px;
            text-align: right;
        }

        .controlo {
            width: 755px;
            text-align: left;
            padding-left: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <h1 class="display-6 mt-2">Criar conta</h1>
    <table class="mt-3">
        <tr>
            <th class="legenda">Nome</th>
            <td class="controlo">
                <asp:TextBox runat="server" ID="textNome" CssClass="form-control" Style="width: 300px; display: inline;" />
            </td>
        </tr>
        <tr>
            <th class="legenda">Email</th>
            <td class="controlo">
                <asp:TextBox runat="server" ID="textEmail" CssClass="form-control" Style="width: 300px; display: inline;" />
            </td>
        </tr>
        <tr>
            <th class="legenda">Username</th>
            <td class="controlo">
                <asp:TextBox runat="server" ID="textUsername" CssClass="form-control" Style="width: 150px; display: inline;" />
            </td>
        </tr>
        <tr>
            <th class="legenda">Password</th>
            <td class="controlo">
                <asp:TextBox runat="server" ID="textPassword" CssClass="form-control" Style="width: 150px; display: inline;" />
            </td>
        </tr>
        <tr>
            <th class="legenda">Tipo de conta</th>
            <td class="controlo">
                <div class="btn-group" data-toggle="buttons">
                    <label class="btn btn-default">
                        <asp:RadioButton runat="server" ID="rbUtilizador" GroupName="tipo" />
                        Utilizador
                    </label>
                    <label class="btn btn-default">
                        <asp:RadioButton runat="server" ID="rbInstituicao" GroupName="tipo" />
                        Instituição
                    </label>
                </div>
            </td>
        </tr>
        <tr style="height: 80px;">
            <td class="legenda"></td>
            <td class="controlo">
                <asp:LinkButton Text="Criar conta" runat="server" ID="linkCriarConta" OnClick="linkCriarConta_Click" />
            </td>
        </tr>
    </table>


</asp:Content>
