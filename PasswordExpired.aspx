<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" Title="Password Expired" CodeBehind="PasswordExpired.aspx.cs" Inherits="Salamander.ActivePublisher.PasswordExpired" AspCompat="true" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <link href="<%= this.Page.ClientScript.GetWebResourceUrl(typeof(Salamander.Web.Core.WebCoreResources), Salamander.Web.Core.WebCoreResources.StyleSheetResource_NonModel) %>" type="text/css" rel="Stylesheet"/>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <h4 style="text-align: center;">Your password has expired and must be changed</h4>
    <table cellspacing="10" style="margin-left: auto; margin-right: auto; border-collapse: separate;">
        <tr>
            <td style="text-align: right;">
                <asp:Label runat="server" AssociatedControlID="CurrentPasswordTextBox">Current Password</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="CurrentPasswordTextBox" runat="server" TextMode="Password" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                <asp:Label runat="server" AssociatedControlID="NewPasswordTextBox">New Password</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="NewPasswordTextBox" runat="server" TextMode="Password" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                <asp:Label runat="server" AssociatedControlID="ConfirmNewPasswordTextBox">Confirm New Password</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="ConfirmNewPasswordTextBox" runat="server" TextMode="Password" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <asp:Button ID="ChangePasswordButton" runat="server" Text="Change Password" OnClick="ChangePasswordButtonClick" />
            </td>
        </tr>
    </table>
    <div style="text-align: center;">
        <asp:Label ID="ErrorMessageLabel" runat="server" ForeColor="Red" />
    </div>
</asp:Content>
