<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminControl.ascx.cs" Inherits="Salamander.Web.Controls.AdminControl" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Register TagPrefix="mood" Namespace="Salamander.MooDAPI" Assembly="Salamander.MooDAPI" %>
<%@ Register TagPrefix="core" Namespace="Salamander.Web.Core.Controls" Assembly="Salamander.Web.Core" %>
<%@ Register TagPrefix="util" Namespace="Salamander.Web.Util.Controls" Assembly="Salamander.Web.Util" %>

    <table id="search" cellspacing="0" cellpadding="5" width="800px">
        <tr>
            <td id="searchRepository" width="410px">
                Administer '<%= GetRepositoryName() %>'
            </td>
            <td>
            </td>
            <td>
                <asp:TextBox id="SearchText" runat="server" Width="150px" title="Name (or part of the name) of the user to search for" />
            </td>
            <td>
                <asp:Button id="Search" runat="server" Text="Search" Width="100px" Height="24px" onclick="Search_Click" title="Search for a user with the name" />
            </td>
            <td>
                <asp:Button id="SearchAll" runat="server" Text="All" Width="100px" Height="24px" onclick="SearchAll_Click" title="Show all users" />
            </td>
        </tr>
    </table>
    <asp:Repeater id="Repeater" runat="server" onitemcommand="Repeater_ItemCommand">
        <HeaderTemplate>
            <table id="users" cellspacing="0" cellpadding="5" width="800px">
                <tr id="usersButtons">
                    <td>
                        <input id="AllSelected" runat="server" type="checkbox" value="11-" title="Select all users" />
                    </td>
                    <td colspan="6" align="center">
                        <table>
                            <tr>
                                <td>
                                    <asp:Button id="Create" runat="server" Text="New User..." Width="100px" Height="24px" onclick="Create_Click" title="Create a new user" />
                                </td>
                                <td>
                                    <asp:Button id="Unlock" runat="server" Text="Unlock" Width="100px" Height="24px" onclick="Unlock_Click" title="Unlock the selected users" />
                                </td>
                                <td>
                                    <asp:Button id="Enable" runat="server" Text="Enable" Width="100px" Height="24px" onclick="Enable_Click" title="Enable the selected users" />
                                </td>
                                <td>
                                    <asp:Button id="Disable" runat="server" Text="Disable" Width="100px" Height="24px" onclick="Disable_Click" title="Disable the selected users" />
                                </td>
                                <td>
                                    <asp:Button id="Reset" runat="server" Text="Password Token(s)..." Width="150px" Height="24px" onclick="Reset_Click" title="Create reset password tokens for the selected users which can be used at 'ResetPassword.aspx' by the user to set their password" />
                                </td>
                                <td>
                                    <asp:Button id="Settings" runat="server" Text="Settings..." Width="100px" Height="24px" onclick="Settings_Click" title="Edit the web configuration settings" />
                                </td>
                                <td width="100%">
                                </td>
                                <td>
                                    <asp:LinkButton id="Prev" runat="server" Text="<" onclick="Prev_Click" title="Previous" />
                                </td>
                                <td>
                                    <asp:Label ID="Page" runat="server" Text="0&nbsp;of&nbsp;0" />
                                </td>
                                <td>
                                    <asp:LinkButton id="Next" runat="server" Text=">" onclick="Next_Click" title="Next" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="usersHeader">
                    <th width="25px" align="left"></th>
                    <th width="160px" align="left"><asp:LinkButton ID="SortName" runat="server" Text="Name" onclick="SortName_Click" title="Sort by name" /></th>
                    <th width="55px" align="left"><asp:LinkButton ID="SortActive" runat="server" Text="Active" onclick="SortActive_Click" title="Sort by active" /></th>
                    <th width="170px" align="left"><asp:LinkButton ID="SortActivity" runat="server" Text="Last&nbsp;Activity" onclick="SortActivity_Click" title="Sort by last activity" /></th>
                    <th width="140px" align="left"><asp:LinkButton ID="SortLogin" runat="server" Text="Last&nbsp;Login" onclick="SortLogin_Click" title="Sort by last login" /></th>
                    <th width="125px" align="left"><asp:LinkButton ID="SortPassword" runat="server" Text="Password&nbsp;Update" onclick="SortPassword_Click" title="Sort by last password update" /></th>
                    <th width="125px" align="left"><asp:LinkButton ID="SortLock" runat="server" Text="Account&nbsp;Lock" onclick="SortLock_Click" title="Sort by last account lock" /></th>
                </tr>
        </HeaderTemplate>

        <ItemTemplate>
                <tr id="usersNormal">
                    <td>
                        <input id="Selected" runat="server" type="checkbox" value='<%# DataBinder.Eval(Container.DataItem, "UniqueId") %>' title='<%# "Select: " + DataBinder.Eval(Container.DataItem, "Name") %>' />
                    </td>
                    <td>
                        <div style="width:150px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
                            <asp:LinkButton id="Edit" runat="server" CommandName="EditUser" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "UniqueId") %>' Text='<%# Clean(DataBinder.Eval(Container.DataItem, "Name")) %>' title='<%# "Edit: " + Clean(DataBinder.Eval(Container.DataItem, "Name")) %>' />
                        </div>
                    </td>
                    <td>
                        <%# DataBinder.Eval(Container.DataItem, "Enabled", "{0}")%>
                    </td>
                    <td>
                        <div style="width:160px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" title='<%# Clean(DataBinder.Eval(Container.DataItem, "LastActivityTitle", "{0}"))%>'>
                            <%# DataBinder.Eval(Container.DataItem, "LastActivity", "{0}")%>
                        </div>
                    </td>
                    <td>
                        <%# DataBinder.Eval(Container.DataItem, "LastLogin", "{0}").Replace(" ", "&nbsp;") %>
                    </td>
                    <td>
                        <%# DataBinder.Eval(Container.DataItem, "LastPasswordUpdate", "{0}").Replace(" ", "&nbsp;")%>
                    </td>
                    <td>
                        <%# DataBinder.Eval(Container.DataItem, "LastLocked", "{0}").Replace(" ", "&nbsp;")%>
                    </td>
                </tr>
        </ItemTemplate>

        <AlternatingItemTemplate>
                <tr id="usersAlternate">
                    <td>
                        <input id="Selected" runat="server" type="checkbox" value='<%# DataBinder.Eval(Container.DataItem, "UniqueId") %>' title='<%# "Select: " + Clean(DataBinder.Eval(Container.DataItem, "Name")) %>' />
                    </td>
                    <td>
                        <div style="width:150px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
                            <asp:LinkButton id="Edit" runat="server" CommandName="EditUser" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "UniqueId") %>' Text='<%# Clean(DataBinder.Eval(Container.DataItem, "Name")) %>' title='<%# "Edit: " + Clean(DataBinder.Eval(Container.DataItem, "Name")) %>' />
                        </div>
                    </td>
                    <td>
                        <%# DataBinder.Eval(Container.DataItem, "Enabled", "{0}")%>
                    </td>
                    <td>
                        <div style="width:160px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" title='<%# Clean(DataBinder.Eval(Container.DataItem, "LastActivityTitle", "{0}"))%>'>
                            <%# DataBinder.Eval(Container.DataItem, "LastActivity", "{0}")%>
                        </div>
                    </td>
                    <td>
                        <%# DataBinder.Eval(Container.DataItem, "LastLogin", "{0}").Replace(" ", "&nbsp;") %>
                    </td>
                    <td>
                        <%# DataBinder.Eval(Container.DataItem, "LastPasswordUpdate", "{0}").Replace(" ", "&nbsp;")%>
                    </td>
                    <td>
                        <%# DataBinder.Eval(Container.DataItem, "LastLocked", "{0}").Replace(" ", "&nbsp;")%>
                    </td>
                </tr>
        </AlternatingItemTemplate>
        
        <FooterTemplate>
                <tr id="usersButtons">
                    <td>
                        <input id="AllSelected" runat="server" type="checkbox" value="11-" title="Select all users"/>
                    </td>
                    <td colspan="6" align="center">
                        <table>
                            <tr>
                                <td>
                                    <asp:Button id="Create" runat="server" Text="New User..." Width="100px" Height="24px" onclick="Create_Click" title="Create a new user" />
                                </td>
                                <td>
                                    <asp:Button id="Unlock" runat="server" Text="Unlock" Width="100px" Height="24px" onclick="Unlock_Click" title="Unlock the selected users" />
                                </td>
                                <td>
                                    <asp:Button id="Enable" runat="server" Text="Enable" Width="100px" Height="24px" onclick="Enable_Click" title="Enable the selected users" />
                                </td>
                                <td>
                                    <asp:Button id="Disable" runat="server" Text="Disable" Width="100px" Height="24px" onclick="Disable_Click" title="Disable the selected users" />
                                </td>
                                <td>
                                    <asp:Button id="Reset" runat="server" Text="Password Token(s)..." Width="150px" Height="24px" onclick="Reset_Click" title="Create reset password tokens for the selected users which can be used at 'ResetPassword.aspx' by the user to set their password" />
                                </td>
                                <td>
                                    <asp:Button id="Settings" runat="server" Text="Settings..." Width="100px" Height="24px" onclick="Settings_Click" title="Edit the web configuration settings" />
                                </td>
                                <td width="100%">
                                </td>
                                <td>
                                    <asp:LinkButton id="Prev" runat="server" Text="<" onclick="Prev_Click" title="Previous" />
                                </td>
                                <td>
                                    <asp:Label ID="Page" runat="server" Text="0&nbsp;of&nbsp;0" />
                                </td>
                                <td>
                                    <asp:LinkButton id="Next" runat="server" Text=">" onclick="Next_Click" title="Next" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    
    <div class="WebPanelOverlay">
        <core:InputFormControl id="CreateUserPopup" runat="server" />
    </div>

    <div class="WebPanelOverlay">
        <core:InputFormControl id="EditUserPopup" runat="server" />
    </div>
    
    <div class="WebPanelOverlay">
        <core:InputFormControl id="ResetPasswordPopup" runat="server" />
    </div>

    <div class="WebPanelOverlay">
        <core:InputFormControl id="SettingsPopup" runat="server" />
    </div>
