<%@ Page Language="C#" MasterPageFile="~/Pages/Dialog.Master" AutoEventWireup="true" AspCompat="true" CodeBehind="CreateElementDialog.aspx.cs" Inherits="Salamander.Web.Pages.CreateElementDialog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="margin-left: auto; margin-right: auto;">
        <tr>
            <td colspan="2" align="center"><asp:Literal ID="introLiteral" runat="server">Please enter the name of the new element:</asp:Literal></td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>        
        <tr id="nameRow" runat="server">
            <td style="width: 20%;">
                <asp:Label ID="elementNameLabel" runat="server" AssociatedControlID="elementNameText">Name:</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="elementNameText" runat="server" Width="95%" />
            </td>
        </tr>
        <tr id="namePaddingRow" runat="server">
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="okButton" runat="server" Text="OK" CssClass="button" OnClick="okButton_Click" />
                <asp:Button ID="cancelButton" runat="server" Text="Cancel" CssClass="button" OnClientClick="window.top.Salamander.PopupManager.hide(false); return false;" />
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        //<![CDATA[
        var name = document.getElementById('<%= this.elementNameText.ClientID %>');
        if (name) {
            name.focus();
        }
        //]]>
    </script>
</asp:Content>