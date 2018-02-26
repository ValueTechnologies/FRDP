<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageD.Master" AutoEventWireup="true" CodeBehind="accBSheet.aspx.cs" Inherits="FRDP.accBSheet" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="plugins/misc/jquery.PrintArea.js"></script>
       <div class="row-fluid">
                                <div class="span12">
                            
                            <div class="box gradient">

                                <div class="title">

                                    <h4>
                                        <span class="icon16 icomoon-icon-equalizer-2"></span>
                                        <span>Balance Sheet</span>
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
                    <td style="width: 50px;">
                        <strong>As of</strong></td>
                    <td>
                        <asp:TextBox ID="txFrom" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="txFrom_CalendarExtender" runat="server" Enabled="True" Format="dd MMMM yyyy" TargetControlID="txFrom">
                        </asp:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td style="width: 50px">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnView" runat="server" CssClass="btn btn-info" Text="View Balance Sheet" OnClick="btnView_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
            </table>
        </div>
        <br />
        <div id="Parea" class="pcontant" style="width: 100%">
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
                    <td>
                        <div id="AcYearID" class="<%:Session["CodeSt"] %>" tag="<%:Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy") %>" style="float: right; margin-right: 6px; text-align: right; vertical-align: top;">
                            Financial Year : <%:Convert.ToDateTime(Session["ActYr"]).ToString("MMMM yyyy")+"-"+Convert.ToDateTime(Session["ActYr2"]).ToString("yy") %><br />
                            <%:Convert.ToDateTime(Session["ActMth"]).ToString("MMMM yyyy") %>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; font-variant: small-caps; font-size: x-large; font-weight: bold;">Balance Sheet</td>
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
                                        <h3>
                                            <asp:Label ID="lblAcHead" runat="server" Text='<%# Eval("AcType") %>'></asp:Label>
                                        </h3>
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
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                            <div style="text-align: right;">
                                                                <strong>Total </strong>
                                                                <asp:Label ID="lblGrpH0" runat="server" Style="font-weight: 700" Text='<%# Bind("AcGroup") %>'></asp:Label>
                                                                &nbsp;:&nbsp;
                                                        <asp:Label ID="lblGrpH1" runat="server" Font-Overline="True" Style="font-weight: 700" Text='<%# Bind("Amount", "{0:#,#.00;(#,#.00)}") %>'></asp:Label>
                                                            </div>
                                                            <asp:SqlDataSource ID="dsAccounts" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT tblChartAc.AcCode + ' ' + tblChartAc.AcName AS Acc, SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) - SUM(ISNULL(vwVoucherDTL.AmountCre, 0)) AS Amount, tblChartAc.AcGroup FROM tblChartAc INNER JOIN vwVoucherDTL ON tblChartAc.AcID = vwVoucherDTL.AccEntryID INNER JOIN vwVoucherHDR ON vwVoucherDTL.VoucherID = vwVoucherHDR.VoucherID WHERE (tblChartAc.AcType = @AcType) AND (tblChartAc.AcGroup = @AcGroup) AND (tblChartAc.CompID = 16) AND (vwVoucherHDR.EntryDate &lt;= @DT) AND (vwVoucherHDR.Posted = 1) GROUP BY tblChartAc.AcCode + ' ' + tblChartAc.AcName, tblChartAc.AcGroup">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="lblAcHead" Name="AcType" PropertyName="Text" />
                                                                    <asp:ControlParameter ControlID="lblGrpH" Name="AcGroup" PropertyName="Text" />
                                                                    <asp:ControlParameter ControlID="txFrom" Name="DT" PropertyName="Text" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                        <h3 style="text-align: right;">Total
                                        <asp:Label ID="lblAcHead0" runat="server" Text='<%# Eval("AcType") %>'></asp:Label>
                                            &nbsp;:
                                        <asp:Label ID="lblAcHead1" runat="server" Text='<%# Eval("Amount", "{0:#,#.00;(#,#.00)}") %>' Font-Overline="True"></asp:Label>
                                        </h3>
                                        <asp:SqlDataSource ID="dsGrpHeads" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT tblChartAc.AcGroup, SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) - SUM(ISNULL(vwVoucherDTL.AmountCre, 0)) AS Amount FROM tblChartAc INNER JOIN vwVoucherDTL ON tblChartAc.AcID = vwVoucherDTL.AccEntryID INNER JOIN vwVoucherHDR ON vwVoucherDTL.VoucherID = vwVoucherHDR.VoucherID WHERE (tblChartAc.CompID = 16) AND (vwVoucherHDR.EntryDate &lt;= @DT) AND (tblChartAc.AcType = @AcType) AND (vwVoucherHDR.Posted = 1) GROUP BY tblChartAc.AcGroup">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="txFrom" Name="DT" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="lblAcHead" Name="AcType" PropertyName="Text" />
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
                                        <h3 style="text-align: right; text-decoration: overline;"><asp:Label ID="Label2" runat="server" Text='<%# Bind("Display") %>'></asp:Label>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Amount", "{0:#,#.00;(#,#.00)}") %>'></asp:Label>
                                        </h3>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle HorizontalAlign="Right" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="dsHeads" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT tblChartAc.AcType, SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) - SUM(ISNULL(vwVoucherDTL.AmountCre, 0)) AS Amount FROM tblChartAc INNER JOIN vwVoucherDTL ON tblChartAc.AcID = vwVoucherDTL.AccEntryID INNER JOIN vwVoucherHDR ON vwVoucherDTL.VoucherID = vwVoucherHDR.VoucherID INNER JOIN tblCOA ON tblChartAc.AcType = tblCOA.HeadName WHERE (tblChartAc.CompID = 16) AND (vwVoucherHDR.EntryDate &lt;= @DT) AND (tblCOA.HeadID = 1 OR tblCOA.HeadID = 2) AND (vwVoucherHDR.Posted = 1) GROUP BY tblChartAc.AcType">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txFrom" Name="DT" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
