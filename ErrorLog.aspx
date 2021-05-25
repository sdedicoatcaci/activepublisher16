<%@ Page language="c#" Inherits="Salamander.ActivePublisher.ErrorLog" Codebehind="ErrorLog.aspx.cs" AspCompat="true" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head id="pageHead" runat="server">
		<title>Error Log</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio 7.0">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
        <asp:PlaceHolder id="headContent" runat="server">
            <link href="<%= this.Page.ClientScript.GetWebResourceUrl(typeof(Salamander.Web.Core.WebCoreResources), Salamander.Web.Core.WebCoreResources.StyleSheetResource_NonModel) %>" type="text/css" rel="Stylesheet" />
        </asp:PlaceHolder>
	</head>
	<body id="pageBody" runat="server">
	    <span style="font-size: larger; font-weight: bolder;">Error Log</span><span> - <%= System.DateTime.Now.ToString() %></span>
	    <form id="form1" method="post" runat="server">
	    <asp:Repeater id="Repeater" runat="server">
            <HeaderTemplate>
                <table class="bordercollapse" cellspacing="1" cellpadding="5">
                    <tr>
                        <th style="border: solid 1px gray"><b>Date &amp; Time</b></th>
                        <th style="border: solid 1px gray"><b>Type</b></th>
                        <th style="border: solid 1px gray"><b>Report</b></th>
                    </tr>
            </HeaderTemplate>

            <ItemTemplate>
                    <tr>
                        <td rowspan="2" valign="top"> <%# DataBinder.Eval(Container.DataItem, "Date") %> </td>
                        <td rowspan="2" valign="top"> <%# DataBinder.Eval(Container.DataItem, "Type") %> </td>
                        <td> <%# DataBinder.Eval(Container.DataItem, "Message") %> </td>
                    </tr>
                    <tr>
                        <td> <%# DataBinder.Eval(Container.DataItem, "StackTrace") %> </td>
                    </tr>
                    <tr>
                        <td colspan="3"><hr/></td>
                    </tr>
            </ItemTemplate>

            <FooterTemplate>
                </table>
            </FooterTemplate>

        </asp:Repeater>
        </form>
	</body>
</html>
