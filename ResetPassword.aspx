<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" Title="Reset Password" CodeBehind="ResetPassword.aspx.cs" Inherits="Salamander.ActivePublisher.ResetPassword" AspCompat="true"%>
<%@ Register TagPrefix="core" Namespace="Salamander.Web.Core.Controls" Assembly="Salamander.Web.Core" %>
<%@ Register TagPrefix="util" Namespace="Salamander.Web.Util.Controls" Assembly="Salamander.Web.Util" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <link href="<%= this.Page.ClientScript.GetWebResourceUrl(typeof(Salamander.Web.Core.WebCoreResources), Salamander.Web.Core.WebCoreResources.StyleSheetResource_NonModel) %>" type="text/css" rel="Stylesheet"/>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:ScriptManager ID="ScriptManager" runat="server" EnableScriptGlobalization="true" AsyncPostBackTimeout="300" />
    <core:EventManager ID="EventManager" runat="server" />
    <div style="width: calc(100% - 30px); height: calc(100% - 30px); position: absolute; display: flex; justify-content: center; align-items: center;">
        <core:TokenResetPasswordControl ID="ResetPasswordControl" runat="server" />
    </div>
    <core:NotificationBar ID="NotificationBar" runat="server" />
    <util:CssManager ID="CssManager" runat="server" />
</asp:Content>