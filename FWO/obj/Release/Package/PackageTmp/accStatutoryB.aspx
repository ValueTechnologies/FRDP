<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="accStatutoryB.aspx.cs" Inherits="FRDP.accStatutoryB" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">


        td[align="right"] {
        text-align:right !important;
        }
    </style>
           <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Statutory Statements</span>
                                    </h4>
                                    <a href="#" class="minimize">Minimize</a>
                                </div>
                                <div class="content noPad">
<%--=====================--%><br />
<div style="margin-left: 10px; margin-top: 10px">
        <div class="tab0">
            &nbsp;<div class="tab1" style="float: left">&nbsp;Search Parameters</div>
            <div class="tab2">&nbsp;</div>
        </div>
        <div>
            <table style="width: 100%;">
                <tr>
                    <td colspan="2" class="tdTitle">
                        <asp:SqlDataSource ID="dsComp" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT CompanyName InstName, CompanyAddress Addressline, CompanyPhoneNo Phs, CASE WHEN ISNULL(CompanyLogo,'') = '' THEN './images/EG2.png' ELSE '/Uploads/CompanyProfile/' + Cast(CompanyID as varchar(50))+CompanyLogo END AS Logo FROM tbl_Company WHERE (CompanyID = 16)"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        <strong>Select Financial Year :</strong></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 100px; text-align: right; vertical-align:top;">
                        
                         <asp:DropDownList ID="ddYear" runat="server" ClientIDMode="Static" DataSourceID="dsFY" DataTextField="SessionName" DataValueField="Session_ID">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="dsFY" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT SessionName, Session_ID FROM tblAC_Year"></asp:SqlDataSource>

                        </td>
                    <td>
                        <asp:Button ID="btnView" runat="server" CssClass="btn btn-info" Text="Balance Sheet" OnClick="btnView_Click" ClientIDMode="Static" />
                        <asp:CalendarExtender ID="txFrom_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txFrom">
                        </asp:CalendarExtender>


                        <br />
                        <asp:TextBox ID="txTo0" runat="server" Visible="False">30 June 2015</asp:TextBox>
                        <br />
                        <asp:CalendarExtender ID="txTo0_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txTo0">
                        </asp:CalendarExtender>


                        <asp:TextBox ID="txH1" runat="server" Visible="False">2015</asp:TextBox>
                        <asp:CalendarExtender ID="txH1_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txH1">
                        </asp:CalendarExtender>


                        <br />
                        <asp:TextBox ID="txH2" runat="server" Visible="False">2016</asp:TextBox>
                        <asp:CalendarExtender ID="txH2_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txH2">
                        </asp:CalendarExtender>


                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">&nbsp;</td>
                    <td>
                        <asp:TextBox ID="txFrom" runat="server" Visible="False">01 July 2015</asp:TextBox>
                        <asp:TextBox ID="txFrom0" runat="server" Visible="False">01 July 2014</asp:TextBox>
                        <asp:CalendarExtender ID="txFrom0_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txFrom0">
                        </asp:CalendarExtender>
                        <asp:TextBox ID="txTo" runat="server" Visible="False">30 June 2016</asp:TextBox>
                        <asp:CalendarExtender ID="txTo_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txTo">
                        </asp:CalendarExtender>


                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
            </table>
        </div>
        <br />
        <div id="Parea" class="pcontant" style="width: 99%;">
            <table style="width: 99%;">
                <tr>
                    <td>
                        <asp:DetailsView ID="dvCompany" runat="server" AutoGenerateRows="False" BorderStyle="None" DataSourceID="dsComp" GridLines="None" Height="50px" Width="100%">
                            <Fields>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <div>
                                            <div id="CompID" style="float: left; text-align: center; width: 90px; height: 80px;">
                                                <img alt='<%# Eval("InstName") %>' src="<%# Eval("Logo")%>" style="width: auto; height: auto; max-height: 100%; max-width: 100%;" />
                                            </div>
                                            <div style="float: left; width: 65%;margin-top: 10px;">
                                                <b style="font-size: large;"><%# Eval("InstName") %></b>
                                                <br />
                                                <%# Eval("Addressline") %>
                                                <br />
                                                <%# Eval("Phs") %>
                                            </div>
                                            <br />
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>
                    </td>
                    <td style="vertical-align: top">
                        <div id="AcYearID" class="<%:Session["CodeSt"] %>" tag="<%:Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy") %> NoPrnt" style="float: right; margin-right: 6px; text-align: right; vertical-align: top;">
                            Financial Year : <%:Convert.ToDateTime(Session["ActYr"]).ToString("MMMM yyyy")+"-"+Convert.ToDateTime(Session["ActYr2"]).ToString("yy") %><br />
                            <%:Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy") %>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; font-variant: small-caps; font-size: x-large; font-weight: bold;">Income Statement</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblDates" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="border-top-style: solid; border-width: thin; border-color: #333333">&nbsp;</td>
                    <td style="border-top-style: solid; border-width: thin; border-color: #333333">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="gvHeads" runat="server" AutoGenerateColumns="False" BorderStyle="None" DataSourceID="dsHeads" GridLines="None" ShowHeader="False" Width="100%">
                            <Columns>
                                <asp:TemplateField HeaderText="HeadName" SortExpression="HeadName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HeadName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <table style="width:100%;">
                                            <tr>
                                                <td>