<%--                        <asp:SqlDataSource ID="dsHeads0" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) - SUM(ISNULL(vwVoucherDTL.AmountCre, 0)) AS Amount FROM tblChartAc INNER JOIN vwVoucherDTL ON tblChartAc.AcID = vwVoucherDTL.AccEntryID INNER JOIN vwVoucherHDR ON vwVoucherDTL.VoucherID = vwVoucherHDR.VoucherID INNER JOIN tblCOA ON tblChartAc.AcType = tblCOA.HeadName WHERE (tblChartAc.CompID = 16) AND (vwVoucherHDR.EntryDate &lt;= @DT) AND (tblCOA.HeadID = 1 OR tblCOA.HeadID = 2) AND (vwVoucherHDR.Posted = 1)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txFrom" Name="DT" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>--%>
                                                <asp:SqlDataSource ID="dsHeads0" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT Y.Amount, Display = Case when Y.Amount &gt; 0 THEN 'ASSETS (Retained Expenses) : ' ELSE 'LIABILITIES (Retained Earnings) : ' END from (
SELECT      Amount = CASE WHEN  SUM(ISNULL(vwVoucherDTL.AmountCre, 0))  &gt; SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) THEN (SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) - SUM(ISNULL(vwVoucherDTL.AmountCre, 0)))*-1  ELSE  SUM(ISNULL(vwVoucherDTL.AmountCre, 0)) - SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) END
FROM            tblChartAc INNER JOIN
                         vwVoucherDTL ON tblChartAc.AcID = vwVoucherDTL.AccEntryID INNER JOIN
                         vwVoucherHDR ON vwVoucherDTL.VoucherID = vwVoucherHDR.VoucherID INNER JOIN
                         tblCOA ON tblChartAc.AcType = tblCOA.HeadName
