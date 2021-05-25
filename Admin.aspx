<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Admin.aspx.cs" Inherits="Salamander.Web.Admin"  AspCompat="true" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Register TagPrefix="mood" Namespace="Salamander.MooDAPI" Assembly="Salamander.MooDAPI" %>
<%@ Register TagPrefix="core" Namespace="Salamander.Web.Core.Controls" Assembly="Salamander.Web.Core" %>
<%@ Register TagPrefix="util" Namespace="Salamander.Web.Util.Controls" Assembly="Salamander.Web.Util" %>
<%@ Register TagPrefix="admin" TagName="AdminControl" Src="Controls/AdminControl.ascx" %>

 

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <link href="<%= this.Page.ClientScript.GetWebResourceUrl(typeof(Salamander.Web.Core.WebCoreResources), Salamander.Web.Core.WebCoreResources.StyleSheetResource_NonModel) %>" type="text/css" rel="Stylesheet"/>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:ScriptManager ID="ScriptManager" runat="server" EnableScriptGlobalization="true" AsyncPostBackTimeout="300" />
    <core:EventManager ID="EventManager" runat="server" />
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <admin:AdminControl id="AdminControl1" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <core:NotificationBar ID="NotificationBar" runat="server" />
    <util:CssManager ID="CssManager" runat="server" />
    <core:KnowledgeActivatedControl ID="KnowledgeActivatedControl" runat="server" />
</asp:Content>

