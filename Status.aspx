<%@ Page Language="C#" AutoEventWireup="true" EnableSessionState="True" MasterPageFile="~/Site.Master" CodeBehind="Status.aspx.cs" Inherits="Salamander.ActivePublisher.Status" AspCompat="true" %>
<%@ OutputCache NoStore="true" Location="None" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">

    <!-- Styles taken from BUIQueryStoreReport (and amended slightly) -->
    <style type="text/css">
        .querystats                   { background-color: #FFFFFF;font-size:9pt; text-align: left; vertical-align: top; border-collapse: collapse; text-align:right; white-space: nowrap; } 
        .querystats thead             { background-color: #1F9FF5; border: solid 1px #006FF0; } 
        .querystats th                { font-weight: bold; font-size: 10pt; text-align: left; } 
        .querystats tr td             { border: solid 1px #006FF0 } 
        .querystats tr td:first-child { text-align:left; }
        .querystats tr td:last-child  { text-align:left; }
        .querystats tr:last-child td  { font-weight:bold; }
    </style>

    <link href="<%= this.Page.ClientScript.GetWebResourceUrl(typeof(Salamander.Web.Core.WebCoreResources), Salamander.Web.Core.WebCoreResources.StyleSheetResource_NonModel) %>" type="text/css" rel="Stylesheet"/>

</asp:Content>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <h1>Status</h1>
    <p>
        <asp:Literal ID="information" runat="server"></asp:Literal>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" />
    </p>
</asp:Content>
