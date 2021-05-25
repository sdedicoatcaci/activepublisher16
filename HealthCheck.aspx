<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" Title="MooD Active Enterprise" Codebehind="HealthCheck.aspx.cs" Inherits="Salamander.ActivePublisher.HealthCheck" %>
<%@ OutputCache NoStore="true" Location="None" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <link href="<%= this.Page.ClientScript.GetWebResourceUrl(typeof(Salamander.Web.Core.WebCoreResources), Salamander.Web.Core.WebCoreResources.StyleSheetResource_NonModel) %>" type="text/css" rel="Stylesheet"/>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
	<table class="bordercollapse" width="100%">
		<tr>
			<td width="25%">
			    <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Images/tsoLogo.gif" AlternateText="Logo" />
			</td>
			<td align="center">
			    <h2>Welcome to MooD Active Enterprise</h2>
			</td>
			<td width="25%" />
		</tr>
	</table>
    <br />
    <table width="100%" height="90%" bgcolor="whitesmoke">
		<tr>
			<td width="100%" height="100%" align="center" valign="middle">
				Please enter the site <a href="Default.aspx">here</a>
			</td>
		</tr>
	</table>
</asp:Content>