<h3>
                                            <asp:Label ID="lblAcHead" runat="server" Text='<%# Eval("AcType") %>'></asp:Label>
                                        </h3>
                                                </td>
                                                <td style="text-align:right;"><h3 class="yrheading1"></h3></td>
                                                <td style="width:204px;text-align:right;"><h3  class="yrheading2"></h3></td>
                                            </tr>
                                        </table>
                                        
                                        <div style="margin-left: 21px; margin-top: 5px; margin-bottom: 3px;">
                                            <asp:GridView ID="gvGrpHeads" runat="server" AutoGenerateColumns="False" BorderStyle="None" DataSourceID="dsGrpHeads" GridLines="None" ShowHeader="False" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="AcGroup" SortExpression="AcGroup">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AcGroup") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblGrpH" runat="server" Style="font-weight: 700" Text='<%# Bind("AcGroup") %>'></asp:Label>
                                                            <div style="margin-left: 18px; margin-top: 4px; margin-bottom: 4px;">
                                                                <asp:GridView ID="gvAccounts" runat="server" AutoGenerateColumns="False" BorderStyle="None" DataSourceID="dsAccounts" GridLines="None" ShowHeader="False" Width="100%">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="Acc" HeaderText="Acc" SortExpression="Acc" />
                                                                        <asp:BoundField DataField="Amount" DataFormatString="{0:#,#.00;(#,#.00)}" HeaderText="Amount" SortExpression="Amount">
                                                                            <ItemStyle HorizontalAlign="Right" Width="200px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Amount1" DataFormatString="{0:#,#.00;(#,#.00)}" HeaderText="Amount Last" SortExpression="Amount1">
                                                                        <ItemStyle HorizontalAlign="Right" Width="200px" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                            <table class="table" style="width: 99%;margin-left: 18px;">
                                                                <tr>
                                                                    <td>&nbsp;</td>
                                                                    <td style="text-align:right;"><strong>Total </strong><asp:Label ID="lblGrpH0" runat="server" Style="font-weight: 700" Text='<%# Bind("AcGroup") %>' Visible="False"></asp:Label></td>
                                                                    <td style="text-align:right;width: 130px;"><asp:Label ID="lblGrpH1" runat="server" Font-Overline="True" Style="font-weight: 700;" Text='<%# Bind("Amount", "{0:#,#.00;(#,#.00)}") %>'></asp:Label></td>
                                                                    <td style="text-align:right;width: 183px;"><asp:Label ID="lblGrpH2" runat="server" Font-Overline="True" Style="font-weight: 700;" Text='<%# Bind("Amount1", "{0:#,#.00;(#,#.00)}") %>'></asp:Label></td>
                                                                </tr>
                                                            </table>

                                                            <asp:SqlDataSource ID="dsAccounts" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT        ISNULL(T1.Acc,T2.Acc) AS Acc, T1.Amount, ISNULL(T1.AcGroup,T2.AcGroup) AS AcGroup, ISNULL(T2.Amount,0) AS Amount1
