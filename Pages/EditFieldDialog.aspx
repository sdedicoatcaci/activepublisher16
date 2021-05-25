<%@ Page Language="C#" MasterPageFile="~/Pages/Dialog.Master" AutoEventWireup="true" AspCompat="true" CodeBehind="EditFieldDialog.aspx.cs" Inherits="Salamander.Web.Pages.EditFieldDialog" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Register TagPrefix="cc1" Namespace="Salamander.Web.Core.Controls" Assembly="Salamander.Web.Core"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 80%; margin-left: auto; margin-right: auto;">
        <tr>
            <td colspan="2" align="center"><asp:Literal ID="introLiteral" runat="server">Please enter the name of the new element:</asp:Literal></td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>        
        <tr id="fieldRow" runat="server">
            <td>
                <cc1:ThemeFieldsControl id="themeFieldsControl1" runat="server" />
            </td>
        </tr>        
        <tr id="fieldPaddingRow" runat="server">
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
        /* Focus first editable field in the form */
        var form = document.forms[0];
        for (var i = 0, len = form.elements.length; i < len; i++) {
            var el = form.elements[i];
            if ((el.tagName == 'INPUT' && el.type != 'hidden') || el.tagName == 'SELECT' || el.tagName == 'TEXTAREA') {
                el.focus();
                break;
            }
        }
        //]]>
    </script>    
</asp:Content>