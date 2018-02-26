<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="accFincialReportsFolder.aspx.cs" Inherits="FRDP.accFincialReportsFolder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">

            <div class="box gradient">

                <div class="title">

                    <h4>
                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                        <span>Select Financial Reports</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <div style="width:80%; margin:0 auto; margin-bottom: 100px;">
                    <asp:DataList ID="dlButtons" runat="server" DataSourceID="dsButtons" RepeatDirection="Horizontal" Height="16px" RepeatColumns="4" Style="text-align: center" Width="99%">
                        <ItemTemplate>
                            <br />
                            <div style="width: 158px; height: 97px" class="Grd" onclick="location.href='<%# Eval("Page_Addr") %>';" title='<%# Eval("Page_Desc") %>'>
                                <img alt="<%# Eval("Page_Name") %>" src="<%# Eval("Page_Pic") %>" width="54" height="54" />
                                <br />
                                <%# Eval("Page_Name") %>
                            </div>

                        </ItemTemplate>
                    </asp:DataList></div>
                    <asp:SqlDataSource ID="dsButtons" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT Page_Addr, Page_Desc, Page_Name, Page_Pic FROM TblPages WHERE (Page_Level = 5) ORDER BY S_Order" DataSourceMode="DataReader">
                    </asp:SqlDataSource>
                    <br />
                </div>

            </div>

        </div>
    </div>
</asp:Content>
