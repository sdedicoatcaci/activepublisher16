<%@ Page Language="C#" AutoEventWireup="true" EnableSessionState="True" EnableViewState="false" CodeBehind="Loading.aspx.cs" Inherits="Salamander.ActivePublisher.Loading" AspCompat="true" %>
<%@ OutputCache NoStore="true" Location="None" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>MooD Active Enterprise</title>
    <link rel="shortcut icon" type="image/png" href="ElementIcon.axd?iconId=ICON_CURRENT_REPOSITORY" />
    <asp:PlaceHolder id="headContent" runat="server">
        <link href="<%= this.Page.ClientScript.GetWebResourceUrl(typeof(Salamander.Web.Core.WebCoreResources), Salamander.Web.Core.WebCoreResources.StyleSheetResource_NonModel) %>" type="text/css" rel="Stylesheet" />
    </asp:PlaceHolder>
</head>
<body>
    <asp:Literal ID="information" runat="server"></asp:Literal>
    <asp:Literal ID="commands" runat="server"></asp:Literal>
</body>
</html>