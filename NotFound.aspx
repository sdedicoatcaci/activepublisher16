<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" Title="Not Found" CodeBehind="NotFound.aspx.cs" Inherits="Salamander.ActivePublisher.NotFound" AspCompat="true"%>

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
	            <h2>Page Not Found</h2>
	        </td>
	        <td style="width: 25%" />
	    </tr>
	    <tr>
	        <td colspan="3">&nbsp;</td>
	    </tr>
	    <tr>
    	    <td colspan="3" align="center">
	            <h3>
	                <span style="color: Red">The requested page has not been found.</span>
	            </h3>
	            <strong>Please contact a MooD administrator</strong>
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