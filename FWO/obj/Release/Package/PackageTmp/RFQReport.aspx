<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="RFQReport.aspx.cs" Inherits="FRDP.RFQReport" %>

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
                        <span>Request For Quotation</span>
                    </h4>
                    <a href="#" class="minimize">Minimize</a>
                </div>
                <div class="content noPad">
                    <br />
                    <div style="width: 100%; margin-left: 20px;">
                        <strong>Select Request For Quotation </strong>:
                        <asp:DropDownList ID="ddRFQs" ClientIDMode="Static" runat="server" DataSourceID="SDRFQs" DataTextField="tblInvReqNo" DataValueField="tblInvReqMainID" AutoPostBack="True"></asp:DropDownList>
                        <asp:SqlDataSource ID="SDRFQs" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT tblInvReqMainID, 'RFQ' + CAST(DATEPART(YYYY, GETDATE()) AS VARCHAR(4)) + '-' + RIGHT ('000000' + CAST(yearlyNo AS VARCHAR(50)), 6) + '-' + CAST(ToStoreID AS VARCHAR(50)) AS tblInvReqNo FROM tblInvReqMain WHERE (Type = 'RFQ') ORDER BY EnteryDateTime DESC"></asp:SqlDataSource>
                    </div>
                    <div  style="width: 100%; margin-left: 20px;">
                        <strong>select Vendor </strong>  : 
                        <asp:DropDownList ID="ddVendor" runat="server" DataSourceID="SDVendor" DataTextField="VenderNo" DataValueField="tblVenderID"></asp:DropDownList><asp:SqlDataSource ID="SDVendor" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT tblInvReqMainVenders.tblVenderID, 'VND' + RIGHT ('00000000000' + CAST(tblVender.VenderNo AS VARCHAR(10)), 5) + ' ' + ISNULL(tblVender.Name, '') AS VenderNo FROM tblInvReqMainVenders INNER JOIN tblVender ON tblInvReqMainVenders.tblVenderID = tblVender.tblVenderID WHERE (tblInvReqMainVenders.tblInvReqMainID = @tblInvReqMainID) ORDER BY VenderNo">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddRFQs" DefaultValue="0" Name="tblInvReqMainID" PropertyName="SelectedValue" />
                        </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Button ID="btnGetRpt" CssClass="btn btn-info" Style="margin-left: 10px; margin-bottom: 10px;"
                            runat="server" Text="Generate Report" OnClick="btnGetRpt_Click" />
                    </div>
                    <br />
                    <div>
                        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%"></rsweb:ReportViewer>
                    </div>
                    <br />
                </div>

            </div>

        </div>
    </div>
</asp:Content>
