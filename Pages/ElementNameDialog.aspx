<%@ Page Language="C#" MasterPageFile="~/Pages/Dialog.Master" AutoEventWireup="true" AspCompat="true" CodeBehind="ElementNameDialog.aspx.cs" Inherits="Salamander.Web.Pages.ElementNameDialog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="margin-left: auto; margin-right: auto;">
        <tr>
            <td colspan="2" style="white-space: nowrap">Please enter the name of the new element:</td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>        
        <tr>
            <td style="width: 20%;">
                <label id="lblElementName" for="txtElementName">Name:</label>
            </td>
            <td>
                <input id="txtElementName" style="width: 95%" type="text" />
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input id="cmdOK" class="button" type="button" value="OK" onclick="returnVal = document.getElementById('txtElementName').value; window.top.Salamander.PopupManager.hide(true); return false;"/>
                <input id="cmdCancel" class="button" type="button" value="Cancel" onclick="window.top.Salamander.PopupManager.hide(false); return false;"/></td>
        </tr>
    </table>
    <script type="text/javascript">
        //<![CDATA[    
        document.getElementById('txtElementName').focus();
        //]]>        
    </script>
</asp:Content>
