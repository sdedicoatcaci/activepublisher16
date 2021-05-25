<%@ Page Language="C#" MasterPageFile="~/Pages/Dialog.Master" AutoEventWireup="true" CodeBehind="DeleteElementDialog.aspx.cs" Inherits="Salamander.Web.Pages.DeleteElementDialog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
    <table style="width: 80%; margin-left: auto; margin-right: auto;">
        <tr>
            <td valign="middle">
                <asp:Label ID="lblText" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="okButton" runat="server" Text="OK" CssClass="button" OnClick="okButton_Click" />
                <asp:Button ID="cancelButton" runat="server" Text="Cancel" CssClass="button" OnClientClick="window.top.Salamander.PopupManager.hide(false); return false;" />
            </td>
        </tr>
    </table>  
</asp:Content>