FROM            (SELECT        tblChartAc.AcCode + ' ' + tblChartAc.AcName AS Acc, SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) - SUM(ISNULL(vwVoucherDTL.AmountCre, 0)) AS Amount, tblChartAc.AcGroup
                          FROM            tblChartAc INNER JOIN
                                                    vwVoucherDTL ON tblChartAc.AcID = vwVoucherDTL.AccEntryID INNER JOIN
                                                    vwVoucherHDR ON vwVoucherDTL.VoucherID = vwVoucherHDR.VoucherID
                          WHERE        (tblChartAc.AcType = @AcType) AND (tblChartAc.AcGroup = @AcGroup) AND (tblChartAc.CompID = 16) AND (vwVoucherHDR.EntryDate &lt;= @DT) AND (vwVoucherHDR.Posted = 1)
                          GROUP BY tblChartAc.AcCode + ' ' + tblChartAc.AcName, tblChartAc.AcGroup) AS T1 FULL OUTER JOIN
                             (SELECT        tblChartAc_1.AcCode + ' ' + tblChartAc_1.AcName AS Acc, SUM(ISNULL(vwVoucherDTL_1.AmountDeb, 0)) - SUM(ISNULL(vwVoucherDTL_1.AmountCre, 0)) AS Amount, tblChartAc_1.AcGroup
                               FROM            tblChartAc AS tblChartAc_1 INNER JOIN
                                                         vwVoucherDTL AS vwVoucherDTL_1 ON tblChartAc_1.AcID = vwVoucherDTL_1.AccEntryID INNER JOIN
                                                         vwVoucherHDR AS vwVoucherHDR_1 ON vwVoucherDTL_1.VoucherID = vwVoucherHDR_1.VoucherID
                               WHERE        (tblChartAc_1.AcType = @AcType) AND (tblChartAc_1.AcGroup = @AcGroup) AND (tblChartAc_1.CompID = 16) AND (vwVoucherHDR_1.EntryDate &lt;= @DT1) AND (vwVoucherHDR_1.Posted = 1)
                               GROUP BY tblChartAc_1.AcCode + ' ' + tblChartAc_1.AcName, tblChartAc_1.AcGroup) AS T2 ON T1.Acc = T2.Acc
">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="lblAcHead" Name="AcType" PropertyName="Text" />
                                                                    <asp:ControlParameter ControlID="lblGrpH" Name="AcGroup" PropertyName="Text" />
                                                                    <asp:ControlParameter ControlID="txFrom" Name="DT" PropertyName="Text" />
                                                                    <asp:ControlParameter ControlID="txTo" Name="DT1" PropertyName="Text" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>

<table style="width: 100%;">
    <tr>
        <td>&nbsp;</td>
        <td><h3 style="text-align: right;">Total
                                        <asp:Label ID="lblAcHead0" runat="server" Text='<%# Eval("AcType") %>'></asp:Label>&nbsp;:</h3></td>
        <td style="text-align:right;width:200px;">
            <h3><asp:Label ID="lblAcHead1" CssClass="G_Totals1"  runat="server" Text='<%# Eval("Amount", "{0:#,#.00;(#,#.00)}") %>' Font-Overline="True"></asp:Label></h3>
        </td>
        <td style="text-align: right;width: 197px;"><h3><asp:Label ID="lblAcHead2" runat="server" CssClass="G_Totals1" Font-Overline="True" Text='<%# Eval("Amount1", "{0:#,#.00;(#,#.00)}") %>'></asp:Label></h3></td>
    </tr>
</table>
                                        
                                            
                                        
                                            
                                        
                                        <asp:SqlDataSource ID="dsGrpHeads" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT        ISNULL(T1.AcGroup,T2.AcGroup) AcGroup, T1.Amount, ISNULL(T2.Amount,0) AS Amount1
