<%@ Page Language="C#" AutoEventWireup="true" Codebehind="Removed.aspx.cs" Inherits="Salamander.ActivePublisher.Removed" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Item Not in Repository</title>
    <asp:PlaceHolder id="headContent" runat="server">
        <link href="<%= this.Page.ClientScript.GetWebResourceUrl(typeof(Salamander.Web.Core.WebCoreResources), Salamander.Web.Core.WebCoreResources.StyleSheetResource_NonModel) %>" type="text/css" rel="Stylesheet" />
    </asp:PlaceHolder>
    <style type="text/css">
        ul li { list-style-position: inside }
    </style>
</head>
<body>
    <table class="bordercollapse" width="100%">
        <tr>
            <td style="width: 25%">
                <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Images/tsoLogo.gif" AlternateText="Logo" />
            </td>
            <td align="center">
                <h2>
                    Active&nbsp;Publisher Error</h2>
            </td>
            <td style="width: 25%" />
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <h3>
                    <span style="color: Red">There was a problem accessing the element you requested</span>
                </h3>
                <strong>This maybe due to one of the following reasons:</strong>
                <ul>
                    <li>The element has been removed from the repository</li>
                    <li>There was a problem retrieving the element from the repository</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:HyperLink id="hypHome" runat="server" navigateurl="~/Default.aspx" text="Click to continue" /></td>
        </tr>
    </table>
</body>
</html>
