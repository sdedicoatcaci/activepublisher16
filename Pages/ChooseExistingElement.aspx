<%@ Page Language="C#" MasterPageFile="~/Pages/Dialog.Master" AutoEventWireup="true" AspCompat="true" MaintainScrollPositionOnPostback="true" CodeBehind="ChooseExistingElement.aspx.cs" Inherits="Salamander.Web.Pages.ChooseExistingElement" %>
<%@ Register assembly="Salamander.Web.Core" namespace="Salamander.Web.Core.Controls" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    <table style="margin-left: auto; margin-right: auto;">
        <tr>
            <td>
                <div>
                    <span>Please select the element to add as a relationship:</span>
                    <br />
                    <br />
                    <cc1:RepositoryExplorerControl ID="RepositoryExplorerControl1" runat="server" ApplyWebVisible="true" ShowRootElement="false" />
                    <br />
                    <br />
                    <center>
                        <input id="cmdCancel" type="button" class="button" value="Cancel" onclick="window.top.Salamander.PopupManager.hide(false); return false;"/>
                    </center>
                </div>
            </td>    
        </tr>
    </table>
</asp:Content>
