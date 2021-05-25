<%@ Page Language="C#" AutoEventWireup="true" EnableSessionState="True" MasterPageFile="~/Site.Master" Inherits="Salamander.ActivePublisher.SynchronizersReport" Codebehind="Synchronizers.aspx.cs" AspCompat="true" %>
<%@ OutputCache NoStore="true" Location="None" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <script src="<%= this.Page.ClientScript.GetWebResourceUrl(typeof(Salamander.Web.Core.WebCoreResources), Salamander.Web.Core.WebCoreResources.ScriptResource_BasicReport) %>" type="text/javascript" async="async"></script>
    <link href="<%= this.Page.ClientScript.GetWebResourceUrl(typeof(Salamander.Web.Core.WebCoreResources), Salamander.Web.Core.WebCoreResources.StyleSheetResource_NonModel) %>" type="text/css" rel="Stylesheet"/>
    <link href="<%= this.Page.ClientScript.GetWebResourceUrl(typeof(Salamander.Web.Core.WebCoreResources), Salamander.Web.Core.WebCoreResources.StyleSheetResource_BasicReport) %>" type="text/css" rel="Stylesheet"/>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <h1>Scheduled Synchronizer Report</h1>
    <button id="showScheduledButton" class="right" onclick="toggleScheduled(this); return false;">Show Scheduled Only</button>
    <button id="showHideIdsButton" class="right" onclick="toggleHiddenIds(this); return false;">Show IDs</button>
    <div class="sat-heading-jump-link">
	    <a href="#table">Go to ordered execution results &gt;</a>
    </div>
    <p>
        <asp:Literal ID="information" runat="server"></asp:Literal>
    </p>
</asp:Content>