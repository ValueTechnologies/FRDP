<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.master" AutoEventWireup="true" CodeBehind="GeneratorMonthlyFuelRpt.aspx.cs" Inherits="FRDP.GeneratorMonthlyFuelRpt" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Generator Selection</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
                                    <br />
<table style="width:96.4%; margin-left:20px; margin-right:20px;">
    <tbody>
    <tr>
        <td style="width:100px;">Location</td>
        <td style="text-align:left; width: 40%;">
            <asp:DropDownList ID="ddlLocation" runat="server" Width="94%" AutoPostBack="True" DataSourceID="SDLocation" DataTextField="CompanyName" DataValueField="CompanyID" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"></asp:DropDownList>
            <asp:SqlDataSource ID="SDLocation" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="sp_AllCompaniesListByEmp" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:CookieParameter CookieName="Emp_Id" Name="User_ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td style="width:100px;">Generator</td>
        <td style="text-align:left;">
            <asp:SqlDataSource ID="SDGenerator" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT tblGeneratorID AS ID, ISNULL(Modal, '') + ' ' + ISNULL(Brand, '') AS Modal FROM tblGenerator WHERE (LocationID = @LocationID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlLocation" DefaultValue="" Name="LocationID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="ddlGenerator" runat="server" Width="94%" DataSourceID="SDGenerator" DataTextField="Modal" DataValueField="ID"></asp:DropDownList></td>
    </tr>
        <tr>
            <td>Month</td>
            <td>
                <asp:DropDownList ID="ddlMonth" runat="server"  Width="94%">
                    <asp:ListItem Value="1">January</asp:ListItem>
                    <asp:ListItem Value="2">February</asp:ListItem>
                    <asp:ListItem>March</asp:ListItem>
                    <asp:ListItem Value="4">April</asp:ListItem>
                    <asp:ListItem Value="5">May</asp:ListItem>
                    <asp:ListItem Value="6">June</asp:ListItem>
                    <asp:ListItem Value="7">July</asp:ListItem>
                    <asp:ListItem Value="8">August</asp:ListItem>
                    <asp:ListItem Value="9">September</asp:ListItem>
                    <asp:ListItem Value="10">October</asp:ListItem>
                    <asp:ListItem Value="11">November</asp:ListItem>
                    <asp:ListItem Value="12">December</asp:ListItem>
                </asp:DropDownList></td>
            <td>Year</td>
            <td>
                <asp:DropDownList ID="ddlYear" runat="server" Width="94%">
                    <asp:ListItem Selected="True">2015</asp:ListItem>
                    <asp:ListItem>2016</asp:ListItem>
                    <asp:ListItem>2017</asp:ListItem>
                    <asp:ListItem>2018</asp:ListItem>
                    <asp:ListItem>2019</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td><asp:Button ID="btnShowRpt" CssClass="btn btn-info" runat="server" Text="Show Report" OnClick="btnShowRpt_Click" /></td>
        </tr>
    </tbody>
</table><br />
</div>

                            </div>

                        </div>
    </div>
           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Generator Fuel Report</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
                                    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%"></rsweb:ReportViewer>
</div>

                            </div>

                        </div>
    </div>
</asp:Content>