WHERE        (tblChartAc.CompID = 16) AND (vwVoucherHDR.EntryDate &lt;=@DT) AND (tblCOA.HeadID = 1 OR
                         tblCOA.HeadID = 2) AND (vwVoucherHDR.Posted = 1)
						 ) as Y">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txFrom" Name="DT" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="gvHeads0" runat="server" AutoGenerateColumns="False" BorderStyle="None" DataSourceID="dsHeads1" GridLines="None" ShowHeader="False" Width="100%">
                            <Columns>
                                <asp:TemplateField HeaderText="HeadName" SortExpression="HeadName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("HeadName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <h3>
                                            <asp:Label ID="lblAcHead2" runat="server" Text='<%# Eval("AcType") %>'></asp:Label>
                                        </h3>
                                        <div style="margin-left: 21px; margin-top: 5px; margin-bottom: 3px;">
                                            <asp:GridView ID="gvGrpHeads0" runat="server" AutoGenerateColumns="False" BorderStyle="None" DataSourceID="dsGrpHeads0" GridLines="None" ShowHeader="False" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="AcGroup" SortExpression="AcGroup">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("AcGroup") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblGrpH2" runat="server" Style="font-weight: 700" Text='<%# Bind("AcGroup") %>'></asp:Label>
                                                            <div style="margin-left: 18px; margin-top: 4px; margin-bottom: 4px;">
                                                                <asp:GridView ID="gvAccounts0" runat="server" AutoGenerateColumns="False" BorderStyle="None" DataSourceID="dsAccounts0" GridLines="None" ShowHeader="False" Width="100%">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="Acc" HeaderText="Acc" SortExpression="Acc" />
                                                                        <asp:BoundField DataField="Amount" DataFormatString="{0:#,#.00;(#,#.00)}" HeaderText="Amount" SortExpression="Amount">
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                            <div style="text-align: right;">
                                                                <strong>Total </strong>
                                                                <asp:Label ID="lblGrpH3" runat="server" Style="font-weight: 700" Text='<%# Bind("AcGroup") %>'></asp:Label>
                                                                &nbsp;:&nbsp;
                                                        <asp:Label ID="lblGrpH4" runat="server" Font-Overline="True" Style="font-weight: 700" Text='<%# Bind("Amount", "{0:#,#.00;(#,#.00)}") %>'></asp:Label>
                                                            </div>
                                                            <asp:SqlDataSource ID="dsAccounts0" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT tblChartAc.AcCode + ' ' + tblChartAc.AcName AS Acc, SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) - SUM(ISNULL(vwVoucherDTL.AmountCre, 0)) AS Amount, tblChartAc.AcGroup FROM tblChartAc INNER JOIN vwVoucherDTL ON tblChartAc.AcID = vwVoucherDTL.AccEntryID INNER JOIN vwVoucherHDR ON vwVoucherDTL.VoucherID = vwVoucherHDR.VoucherID WHERE (tblChartAc.AcType = @AcType) AND (tblChartAc.AcGroup = @AcGroup) AND (tblChartAc.CompID = 16) AND (vwVoucherHDR.EntryDate &lt;= @DT) AND (vwVoucherHDR.Posted = 1) GROUP BY tblChartAc.AcCode + ' ' + tblChartAc.AcName, tblChartAc.AcGroup">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="lblAcHead2" Name="AcType" PropertyName="Text" />
                                                                    <asp:ControlParameter ControlID="lblGrpH2" Name="AcGroup" PropertyName="Text" />
                                                                    <asp:ControlParameter ControlID="txFrom" Name="DT" PropertyName="Text" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                        <h3 style="text-align: right;">Total
                                        <asp:Label ID="lblAcHead3" runat="server" Text='<%# Eval("AcType") %>'></asp:Label>
                                            &nbsp;:
                                        <asp:Label ID="lblAcHead4" runat="server" Text='<%# Eval("Amount", "{0:#,#.00;(#,#.00)}") %>' Font-Overline="True"></asp:Label>
                                        </h3>
                                        <asp:SqlDataSource ID="dsGrpHeads0" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT tblChartAc.AcGroup, SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) - SUM(ISNULL(vwVoucherDTL.AmountCre, 0)) AS Amount FROM tblChartAc INNER JOIN vwVoucherDTL ON tblChartAc.AcID = vwVoucherDTL.AccEntryID INNER JOIN vwVoucherHDR ON vwVoucherDTL.VoucherID = vwVoucherHDR.VoucherID WHERE (tblChartAc.CompID = 16) AND (vwVoucherHDR.EntryDate &lt;= @DT) AND (tblChartAc.AcType = @AcType) AND (vwVoucherHDR.Posted = 1) GROUP BY tblChartAc.AcGroup">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="txFrom" Name="DT" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="lblAcHead2" Name="AcType" PropertyName="Text" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="dsHeads1" runat="server" ConnectionString="<%$ ConnectionStrings:VD_DB_ConnectionString %>" SelectCommand="SELECT tblChartAc.AcType, SUM(ISNULL(vwVoucherDTL.AmountDeb, 0)) - SUM(ISNULL(vwVoucherDTL.AmountCre, 0)) AS Amount FROM tblChartAc INNER JOIN vwVoucherDTL ON tblChartAc.AcID = vwVoucherDTL.AccEntryID INNER JOIN vwVoucherHDR ON vwVoucherDTL.VoucherID = vwVoucherHDR.VoucherID INNER JOIN tblCOA ON tblChartAc.AcType = tblCOA.HeadName WHERE (tblChartAc.CompID = 16) AND (vwVoucherHDR.EntryDate &lt;= @DT) AND (tblCOA.HeadID = 5) AND (vwVoucherHDR.Posted = 1) GROUP BY tblChartAc.AcType">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txFrom" Name="DT" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="text-align: right; margin-right: 100px; vertical-align: top;">&nbsp;</td>
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
        <table style="width: 100%;">

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

                                  $('.NoPrnt').hide();
                                  var mode = 'iframe'; // popup
                                  var close = mode == "popup";
                                  var options = { mode: mode, popClose: close };
                                  $("#Parea").printArea(options);
                                  $('.NoPrnt').show();



                              });
                          });
    </script>
</asp:Content>