FROM            (SELECT        tblChartAc.AcGroup, SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) - SUM(ISNULL(vwVoucherDTL.AmountCre, 0)) AS Amount
                          FROM            tblChartAc INNER JOIN
                                                    vwVoucherDTL ON tblChartAc.AcID = vwVoucherDTL.AccEntryID INNER JOIN
                                                    vwVoucherHDR ON vwVoucherDTL.VoucherID = vwVoucherHDR.VoucherID
                          WHERE        (tblChartAc.CompID = 16) AND (vwVoucherHDR.EntryDate &lt;= @DT) AND (tblChartAc.AcType = @AcType) AND (vwVoucherHDR.Posted = 1)
                          GROUP BY tblChartAc.AcGroup) AS T1 FULL OUTER JOIN
                             (SELECT        tblChartAc_1.AcGroup, SUM(ISNULL(vwVoucherDTL_1.AmountDeb, 0)) - SUM(ISNULL(vwVoucherDTL_1.AmountCre, 0)) AS Amount
                               FROM            tblChartAc AS tblChartAc_1 INNER JOIN
                                                         vwVoucherDTL AS vwVoucherDTL_1 ON tblChartAc_1.AcID = vwVoucherDTL_1.AccEntryID INNER JOIN
                                                         vwVoucherHDR AS vwVoucherHDR_1 ON vwVoucherDTL_1.VoucherID = vwVoucherHDR_1.VoucherID
                               WHERE        (tblChartAc_1.CompID = 16) AND (vwVoucherHDR_1.EntryDate &lt;= @DT1) AND (tblChartAc_1.AcType = @AcType) AND (vwVoucherHDR_1.Posted = 1)
                               GROUP BY tblChartAc_1.AcGroup) AS T2 ON T1.AcGroup = T2.AcGroup">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblAcHead" Name="AcType" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="txFrom" Name="DT" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="txTo" Name="DT1" PropertyName="Text" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="None" DataSourceID="dsHeads0" GridLines="None" ShowHeader="False" Width="100%">
                            <Columns>
                                <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                    <ItemTemplate>
                                        <table style="width:100%">
                                            <tr>
                                                <td>&nbsp;</td>

                                                <td style="text-align:right;"><h4 style="text-align: right; text-decoration: overline;">
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Display") %>'></asp:Label>
                                            &nbsp;:
                                        <asp:Label ID="Label1" runat="server" see="G_Totals"   Text='<%# Bind("Amount", "{0:#,#.00;(#,#.00)}") %>'></asp:Label>
                                        </h4></td>
                                                <td style="width:197px; text-align:right;"><h4 style="text-align: right; text-decoration: overline;">
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Display1") %>'></asp:Label>
                                            &nbsp;:
                                        <asp:Label ID="Label4" runat="server" see="G_Totals"   Text='<%# Bind("Amount1", "{0:#,#.00;(#,#.00)}") %>'></asp:Label>
                                        </h4></td>
                                            </tr>
                                        </table>
                                        
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle HorizontalAlign="Right" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="dsHeads" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT        ISNULL(T1.AcType,T2.AcType) AS AcType, T1.Amount, ISNULL(T2.Amount,0) AS Amount1
FROM            (SELECT        tblChartAc.AcType, SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) - SUM(ISNULL(vwVoucherDTL.AmountCre, 0)) AS Amount
                          FROM            tblChartAc INNER JOIN
                                                    vwVoucherDTL ON tblChartAc.AcID = vwVoucherDTL.AccEntryID INNER JOIN
                                                    vwVoucherHDR ON vwVoucherDTL.VoucherID = vwVoucherHDR.VoucherID INNER JOIN
                                                    tblCOA ON tblChartAc.AcType = tblCOA.HeadName
                          WHERE        (tblChartAc.CompID = 16) AND (vwVoucherHDR.EntryDate &lt;= @DT) AND (tblCOA.HeadID = 1 OR
                                                    tblCOA.HeadID = 2) AND (vwVoucherHDR.Posted = 1)
                          GROUP BY tblChartAc.AcType) AS T1 FULL OUTER JOIN
                             (SELECT        tblChartAc_1.AcType, SUM(ISNULL(vwVoucherDTL_1.AmountDeb, 0)) - SUM(ISNULL(vwVoucherDTL_1.AmountCre, 0)) AS Amount
                               FROM            tblChartAc AS tblChartAc_1 INNER JOIN
                                                         vwVoucherDTL AS vwVoucherDTL_1 ON tblChartAc_1.AcID = vwVoucherDTL_1.AccEntryID INNER JOIN
                                                         vwVoucherHDR AS vwVoucherHDR_1 ON vwVoucherDTL_1.VoucherID = vwVoucherHDR_1.VoucherID INNER JOIN
                                                         tblCOA AS tblCOA_1 ON tblChartAc_1.AcType = tblCOA_1.HeadName
                               WHERE        (tblChartAc_1.CompID = 16) AND (vwVoucherHDR_1.EntryDate &lt;= @DT1) AND (tblCOA_1.HeadID = 1 OR
                                                         tblCOA_1.HeadID = 2) AND (vwVoucherHDR_1.Posted = 1)
                               GROUP BY tblChartAc_1.AcType) AS T2 ON T1.AcType = T2.AcType">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txFrom" Name="DT" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txTo" Name="DT1" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <%--SELECT        SUM(ISNULL(vwVoucherDTL.AmountCre, 0)) - SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) AS Amount  FROM            tblChartAc INNER JOIN                           vwVoucherDTL ON tblChartAc.AcID = vwVoucherDTL.AccEntryID INNER JOIN                           vwVoucherHDR ON vwVoucherDTL.VoucherID = vwVoucherHDR.VoucherID INNER JOIN                           tblCOA ON tblChartAc.AcType = tblCOA.HeadName  WHERE        (tblChartAc.CompID = 16) AND (vwVoucherHDR.EntryDate BETWEEN @DT1 AND @DT2) AND (tblCOA.HeadID = 3 OR                           tblCOA.HeadID = 4) AND (vwVoucherHDR.Posted = 1)--%>
                        <asp:SqlDataSource ID="dsHeads0" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT        ISNULL(T1.Amount,0) Amount, T1.Display, ISNULL(T2.Amount,0) AS Amount1, T2.Display AS Display1
