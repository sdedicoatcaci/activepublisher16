<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" Title="Repository Login" Inherits="Salamander.ActivePublisher.Login" Codebehind="Login.aspx.cs" AspCompat="true" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <link href="<%= this.Page.ClientScript.GetWebResourceUrl(typeof(Salamander.Web.Core.WebCoreResources), Salamander.Web.Core.WebCoreResources.StyleSheetResource_NonModel) %>" type="text/css" rel="Stylesheet"/>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
        <asp:Label ID="lblIncorrectLogin" runat="server" ForeColor="#c00000" Visible="false"
            EnableViewState="false">
            The username or password is incorrect. Please try again.
        </asp:Label>
        <asp:Label ID="lblAutoLoginFailed" runat="server" ForeColor="#c00000" Visible="false"
            EnableViewState="false">
            The username or password supplied in the configuration file are incorrect, please contact your repository administrator.
        </asp:Label>
        <asp:Label ID="lblSessionLimit" runat="server" ForeColor="#c00000" Visible="false"
            EnableViewState="false">
            You have reached your maximum number of licensed sessions, please contact your repository administrator.
        </asp:Label>
        <asp:Label ID="lblNotAuthorized" runat="server" ForeColor="#c00000" Visible="false"
            EnableViewState="false">
            You are not authorized to use this application.
        </asp:Label>
    </div>
    <h4 style="text-align: center;">
        Please enter your login details (case sensitive)</h4>
    <table cellspacing="10" style="margin-left: auto; margin-right: auto; text-align: center;">
        <tr>
            <td align="right">
                Username
            </td>
            <td style="width: 80%;">
                <asp:TextBox ID="tbUsername" runat="server" Width="100%" />
            </td>
        </tr>
        <tr>
            <td align="right">
                Password
            </td>
            <td style="width: 80%;">
                <asp:TextBox ID="tbPassword" runat="server" TextMode="Password" Width="100%" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="LoginButtonClick" />
                <asp:Button ID="btnGuest" runat="server" Text="Guest" Visible="false" OnClick="GuestButtonClick" />
            </td>
        </tr>
        <tr>
            <td style="padding-top:50px;" colspan="2" align="center">
                <img src="Images/poweredBy.png" alt="Logo" />
            </td>
        </tr>
    </table>
</asp:Content>
