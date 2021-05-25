<%@ Page Language="C#" MasterPageFile="~/Pages/Dialog.Master" AutoEventWireup="true" AspCompat="true" CodeBehind="MeasureDialog.aspx.cs" Inherits="Salamander.Web.Pages.MeasureDialog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="margin-left: auto; margin-right: auto;">
        <tr>
            <td colspan="2" style="padding-bottom: 10px;">Please enter information for the measure:</td>            
        </tr>
        <tr id="MeasureTypeRow" runat="server">
            <td>
                <asp:Label ID="Label5" runat="server" Text="Type of Measure:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList AutoPostBack="true" ID="MeasureTypes" runat="server"></asp:DropDownList>
            </td>            
        </tr>
        
        <tr id="MeasureRow" runat="server">
            <td>
                <asp:Label ID="Label1" runat="server" Text="Measure:"></asp:Label>
            </td>
            <td style="width: 100px">
                <asp:DropDownList AutoPostBack="true" ID="Measures" runat="server"></asp:DropDownList>
            </td>            
        </tr>
        
        <tr id="EpochRow" runat="server">
            <td style="vertical-align:top">
                <asp:Label ID="Label3" runat="server" Text="Epoch:"></asp:Label>
            </td>
            <td ID="EpochCell" style="width: 100px" />
        </tr>

        <tr id="ActualRow" runat="server">
            <td>
                <asp:Label ID="Label2" runat="server" Text="Actual:"></asp:Label>            
            </td>
            <td id="ActualCell" runat="server">
                <asp:TextBox ID="actual" runat="server" style="width: 100px" /><span id="actualSpan" runat="server" class="yui-skin-sam" />
            </td>
        </tr>
        
        <tr id="GoalRow" runat="server">
            <td>
                <asp:Label ID="Label4" runat="server" Text="Goal:"></asp:Label>            
            </td>
            <td id="GoalCell" runat="server">
                <asp:TextBox ID="goal" runat="server" style="width: 100px" /><span id="goalSpan" runat="server" class="yui-skin-sam" />
            </td>
        </tr>
                       
        <tr>
            <td colspan="2" align="center" style="padding-top: 10px;">
                <input id="cmdOK" runat="server" class="button" type="button" value="OK" onclick="typeof Page_ClientValidate !== 'function' || Page_ClientValidate('');"/>
                <input id="cmdCancel" runat="server" class="button" type="button" value="Cancel" onclick="window.top.Salamander.PopupManager.hide(false); return false;"/>
            </td>
        </tr>
    </table> 

    <asp:PlaceHolder ID="phValidationSummary" runat="server" Visible="true" />   
</asp:Content>