FROM            (SELECT        Amount, CASE WHEN Y.Amount &gt; 0 THEN 'ASSETS ' ELSE 'LIABILITIES ' END AS Display
                          FROM            (SELECT        CASE WHEN SUM(ISNULL(vwVoucherDTL.AmountCre, 0)) &gt; SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) THEN (SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) 
                                                                              - SUM(ISNULL(vwVoucherDTL.AmountCre, 0))) * - 1 ELSE SUM(ISNULL(vwVoucherDTL.AmountCre, 0)) - SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) END AS Amount
                                                    FROM            tblChartAc INNER JOIN
                                                                              vwVoucherDTL ON tblChartAc.AcID = vwVoucherDTL.AccEntryID INNER JOIN
                                                                              vwVoucherHDR ON vwVoucherDTL.VoucherID = vwVoucherHDR.VoucherID INNER JOIN
                                                                              tblCOA ON tblChartAc.AcType = tblCOA.HeadName
                                                    WHERE        (tblChartAc.CompID = 16) AND (vwVoucherHDR.EntryDate &lt;= @DT) AND (tblCOA.HeadID = 1 OR
                                                                              tblCOA.HeadID = 2) AND (vwVoucherHDR.Posted = 1)) AS Y) AS T1 CROSS JOIN
                             (
							 
							 
							 SELECT        Amount, CASE WHEN Y_1.Amount &gt; 0 THEN 'ASSETS ' ELSE 'LIABILITIES ' END AS Display
                               FROM            (SELECT        CASE WHEN SUM(ISNULL(vwVoucherDTL_1.AmountCre, 0)) &gt; SUM(ISNULL(vwVoucherDTL_1.AmountDeb, 0)) THEN (SUM(ISNULL(vwVoucherDTL_1.AmountDeb, 0)) 
                                                                                   - SUM(ISNULL(vwVoucherDTL_1.AmountCre, 0))) * - 1 ELSE SUM(ISNULL(vwVoucherDTL_1.AmountCre, 0)) - SUM(ISNULL(vwVoucherDTL_1.AmountDeb, 0)) END AS Amount
                                                         FROM            tblChartAc AS tblChartAc_1 INNER JOIN
                                                                                   vwVoucherDTL AS vwVoucherDTL_1 ON tblChartAc_1.AcID = vwVoucherDTL_1.AccEntryID INNER JOIN
                                                                                   vwVoucherHDR AS vwVoucherHDR_1 ON vwVoucherDTL_1.VoucherID = vwVoucherHDR_1.VoucherID INNER JOIN
                                                                                   tblCOA AS tblCOA_1 ON tblChartAc_1.AcType = tblCOA_1.HeadName
                                                         WHERE        (tblChartAc_1.CompID = 16) AND (vwVoucherHDR_1.EntryDate &lt;= @DT1) AND (tblCOA_1.HeadID = 1 OR
                                                                                   tblCOA_1.HeadID = 2) AND (vwVoucherHDR_1.Posted = 1)
																				   
																				   
																				   ) AS Y_1) AS T2">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txFrom" Name="DT" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txTo" Name="DT1" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td id="gTotal" style="text-align: right; margin-right: 100px; vertical-align: top;">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <br />
                                    <div id="btomline">
                                        Print By: <%: Session["username"] %>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <table style="width: 99%;">
            <tr>
                <td style="text-align:right;">
                    <br />
                    <input type="button" id="btnprtP" value="Print Report" class="btn btn-info" style="margin-right: 10px;" />
                </td>
            </tr>
        </table>
    </div>
