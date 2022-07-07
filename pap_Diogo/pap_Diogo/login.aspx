<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="pap_Diogo.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <asp:Login ID="Login1" runat="server" OnLoggedIn="Login1_LoggedIn" CssClass="mt-4 ms-4">
        <LayoutTemplate>
            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0">
                            <tr style="height:50px; vertical-align:middle">
                                <td align="right" style="width:100px; padding-right:10px; padding-bottom:28px;">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User name:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ID="UserName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="height:50px; vertical-align:middle">
                                <td align="right" style="width:100px; padding-right:10px; padding-bottom:28px;">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr style="vertical-align:middle">
                                <td align="right" colspan="2" style="padding-right:12px;padding-bottom:0px;">
                                    <asp:Button ID="LoginButton" CssClass="btn btn-outline-info" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" />
                                </td>
                            </tr>
                            <tr style="vertical-align:middle">
                                <td align="left" colspan="2" style="padding-right:12px;padding-top:0px;">
                                    <asp:HyperLink runat="server" NavigateUrl="~/Recuperar_password.aspx">Recuperar password</asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:Login>

</asp:Content>
