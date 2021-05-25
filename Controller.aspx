<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Controller.aspx.cs" Inherits="Salamander.Web.Controller" AspCompat="true" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Register TagPrefix="cc1" Namespace="Salamander.Web.Core.Controls" Assembly="Salamander.Web.Core" %>
<%@ Register TagPrefix="cc1" Namespace="Salamander.Web.Core.Interfaces" Assembly="Salamander.Web.Core" %>
<%@ Register TagPrefix="cc1" Namespace="Salamander.Web.Util.Controls" Assembly="Salamander.Web.Util" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        html, body, #layout {
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
        }
        
        body {
            background-color: <%= System.Drawing.ColorTranslator.ToHtml(this.ActivePublishingSettings.ModelOuterPageColour) %>;
            <%--  IN:9230 --%>
            display: table;
        }
        
        body form {
            <%-- IN:9230 --%>
            display: table-cell;
            vertical-align: <%
                switch (this.ActivePublishingSettings.ModelPosition) {
                    case Salamander.Web.Core.Configuration.ActivePublishingSettings.ModelPositioning.TL:
                    case Salamander.Web.Core.Configuration.ActivePublishingSettings.ModelPositioning.TM:
                    case Salamander.Web.Core.Configuration.ActivePublishingSettings.ModelPositioning.TR:
                        Response.Write("top");
                        break;
                    case Salamander.Web.Core.Configuration.ActivePublishingSettings.ModelPositioning.BL:
                    case Salamander.Web.Core.Configuration.ActivePublishingSettings.ModelPositioning.BM:
                    case Salamander.Web.Core.Configuration.ActivePublishingSettings.ModelPositioning.BR:
                        Response.Write("bottom");
                        break;
                    case Salamander.Web.Core.Configuration.ActivePublishingSettings.ModelPositioning.ML:
                    case Salamander.Web.Core.Configuration.ActivePublishingSettings.ModelPositioning.M:
                    case Salamander.Web.Core.Configuration.ActivePublishingSettings.ModelPositioning.MR:
                    default:
                        Response.Write("middle");
                        break;
                }
             %>;
        }
       
        #Container {
        	position: relative;
        }
        
        .InteractiveModel {
            z-index: 1;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <table id="layout" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center" valign="middle" runat="server" id="modelPositioning">
                <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" />
                <cc1:EventManager ID="EventManager1" runat="server" />
                <asp:Panel ID="Container" runat="server">
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
                    <cc1:StaticMatrixControl ID="StaticMatrix1" runat="server" Visible="false" />
                </asp:Panel>
                <cc1:NotificationBar ID="NotificationBar1" runat="server" />
            </td>
        </tr>
    </table>
    <cc1:CssManager ID="CssManager1" runat="server" />
    <cc1:KnowledgeActivatedControl ID="KnowledgeActivatedControl1" runat="server" />
</asp:Content>