<%--=====================--%><br />
</div>

                            </div>

                        </div>
    </div>

    <script type="text/javascript">
              $(document).keypress(function (e) {
                  if (e.keyCode === 13) {
                      e.preventDefault();
                      return false;

                  }
              });
              $(document).ready(function () {
                  $(function () {
                      $('.yrheading1,.yrheading2').html('');
                      $($('.yrheading1')[0]).html($.cookie('txH1'));
                      $($('.yrheading2')[0]).html($.cookie('txH2'));


                  });
                  $('#btnView').click(function () {
                      $('#Parea').show('slow');
                  });
                  $('#btnprtP').click(function () {
                      //var content = $('#Parea').html().toString();
                      //var pwin = window.open('', 'print_content', 'width=900,height=700');

                      //pwin.document.open();

                      //pwin.document.write('<html><body onload="window.print()"><div style="width:122%;">' + content + '</div></body><style type="text/css"> input {border-width: 0px;background-color: white;}</style></html>');
                      //pwin.document.close();

                      //setTimeout(function () { pwin.close(); }, 1000);
                      $('#AcYearID').hide();
                      $('.NoPrnt').hide();
                      var mode = 'iframe'; // popup
                      var close = mode == "popup";
                      var options = { mode: mode, popClose: close };
                      $("#Parea").printArea(options);
                      $('.NoPrnt').show();
                      $('#AcYearID').show();
                  });

                  //$(function () {

                  //    var flt1 = 0.00;
                  //    var flt2 = 0.00;
                  //    var v1 = $($('.G_Totals1')[1]).html();
                  //    var v2 = $('[see=G_Totals]').html();
                  //    if ( v1.indexOf('(') !== -1 ) { 
                  //        v1 = v1.replace('(', '');
                  //        v1 = v1.replace(')', '');
                  //        v1 = v1.replace(',', '');
                          
                  //        flt1 =  parseFloat(v1) * -1;
                  //    }
                  //    else {
                  //        v1 = v1.replace(',', '');
                  //        flt1 = parseFloat(v1);
                  //    }
                  //    if (v2.indexOf('(') !== -1) {
                  //        v2 = v2.replace('(', '');
                  //        v2 = v2.replace(')', '');
                  //        v2 = v2.replace(',', '');
                  //        flt2 = parseFloat(v2) * -1;
                  //    }
                  //    else {
                  //        v2 = v2.replace(',', '');
                  //        flt2 = parseFloat(v2);
                  //    }
                  //    var tot = flt1 + flt2;
                  //    //$('#gTotal').html('Total : ' + tot);



                  //    $('#gTotal').html('<h3 style="text-align: right;">Total : <span style="text-decoration: overline;">'+$.number(tot,2)+'</span></h3>');

                  //})



              });//END OF DOC READY
    </script>
</asp:Content>
