<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" Title="Error" Codebehind="Error.aspx.cs" Inherits="Salamander.ActivePublisher.Error" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <link href="<%= this.Page.ClientScript.GetWebResourceUrl(typeof(Salamander.Web.Core.WebCoreResources), Salamander.Web.Core.WebCoreResources.StyleSheetResource_NonModel) %>" type="text/css" rel="Stylesheet"/>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
	<h2>Error</h2>
	<h4>There was an error processing your request</h4>
	<table class="bordercollapse" width="100%" bgcolor="whitesmoke">
		<tr>
			<td width="100%">
			    <% RenderError(); %>
			</td>
		</tr>
	</table>
</asp:Content>

