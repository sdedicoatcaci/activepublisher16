<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" Title="Access Denied" Codebehind="NoPermission.aspx.cs" Inherits="Salamander.ActivePublisher.NoPermission" AspCompat="true" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <link href="<%= this.Page.ClientScript.GetWebResourceUrl(typeof(Salamander.Web.Core.WebCoreResources), Salamander.Web.Core.WebCoreResources.StyleSheetResource_NonModel) %>" type="text/css" rel="Stylesheet"/>
</asp:Content>		

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <table class="bordercollapse" width="100%">
	    <tr>
            <td style="width: 25%">
                <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Images/tsoLogo.gif" AlternateText="Logo" />
            </td>
            <td align="center">
                <h2>Access Denied</h2>
            </td>
            <td style="width: 25%" />
	    </tr>
	    <tr>
            <td colspan="3">&nbsp;</td>
	    </tr>
	    <tr>
            <td colspan="3" align="center">
                <h3>
                    <span style="color: Red">You do not have permission to access the page you requested</span>
                </h3>
                <strong>Please contact your administrator</strong>
	        </td>
	    </tr>
	    <tr>
            <td colspan="3">&nbsp;</td>
	    </tr>
	    <tr>
            <td colspan="3" align="center">
                <a href="javascript: history.go(-1)">Back</a>
            </td>
	    </tr>
	</table>
</asp:Content>