﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IgnoredInboundLinks.aspx.cs" Inherits="SEOChecker.Pages.IgnoreList.IgnoredInboundLinks" MasterPageFile="/umbraco/masterpages/umbracoPage.Master" %>
<%@ Register Assembly="controls" Namespace="umbraco.uicontrols" TagPrefix="umbraco" %>
<%@ Register TagPrefix="SEOChecker" Namespace="SEOChecker.Core.Controls" Assembly="SEOChecker.Core" %>
<%@ Import Namespace="SEOChecker.Resources" %>
<asp:Content ID="header" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../../css/SEOChecker.css" />
    <script type="text/javascript" src="../../scripts/seochecker.js"></script>
    <script type="text/javascript">
        function DeleteItem(id) {
            $('.ActionPanel' + id).fadeOut(250);
        }

        function OpenDeleteDialog(id) {
            UmbClientMgr.openModalWindow('plugins/SEOChecker/pages/dialogs/confirmdeleteignorelist.aspx?type=inboundlink&id=' + id, 'Delete', true, 400, 300);
        }
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    <umbraco:UmbracoPanel ID="UmbracoPanel" runat="server">
        <SEOChecker:SEOCheckerPanel ID="SEOCheckerPanel" runat="server" />

        <asp:PlaceHolder ID="NoIssuesPlaceHolder" runat="server">
            <h2>
                <%= ResourceHelper.Instance.GetStringResource("Overview_IgnoredInboundLinks_NoResult")%></h2>
        </asp:PlaceHolder>
        <asp:PlaceHolder ID="OverviewPlaceHolder" runat="server">
            <asp:Repeater ID="OverviewRepeater" runat="server">
                <ItemTemplate>
                    <asp:Panel ID="NotFoundPanel" runat="server" CssClass='<%#string.Format("ActionPanel{0}",Eval("NotFoundId")) %>'>
                        <umbraco:Pane ID="NotFoundPane" runat="server">
                            <div class="propertyItem">
                                <div class="propertyItemheader">
                                    <div class="bulkItemSelectChecboxContainer"><input type="checkbox" value='<%#Eval("NotFoundId") %>' class="bulkItemSelectCheckbox"/></div>
                                    <%# Eval("Url")%>
                                </div>
                                <div class="propertyItemContent">
                                    <%# FormatUrlMessage(Eval("Url")) %>
                                </div>
                                <div class="SEOCheckerOverviewButtons">
                                    <SEOChecker:DeleteButton ID="DeleteButton1" runat="server" IssueId='<%#Eval("NotFoundId") %>' />
                                </div>
                            </div>
                        </umbraco:Pane>
                    </asp:Panel>
                </ItemTemplate>
            </asp:Repeater>
            <asp:PlaceHolder runat="server" id="PagingPlaceHolder"/>
        </asp:PlaceHolder>
    </umbraco:UmbracoPanel>
</asp:Content>
