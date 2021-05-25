<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" Title="Repository Logout" Inherits="Salamander.ActivePublisher.Logout" Codebehind="Logout.aspx.cs" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <link href="<%= this.Page.ClientScript.GetWebResourceUrl(typeof(Salamander.Web.Core.WebCoreResources), Salamander.Web.Core.WebCoreResources.StyleSheetResource_NonModel) %>" type="text/css" rel="Stylesheet"/>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <h4 style="text-align: center">You have successfully logged out</h4>
    <table cellspacing="10" style="margin-left: auto; margin-right: auto; text-align: center;">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><asp:HyperLink ID="hypLogin" runat="server" NavigateUrl="~/Login.aspx">Click here to return to the login page</asp:HyperLink></td>
        </tr>
    </table>
</asp:Content>